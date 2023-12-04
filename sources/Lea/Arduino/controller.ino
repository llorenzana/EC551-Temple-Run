#include <LiquidCrystal_I2C.h>
#include "Wire.h" // This library allows you to communicate with I2C devices.

uint8_t buf[8] = { 0 }; //Keyboard report buffer

#define PIN_A 7 // Pin for a
#define PIN_D 6 // Pin for d
#define PIN_W 5 // Pin for w
#define PIN_R 4 // Pin for reset

const int MPU_ADDR = 0x68; // I2C address of the MPU-6050. If AD0 pin is set to HIGH, the I2C address will be 0x69.
int16_t accelerometer_x, accelerometer_y, accelerometer_z; // variables for accelerometer raw data
char tmp_str[7]; // temporary variable used in convert function

LiquidCrystal_I2C lcd(0x20, 16, 2); // Format -> (Address, Width, Height)

unsigned long previousMillis = 0;
const long interval = 590; // Interval in milliseconds
int score = 0;
bool startScoring = false;

void setup() {
  // Initialize LCD
  lcd.init();
  lcd.backlight();
  lcd.setCursor(0, 0);
  lcd.print("551 TEMPLE RUN");
  lcd.setCursor(0, 1);
  lcd.print("SCORE: 0");

  // Set pinmode of Input pins
  pinMode(PIN_R, INPUT);
  pinMode(PIN_W, INPUT);
	pinMode(PIN_A, INPUT);
  pinMode(PIN_D, INPUT);

  //Accelerometer
  Serial.begin(9600);
  Wire.begin();
  Wire.beginTransmission(MPU_ADDR); // Begins a transmission to the I2C slave (GY-521 board)
  Wire.write(0x6B); // PWR_MGMT_1 register
  Wire.write(0); // set to zero (wakes up the MPU-6050)
  Wire.endTransmission(true);
}

void loop() {
  Wire.beginTransmission(MPU_ADDR);
  Wire.write(0x3B); // starting with register 0x3B (ACCEL_XOUT_H) [MPU-6000 and MPU-6050 Register Map and Descriptions Revision 4.2, p.40]
  Wire.endTransmission(false); // the parameter indicates that the Arduino will send a restart. As a result, the connection is kept active.
  Wire.requestFrom(MPU_ADDR, 7*2, true); // request a total of 7*2=14 registers
  
  // "Wire.read()<<8 | Wire.read();" means two registers are read and stored in the same variable
  accelerometer_x = Wire.read()<<8 | Wire.read(); // reading registers: 0x3B (ACCEL_XOUT_H) and 0x3C (ACCEL_XOUT_L)
  accelerometer_y = Wire.read()<<8 | Wire.read(); 
  accelerometer_z = Wire.read()<<8 | Wire.read(); // reading registers: 0x3F (ACCEL_ZOUT_H) and 0x40 (ACCEL_ZOUT_L)
  delay(250);

  if (digitalRead(PIN_R) == HIGH) {
      buf[2] = 21; // r 
  	  Serial.write(buf, 8); // Send keypress
  	  releaseKey();
      score = 0; // Reset the score
      previousMillis= millis(); // Reset the timer
      startScoring = true; // Enable scoring
      // Update the display immediately after reset
      lcd.clear();
      lcd.setCursor(0, 0);
      lcd.print("551 TEMPLE RUN");
      lcd.setCursor(0, 1);
      lcd.print("SCORE: ");
      lcd.print(score);
      delay(250);
  }

   //When button representing W is pressed
  if (digitalRead(PIN_W) == HIGH || accelerometer_z < 9000 ) {
	  buf[2] = 26; // W keycode
	  Serial.write(buf, 8); // Send keypress
	  releaseKey();
}
  
  //When button representing A is pressed
  if (digitalRead(PIN_A) == HIGH || accelerometer_y > 4500) { 
    buf[2] = 4; // A keycode
	  Serial.write(buf, 8); // Send keypress
	  releaseKey();
}
  
  //When button representing A is pressed

  if (digitalRead(PIN_D) == HIGH || accelerometer_y < -4500) { 
    buf[2] = 7; // A keycode
	  Serial.write(buf, 8); // Send keypress
	  releaseKey();
}

  printscore();
}

// Function for Key Release
void releaseKey() {
buf[0] = 0;
buf[2] = 0;
Serial.write(buf, 8); // Send Release key
}


void printscore() {
  unsigned long currentMillis = millis();

  if (startScoring && currentMillis - previousMillis >= interval) {
    previousMillis = currentMillis;
    score += 5;
    lcd.setCursor(0, 0);
    lcd.print("551 TEMPLE RUN");
    lcd.setCursor(0, 1);
    lcd.print("SCORE: ");
    lcd.print(score);
  }
}

