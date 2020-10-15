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
      case 1:
        freq = 146.83;        
      case 2:
        freq = 164.81;        
      case 3:
        freq = 174.61;        
      case 4:
        freq = 196.00;        
      case 5:
        freq = 220.00;        
      case 6:
        freq = 246.94;        
      case 7:
        freq = 261.63;        
      case 8:
        freq = 293.66;        
      case 9:
        freq = 329.63;        
      case 10:
        freq = 349.23;        
      case 11:
        freq = 392.00;        
      case 12:
        freq = 440.00;        
      case 13:
        freq = 493.88;        
      case 100:
        freq = 138.59;        
      case 101:
        freq = 155.56;        
      case 102:
        freq = 185.00;        
      case 103:
        freq = 207.65;        
      case 104:
        freq = 233.08;       
      case 105:
        freq = 277.18;
      case 106:
        freq = 311.13;
      case 107:
        freq = 369.99;
      case 108:
        freq = 415.30;
      case 109:
        freq = 466.16;
      default:
        freq = 0;
    }
    //once we have the frequency play it if it should be played, otherwise noTone()
    if (freq > 0) {
      tone(9, freq);
    } else {
      noTone(9);
    }
  }
}
