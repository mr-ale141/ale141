#include <mbed.h>
#include <rtos.h>

#define TIME_BLINK_GREEN_BEFOR_RED         3000
#define CAR_MIN_TIME_GREEN_LIGHT           5000
#define HUMAN_TIME_GREEN_LIGHT             10000
#define TIMEOUT_BETWEEN_TRAFIC_LIGHT       1000
#define LOW                                0
#define HIGH                               1

struct {
	DigitalOut red = DigitalOut(P0_20, LOW);
	DigitalOut yellow = DigitalOut(P0_22, LOW);
	DigitalOut green = DigitalOut(P0_24, HIGH);
} carTrafficLights;

struct {
	DigitalOut red = DigitalOut(P1_0, HIGH);
	DigitalOut green = DigitalOut(P0_11, LOW);
} humanTrafficLights;

InterruptIn button(P1_1);
DigitalOut userLed = DigitalOut(P0_15);

Semaphore carSemaphore(1);
Semaphore humanSemaphore(1);
Semaphore blinkSemaphore(1);

bool needRoadHuman = false;

Thread threadCar;
Thread threadHuman;
Thread threadBlink;

void carTrafficLightsHandler()
{
	for (;;)
	{
		carSemaphore.wait();
		Thread::wait(TIMEOUT_BETWEEN_TRAFIC_LIGHT);
		carTrafficLights.yellow = HIGH;
		Thread::wait(2000);
		carTrafficLights.red = LOW;
		carTrafficLights.yellow = LOW;
		carTrafficLights.green = HIGH;
		Thread::wait(CAR_MIN_TIME_GREEN_LIGHT);
		needRoadHuman = false;
	}
}

void blinkGreenBeforeRed()
{
	for (;;)
	{
		blinkSemaphore.wait();
		if (carTrafficLights.green)
		{
			carTrafficLights.green = LOW;
			Thread::wait(500);
			carTrafficLights.green = HIGH;
			Thread::wait(500);
			carTrafficLights.green = LOW;
			Thread::wait(500);
			carTrafficLights.green = HIGH;
			Thread::wait(500);
			carTrafficLights.green = LOW;
			Thread::wait(500);
			carTrafficLights.green = HIGH;
			Thread::wait(500);
			carTrafficLights.green = LOW;
			carTrafficLights.red = HIGH;
			humanSemaphore.release();
		}
		else if (humanTrafficLights.green)
		{
			humanTrafficLights.green = LOW;
			Thread::wait(500);
			humanTrafficLights.green = HIGH;
			Thread::wait(500);
			humanTrafficLights.green = LOW;
			Thread::wait(500);
			humanTrafficLights.green = HIGH;
			Thread::wait(500);
			humanTrafficLights.green = LOW;
			Thread::wait(500);
			humanTrafficLights.green = HIGH;
			Thread::wait(500);
			humanTrafficLights.green = LOW;
			humanTrafficLights.red = HIGH;
			carSemaphore.release();
		}
	}
}

void humanTrafficLightsHandler()
{
	for (;;)
	{
		humanSemaphore.wait();
		if (carTrafficLights.green)
		{
			blinkSemaphore.release();
			humanSemaphore.wait();
			Thread::wait(TIMEOUT_BETWEEN_TRAFIC_LIGHT);
			if (carTrafficLights.red)
			{
				humanTrafficLights.red = LOW;
				humanTrafficLights.green = HIGH;
			}
			Thread::wait(HUMAN_TIME_GREEN_LIGHT - TIME_BLINK_GREEN_BEFOR_RED);
			blinkSemaphore.release();
		}
	}
}

void buttonHandler()
{
	if (button)
	{
		if (needRoadHuman == false)
			humanSemaphore.release();
		needRoadHuman = true;
	}
}


int main()
{
	button.mode(PullDown);

	carSemaphore.wait();
	humanSemaphore.wait();
	blinkSemaphore.wait();

	threadCar.start(carTrafficLightsHandler);
	threadHuman.start(humanTrafficLightsHandler);
	threadBlink.start(blinkGreenBeforeRed);
	button.rise(&buttonHandler);

	while (true)
		userLed = button.read();
}
