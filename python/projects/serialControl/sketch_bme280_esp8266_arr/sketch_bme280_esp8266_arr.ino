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

#include <Adafruit_BME280.h>                            // Подключаем библиотеку Adafruit_BME280
#include <Adafruit_Sensor.h>                            // Подключаем библиотеку Adafruit_Sensor
 
#define SEALEVELPRESSURE_HPA (1013.25)                  // Задаем высоту
 
Adafruit_BME280 bme;                                    // Установка связи по интерфейсу I2C
Ticker ticker;
 
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
 
WiFiServer server(80);                                  // Указываем порт Web-сервера
String header;

WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "pool.ntp.org");
 
void setup() {
  Serial.begin(115200);                                 // Скорость передачи 115200
  bool status;
                                                       
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
  sendDataInSerial();
  ticker.attach(600, itsTime);
}
 
void loop(){
  if (!isWait)
  {
    updateFlashData();
  }
  WiFiClient client = server.available();               // Получаем данные, посылаемые клиентом 
  if (client) {                                         
//    Serial.println("New Client.");                      // Отправка "Новый клиент"
    String currentLine = "";                            // Создаем строку для хранения входящих данных от клиента
    while (client.connected()) {                        // Пока есть соединение с клиентом 
      if (client.available()) {                         // Если клиент активен 
        char c = client.read();                         // Считываем посылаемую информацию в переменную "с"
//        Serial.write(c);                                // Отправка в Serial port 
        header += c;
        if (c == '\n') {                                // Вывод HTML страницы 
          if (currentLine.length() == 0) {
            client.println("HTTP/1.1 200 OK");          // Стандартный заголовок HT
            client.println("Content-type:text/html ");
            client.println("Connection: close");        // Соединение будет закрыто после завершения ответа
            client.println("Refresh: 600");              // Автоматическое обновление каждые 10 мин 
            client.println();
            client.println("<!DOCTYPE html><html>");    // Веб-страница создается с использованием HTML
            client.println("<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
            client.println("<meta charset='UTF-8'>");   // Делаем русскую кодировку
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
            client.println(aver_sens() / 100.0F);
            client.println(" hPa</span></td></tr>");
            client.println("<tr><td>Давление</td><td><span class=\"sensor\">");
            client.print(int(aver_sens() * 0.0075006375541921));
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
    }
    header = "";
    client.stop();
//    Serial.println("Client disconnected.");
//    Serial.println("");
  }
  sendDataInSerial();
}

void itsTime()
{
  isWait = false;
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
