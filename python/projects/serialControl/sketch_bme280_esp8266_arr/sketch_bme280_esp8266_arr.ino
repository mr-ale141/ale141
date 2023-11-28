/*
Тестировалось на Arduino IDE 1.8.5
Дата тестирования 03.10.2019г.
*/ 
 
#include <ESP8266WiFi.h>                                // Подключаем библиотеку ESP8266WiFi
#include <Ticker.h>
#include <Wire.h>                                       // Подключаем библиотеку Wire
#include <ESP_EEPROM.h>
#include <NTPClient.h>
#include <WiFiUdp.h>
#include <Adafruit_GFX.h>    // Core graphics library
#include <Adafruit_ST7789.h> // Hardware-specific library for ST7789
#include <SPI.h>

#include <Adafruit_BME280.h>                            // Подключаем библиотеку Adafruit_BME280
#include <Adafruit_Sensor.h>                            // Подключаем библиотеку Adafruit_Sensor
 
#define SEALEVELPRESSURE_HPA (1013.25)                  // Задаем высоту
#define TFT_DC D3 // TFT DC pin is connected
#define TFT_RST D4 // TFT RST pin is connected
#define TFT_CS -1 // TFT CS pin is NOT connected
Adafruit_ST7789 tft = Adafruit_ST7789(TFT_CS, TFT_DC, TFT_RST);
 
Adafruit_BME280 bme;                                    // Установка связи по интерфейсу I2C
Ticker ticker;
Ticker tickerTft;
 
const char* ssid = "Neon400";          // Название Вашей WiFi сети
const char* password = "Zanoza21";     // Пароль от Вашей WiFi сети

struct FlashDataStruct {
  int delta;
  unsigned long pressure;
  unsigned long pressure_array[6];
  unsigned long time_array[6];
  unsigned long sumX;
  unsigned long sumY;
  unsigned long sumX2;
  unsigned long sumXY;
  float a;
  int hour;
  int minute;
  int seconds;
} FlashData;

boolean isWait = true;
boolean isWaitTft = true;
String tftStr;
uint16_t color;
 
WiFiServer server(80);                                  // Указываем порт Web-сервера
String header;

WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "pool.ntp.org");
 
void setup() {
  Serial.begin(115200);                                 // Скорость передачи 115200
  bool status;
  
  tft.init(240, 240, SPI_MODE2);
  tft.fillScreen(ST77XX_BLACK);
  color = 0x0821;
                                                       
  if (!bme.begin(0x76)) {                               // Проверка инициализации датчика
    Serial.println("Could not find a valid BME280 sensor, check wiring!"); // Печать, об ошибки инициализации.
    while (1);                                          // Зацикливаем
  }
 
  Serial.print("Connecting to ");                       // Отправка в Serial port 
  Serial.println(ssid);                                 // Отправка в Serial port 
  WiFi.begin(ssid, password);                           // Подключение к WiFi Сети
  while (WiFi.status() != WL_CONNECTED) {               // Проверка подключения к WiFi сети
    delay(500);                                         // Пауза
    Serial.print(".");                                  // Отправка в Serial port 
  }
 
  Serial.println("");                                   // Отправка в Serial port 
  Serial.println("WiFi connected.");                    // Отправка в Serial port 
  Serial.println("IP address: ");                       // Отправка в Serial port 
  Serial.println(WiFi.localIP());                       // Отправка в Serial port 
  server.begin();
  timeClient.begin();
  timeClient.setTimeOffset(10800);
  Serial.println(" ");

  FlashData.pressure = aver_sens();
  for (byte i = 0; i < 6; i++) {
    FlashData.pressure_array[i] = FlashData.pressure;
    FlashData.time_array[i] = i;
  }
  FlashData.hour = timeClient.getHours();
  FlashData.minute = timeClient.getMinutes();
  FlashData.seconds = timeClient.getSeconds();

  EEPROM.begin(sizeof(FlashDataStruct));
  if(EEPROM.percentUsed()<0) {
    EEPROM.put(0, FlashData);
    boolean ok = EEPROM.commit();
    Serial.println((ok) ? "Commit first data in EEPROM OK" : "Commit first data in EEPROM failed");
  } else {
    EEPROM.get(0, FlashData);
    Serial.println("Read old data from EEPROM");   
  }
  updateFlashData();
  ticker.attach(600, itsTime);
  tickerTft.attach(10, itsTimeTft);
}
 
