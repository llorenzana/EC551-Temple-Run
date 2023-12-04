//includes

//constants
#define COIN_SOUND_PIN 13
#define GAME_OVER_PIN 13

#define BAUDRATE 9600

void setup() {
  // put your setup code here, to run once:
   Serial.begin(BAUDRATE);
}

void loop() {
  if (Serial.available() > 0) {
    char receivedChar = Serial.read(); // Read the incoming byte

    // Differentiate based on the received character
    if (receivedChar == 'A') { //Signal for game over
      digitalWrite(GAME_OVER_PIN, HIGH);

    } else if (receivedChar == 'B') { //Signal for coin recieved
      digitalWrite(COIN_SOUND_PIN, HIGH);
    }
    // Add more conditions as needed for different signals
  }
}