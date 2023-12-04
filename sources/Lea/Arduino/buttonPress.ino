uint8_t buf[8] = { 0 }; //Keyboard report buffer



#define PIN_R 7 // Pin for r

void setup() {

  Serial.begin(9600); // Setup Serial communication

  //Set pinmode of Input pins
  pinMode(PIN_R, INPUT);

}

void loop() {


//When button representing R is pressed

if (digitalRead(PIN_R) == HIGH) { buf[2] = 21; // r keycode

  Serial.write(buf, 8); // Send keypress

  releaseKey();

}

}

// Function for Key Release

void releaseKey() {

buf[0] = 0;

buf[2] = 0;

Serial.write(buf, 8); // Send Release key

}
