#include <mbed.h>
#include <rtos.h>

#define TIME_BLINK_BEFOR_RED               3000
#define CAR_TIME_GREEN_LIGHT               5000
#define HUMAN_TIME_GREEN_LIGHT             10000
#define TIMEOUT_BETWEEN_TRAFIC_LIGHT       1000
#define LOW                                0
#define HIGH                               1

struct {
	DigitalOut redLight = DigitalOut(P0_20, LOW);
	DigitalOut yellowLight = DigitalOut(P0_22, LOW);
	DigitalOut greenLight = DigitalOut(P0_24, HIGH);
} carTrafficLights;

struct {
	DigitalOut redLight = DigitalOut(P1_0, HIGH);
	DigitalOut greenLight = DigitalOut(P0_11, LOW);
} humanTrafficLights;

DigitalIn button = DigitalIn(P1_1);
DigitalOut userLed = DigitalOut(P0_15);

Semaphore carSemaphore(1);
Semaphore humanSemaphore(1);
Semaphore blinkSemaphore(1);

bool needRoadHuman = false;

Thread threadCar;
Thread threadHuman;
Thread threadBlink;
Thread threadButton;

void carTrafficLightsHandler()
{
	for (;;)
	{
		carSemaphore.wait();
		Thread::wait(TIMEOUT_BETWEEN_TRAFIC_LIGHT);
		carTrafficLights.yellowLight = HIGH;
		Thread::wait(2000);
		carTrafficLights.redLight = LOW;
		carTrafficLights.yellowLight = LOW;
		carTrafficLights.greenLight = HIGH;
		Thread::wait(CAR_TIME_GREEN_LIGHT);
		needRoadHuman = false;
	}
}

void blinkGreenAndRed()
{
	for (;;)
	{
		blinkSemaphore.wait();
		if (carTrafficLights.greenLight)
		{
			carTrafficLights.greenLight = LOW;
			Thread::wait(500);
			carTrafficLights.greenLight = HIGH;
			Thread::wait(500);
			carTrafficLights.greenLight = LOW;
			Thread::wait(500);
			carTrafficLights.greenLight = HIGH;
			Thread::wait(500);
			carTrafficLights.greenLight = LOW;
			Thread::wait(500);
			carTrafficLights.greenLight = HIGH;
			Thread::wait(500);
			carTrafficLights.greenLight = LOW;
			carTrafficLights.redLight = HIGH;
			humanSemaphore.release();
		}
		else if (humanTrafficLights.greenLight)
		{
			humanTrafficLights.greenLight = LOW;
			Thread::wait(500);
			humanTrafficLights.greenLight = HIGH;
			Thread::wait(500);
			humanTrafficLights.greenLight = LOW;
			Thread::wait(500);
			humanTrafficLights.greenLight = HIGH;
			Thread::wait(500);
			humanTrafficLights.greenLight = LOW;
			Thread::wait(500);
			humanTrafficLights.greenLight = HIGH;
			Thread::wait(500);
			humanTrafficLights.greenLight = LOW;
			humanTrafficLights.redLight = HIGH;
			carSemaphore.release();
		}
	}
}

void humanTrafficLightsHandler()
{
	for (;;)
	{
		humanSemaphore.wait();
		if (carTrafficLights.greenLight)
		{
			blinkSemaphore.release();
			humanSemaphore.wait();
			Thread::wait(TIMEOUT_BETWEEN_TRAFIC_LIGHT);
			if (carTrafficLights.redLight)
			{
				humanTrafficLights.redLight = LOW;
				humanTrafficLights.greenLight = HIGH;
			}
			Thread::wait(HUMAN_TIME_GREEN_LIGHT - TIME_BLINK_BEFOR_RED);
			blinkSemaphore.release();
		}
	}
}

void buttonHandler()
{
	for (;;)
	{
		if (button)
		{
			if (button)
			{
				userLed = HIGH;
				if (needRoadHuman == false)
				{
					humanSemaphore.release();
				}
				needRoadHuman = true;
			}
			while (button) continue;
			userLed = LOW;
		}
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
	threadBlink.start(blinkGreenAndRed);
	threadButton.start(buttonHandler);
}