void loop(){
  if (Serial.available()) {
      char ch = Serial.read();
      if (ch == 'f')
      {
        tft.enableDisplay(false);
        Serial.println("Display OFF OK!");
      }
      else if (ch == 't')
      {
        tft.enableDisplay(true);
        Serial.println("Display ON OK!");
      }
      else if (ch == 'r')
      {
        color = ST77XX_RED;
        Serial.println("OK!");
      }
      else if (ch == 'g')
      {
        color = ST77XX_GREEN;
        Serial.println("OK!");
      }
      else if (ch == 'b')
      {
        color = ST77XX_BLUE;
        Serial.println("OK!");
      }
      else if (ch == 'w')
      {
        color = ST77XX_WHITE;
        Serial.println("OK!");
      }
      else if (ch == 'c')
      {
        color = ST77XX_CYAN;
        Serial.println("OK!");
      }
      else if (ch == 'm')
      {
        color = ST77XX_MAGENTA;
        Serial.println("OK!");
      }
      else if (ch == 'y')
      {
        color = ST77XX_YELLOW;
        Serial.println("OK!");
      }
      else if (ch == 'o')
      {
        color = ST77XX_ORANGE;
        Serial.println("OK!");
      }
      else if (ch == 's')
      {
        color = 0x0821;
        Serial.println("OK!");
      }
  }
  if (!isWait)
  {
    updateFlashData();
  }
  if (!isWaitTft)
  {
    printTftData();
  }
  WiFiClient client = server.available();
  if (client) {                                         
    Serial.println("New Client.");
    String currentLine = "";
    while (client.connected()) {
      if (client.available()) { 
        char c = client.read();
        Serial.write(c);
        header += c;
        if (c == '\n') {
          if (currentLine.length() == 0) {
            client.println("HTTP/1.1 200 OK");
            client.println("Content-type:text/html ");
            client.println("Connection: close");
            client.println("Refresh: 600"); 
            client.println();
            client.println("<!DOCTYPE html><html>");
            client.println("<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
            client.println("<meta charset='UTF-8'>");
            client.println("<link rel=\"icon\" href=\"data:,\">");
            client.println("<style>body { text-align: center; font-family: \"Trebuchet MS\", Arial;}");
            client.println("table { border-collapse: collapse; width:40%; margin-left:auto; margin-right:auto; }");
            client.println("th { padding: 12px; background-color: #0043af; }");
            client.println("tr { border: 1px solid #ddd; padding: 12px; }");
            client.println("tr:hover { background-color: #bcbcbc; }");
            client.println("td { border: none; padding: 12px; }");
            client.println(".sensor { font-weight: bold; padding: 1px; }");
            client.println("</style></head><body><h1>Метеостанция на BME280 и ESP8266</h1>");
            client.println("<h3>Если изменение давления нижу -50 жди осадков!</h3>");
            client.println("<table><tr><th>Параметр</th><th>Показания</th></tr>");
            client.println("<tr><td>Температура</td><td><span class=\"sensor\">");
            client.println(bme.readTemperature());
            client.println(" *C</span></td></tr>");    
            client.println("<tr><td>Давление</td><td><span class=\"sensor\">");
            client.println(FlashData.pressure / 100.0F);
            client.println(" hPa</span></td></tr>");
            client.println("<tr><td>Давление</td><td><span class=\"sensor\">");
            client.println(int(FlashData.pressure * 0.0075006375541921));
            client.println(" mmHg</span></td></tr>");
            client.println("<tr><td>Влажность</td><td><span class=\"sensor\">");
            client.println(bme.readHumidity());
            client.println(" %</span></td></tr>");
            client.println("<tr><td>Изменение давления</td><td><span class=\"sensor\">");
            client.println(FlashData.delta);
            client.println("</span></td></tr>");
            client.println("<tr><td>Время проверки</td><td><span class=\"sensor\">");
            client.printf("%02d:%02d:%02d", FlashData.hour, FlashData.minute, FlashData.seconds);
            client.println();
            client.println("</span></td></tr>");
            client.println("</body><p>");
            client.printf("| %.2f | %.2f | %.2f | %.2f | %.2f | %.2f |", FlashData.pressure_array[0] / 100.0F, 
                                                                         FlashData.pressure_array[1] / 100.0F, 
                                                                         FlashData.pressure_array[2] / 100.0F, 
                                                                         FlashData.pressure_array[3] / 100.0F, 
                                                                         FlashData.pressure_array[4] / 100.0F, 
                                                                         FlashData.pressure_array[5] / 100.0F);
            client.println();
            client.println("</p></html>");
            client.println();
            break;
          } else { 
            currentLine = "";
          }
        } else if (c != '\r') {  
          currentLine += c;      
        }
      }
      else
      {
        Serial.println("Client not available.");
        break;
      }
    }
    header = "";
    client.stop();
    Serial.println("Client disconnected.");
    Serial.println("");
  }
}

void itsTime()
{
  isWait = false;
}

void itsTimeTft()
{
  isWaitTft = false;
}

unsigned long aver_sens() {
  unsigned long pressure = 0;
  for (byte i = 0; i < 10; i++) {
    pressure += bme.readPressure();
  }
  unsigned long aver_pressure = pressure / 10;
  return aver_pressure;
}

void sendDataInSerial()
{
  unsigned long aver_pressure = aver_sens();
  Serial.print("key1");
  Serial.print(",");
  Serial.print(bme.readTemperature());
  Serial.print(",");
  Serial.print(int(aver_pressure * 0.0075006375541921));
  Serial.print(",");
  Serial.print(bme.readHumidity());
  Serial.print(",");
  Serial.print(FlashData.delta);
  Serial.print(",");
  Serial.printf("%02d:%02d:%02d", FlashData.hour, FlashData.minute, FlashData.seconds);
  Serial.println();

  Serial.print("key2");
  Serial.print(",");
  for (int i =0; i < 6; i++)
  {
    Serial.print(FlashData.pressure_array[i]);
    if (i != 5) Serial.print(",");
  }
  Serial.println();
}

void updateFlashData()
{
  Serial.println("-----------DATA-----------");
  for (int i =0; i < 6; i++)
  {
    Serial.print("[");
    Serial.print(i);
    Serial.print("] = ");
    Serial.println(FlashData.pressure_array[i]);
  }
  Serial.println("--------------------------");
  timeClient.update();
  FlashData.pressure = aver_sens();
  for (byte i = 0; i < 5; i++) {
    FlashData.pressure_array[i] = FlashData.pressure_array[i + 1];
  }
  FlashData.pressure_array[5] = FlashData.pressure; 
  FlashData.sumX = 0;
  FlashData.sumY = 0;
  FlashData.sumX2 = 0;
  FlashData.sumXY = 0;
  for (int i = 0; i < 6; i++) {
    FlashData.sumX += FlashData.time_array[i];
    FlashData.sumY += (long)FlashData.pressure_array[i];
    FlashData.sumX2 += FlashData.time_array[i] * FlashData.time_array[i];
    FlashData.sumXY += (long)FlashData.time_array[i] * FlashData.pressure_array[i];
  }
  FlashData.a = 0;
  FlashData.a = (long)6 * FlashData.sumXY;
  FlashData.a = FlashData.a - (long)FlashData.sumX * FlashData.sumY;
  FlashData.a = (float)FlashData.a / (6 * FlashData.sumX2 - FlashData.sumX * FlashData.sumX);
  FlashData.delta = FlashData.a * 6; 
  FlashData.hour = timeClient.getHours();
  FlashData.minute = timeClient.getMinutes();
  FlashData.seconds = timeClient.getSeconds();

  EEPROM.put(0, FlashData);
  boolean ok = EEPROM.commit();
  Serial.println((ok) ? "Commit EEPROM OK" : "Commit EEPROM failed");
  Serial.println("Temp, Press, Hum, DeltaPress, Time");
  Serial.print(bme.readTemperature());
  Serial.print(", ");
  Serial.print(aver_sens() / 100.0F);
  Serial.print(", ");
  Serial.print(bme.readHumidity());
  Serial.print(", ");
  Serial.print(FlashData.delta);
  Serial.print(", ");
  Serial.printf("%02d:%02d:%02d", FlashData.hour, FlashData.minute, FlashData.seconds);
  Serial.println();
  isWait = true;
}

void drawtext(String text, int x, int y) {
  tft.setCursor(x, y);
  tft.setTextColor(color);
  tft.setTextSize(2);
  tft.setTextWrap(true);
  tft.print(text);
}

void printTftData()
{
  sendDataInSerial();
  tft.fillScreen(ST77XX_BLACK);
  tftStr = "Temp : " + String(bme.readTemperature()) + " *C";
  drawtext(tftStr, 0, 0);
  tftStr = "Press: " + String(FlashData.pressure / 100.0F) + " hPa";
  drawtext(tftStr, 0, 20);
  tftStr = "Press: " + String(int(FlashData.pressure * 0.0075006375541921)) + " mmHg";
  drawtext(tftStr, 0, 40);
  tftStr = "Hum  : " + String(bme.readHumidity()) + " %";
  drawtext(tftStr, 0, 60);
  tftStr = "Delta: " + String(FlashData.delta);
  drawtext(tftStr, 0, 80);
  tftStr = "Time : " + String(FlashData.hour) + ':' + String(FlashData.minute) + ':' + String(FlashData.seconds);
  drawtext(tftStr, 0, 100);
  tftStr = "[ " + String(FlashData.pressure_array[0] / 100.0F) + " ]\n" +
           "[ " + String(FlashData.pressure_array[1] / 100.0F) + " ]\n" +
           "[ " + String(FlashData.pressure_array[2] / 100.0F) + " ]\n" +
           "[ " + String(FlashData.pressure_array[3] / 100.0F) + " ]\n" +
           "[ " + String(FlashData.pressure_array[4] / 100.0F) + " ]\n" +
           "[ " + String(FlashData.pressure_array[5] / 100.0F) + " ]\n";
  drawtext(tftStr, 0, 120);
  isWaitTft = true;
}
