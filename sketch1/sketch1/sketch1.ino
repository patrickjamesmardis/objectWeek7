void setup() {
  pinMode(9, OUTPUT); 
  Serial.begin(9600); 
}

void loop() {
  while (Serial.available()) {
    tone(9, float(Serial.read()));
  }
  
}
