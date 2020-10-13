void setup() {
  pinMode(9, OUTPUT);   //using buzzer on pin 9
  Serial.begin(9600);
}

float freq; //to store frequency that matches serial data

void loop() {
  while (Serial.available()) {
    //processing writes an integer that corresponds to a key
    //white keys are 0 - 13
    //black keys are 100 - 109
    //negative value or anything not within the above ranges is noTone()
    //frequencies from https://pages.mtu.edu/~suits/notefreqs.html
    switch (Serial.read()) {
      case 0:
        freq = 130.81;
        break;
      case 1:
        freq = 146.83;
        break;
      case 2:
        freq = 164.81;
        break;
      case 3:
        freq = 174.61;
        break;
      case 4:
        freq = 196.00;
        break;
      case 5:
        freq = 220.00;
        break;
      case 6:
        freq = 246.94;
        break;
      case 7:
        freq = 261.63;
        break;
      case 8:
        freq = 293.66;
        break;
      case 9:
        freq = 329.63;
        break;
      case 10:
        freq = 349.23;
        break;
      case 11:
        freq = 392.00;
        break;
      case 12:
        freq = 440.00;
        break;
      case 13:
        freq = 493.88;
        break;
      case 100:
        freq = 138.59;
        break;
      case 101:
        freq = 155.56;
        break;
      case 102:
        freq = 185.00;
        break;
      case 103:
        freq = 207.65;
        break;
      case 104:
        freq = 233.08;
        break;
      case 105:
        freq = 277.18;
        break;
      case 106:
        freq = 311.13;
        break;
      case 107:
        freq = 369.99;
        break;
      case 108:
        freq = 415.30;
        break;
      case 109:
        freq = 466.16;
        break;
      default:
        freq = 0;
        break;
    }
    //once we have the frequency play it if it should be played, otherwise noTone()
    if (freq > 0) {
      tone(9, freq);
    } else {
      noTone(9);
    }
  }
} void setup() {
  pinMode(9, OUTPUT);   //using buzzer on pin 9
  Serial.begin(9600);
}

float freq; //to store frequency that matches serial data

void loop() {
  while (Serial.available()) {
    //processing writes an integer that corresponds to a key
    //white keys are 0 - 13
    //black keys are 100 - 109
    //negative value or anything not within the above ranges is noTone()
    //frequencies from https://pages.mtu.edu/~suits/notefreqs.html
    switch (Serial.read()) {
      case 0:
        freq = 130.81;
        break;
      case 1:
        freq = 146.83;
        break;
      case 2:
        freq = 164.81;
        break;
      case 3:
        freq = 174.61;
        break;
      case 4:
        freq = 196.00;
        break;
      case 5:
        freq = 220.00;
        break;
      case 6:
        freq = 246.94;
        break;
      case 7:
        freq = 261.63;
        break;
      case 8:
        freq = 293.66;
        break;
      case 9:
        freq = 329.63;
        break;
      case 10:
        freq = 349.23;
        break;
      case 11:
        freq = 392.00;
        break;
      case 12:
        freq = 440.00;
        break;
      case 13:
        freq = 493.88;
        break;
      case 100:
        freq = 138.59;
        break;
      case 101:
        freq = 155.56;
        break;
      case 102:
        freq = 185.00;
        break;
      case 103:
        freq = 207.65;
        break;
      case 104:
        freq = 233.08;
        break;
      case 105:
        freq = 277.18;
        break;
      case 106:
        freq = 311.13;
        break;
      case 107:
        freq = 369.99;
        break;
      case 108:
        freq = 415.30;
        break;
      case 109:
        freq = 466.16;
        break;
      default:
        freq = 0;
        break;
    }
    //once we have the frequency play it if it should be played, otherwise noTone()
    if (freq > 0) {
      tone(9, freq);
    } else {
      noTone(9);
    }
  }
}
