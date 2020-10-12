void setup() {
  pinMode(9, OUTPUT);
  Serial.begin(9600);
}

float val;

void loop() {
  while (Serial.available()) {
    switch (Serial.read()) {
      case 0:
        val = 130.81;
        break;
      case 1:
        val = 146.83;
        break;
      case 2:
        val = 164.81;
        break;
      case 3:
        val = 174.61;
        break;
      case 4:
        val = 196.00;
        break;
      case 5:
        val = 220.00;
        break;
      case 6:
        val = 246.94;
        break;
      case 7:
        val = 261.63;
        break;
      case 8:
        val = 293.66;
        break;
      case 9:
        val = 329.63;
        break;
      case 10:
        val = 349.23;
        break;
      case 11:
        val = 392.00;
        break;
      case 12:
        val = 440.00;
        break;
      case 13:
        val = 493.88;
        break;
    }
    tone(9, val);
  }

}
