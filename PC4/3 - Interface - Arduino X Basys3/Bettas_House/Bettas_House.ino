/* Simple PID control system for temperature control
 *  Pin 7       -> Temperature sensor (DS18B20)
 */

#include <DallasTemperature.h>

#define UART_BAUDRATE   9600

#define TEMP_SENSOR_PIN 7
#define TEMP_SETPOINT   25.00
#define TEMP_INTERVAL   1000

OneWire Wire(TEMP_SENSOR_PIN);
DallasTemperature bus(&Wire);

long sensor_timer;

void send_UART(float t)
{
  // Convert temperature to unsigned fixed point 
  // (6 bits magnitude + 2 bits decimal)
  int mag = (int)t;
  int dec = (int)((t - mag) * 100);

  if (dec == 0 || dec < 13)
    dec = 0;
  else if (dec > 12 && dec < 37)
    dec = 1;
  else if (dec > 36 && dec < 63)
    dec = 2;
  else if (dec > 62 && dec < 87)
    dec = 3;
  else
  {
    dec = 0;
    mag += 1;
  }

  // Check if magnitude is 5 bits length
  if (mag < 0.0 || mag >= 32.0)
    return;

  // Mount fixed point byte
  byte data;
  
  data = (mag << 2) | dec;

  // Send data via UART
  Serial.write(data);
  
  digitalWrite(LED_BUILTIN, HIGH);
  delay(10);
  digitalWrite(LED_BUILTIN, LOW);
}

float getTemperature(void)
{
  if (millis() < sensor_timer + TEMP_INTERVAL)
    return (404.00);
  
  sensor_timer = millis();
  
  bus.requestTemperatures();

  float t = bus.getTempCByIndex(0);

  if (t != DEVICE_DISCONNECTED_C)
  {
    send_UART(t);
    
    return (t);
  }

  return (404.00);
}

void setup(void)
{
  Serial.begin(UART_BAUDRATE);
  while (!Serial)
    ;

  pinMode(LED_BUILTIN, OUTPUT);
        
  bus.begin();

  sensor_timer = millis();

  //send_UART(21.0);
}

void loop(void)
{
  getTemperature();
}
