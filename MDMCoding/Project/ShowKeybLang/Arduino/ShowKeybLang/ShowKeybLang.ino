int val = 0;
int RuLangPin = 10;
int EnLangPin = 11;
int OtherLangPin = 12;
void setup() {
  
  Serial.begin(9600);
  
  pinMode(RuLangPin, OUTPUT);
  pinMode(EnLangPin, OUTPUT);
  pinMode(OtherLangPin, OUTPUT);
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(RuLangPin, LOW);
  digitalWrite(EnLangPin, LOW);
  digitalWrite(OtherLangPin, LOW);
  digitalWrite(LED_BUILTIN, LOW);
}

// the loop routine runs over and over again forever:
void loop() {
  if (Serial.available() > 0) {
    val = Serial.read();
    switch (val) {
      case 'R':
        digitalWrite(RuLangPin, HIGH);
        digitalWrite(EnLangPin, LOW);
        digitalWrite(OtherLangPin, LOW);
        break;
      case 'E':
        digitalWrite(RuLangPin, LOW);
        digitalWrite(EnLangPin, HIGH);
        digitalWrite(OtherLangPin, LOW);
        break; 
      case 'O':
        digitalWrite(RuLangPin, LOW);
        digitalWrite(EnLangPin, LOW);
        digitalWrite(OtherLangPin, HIGH);
        break;    
    } 
     
  } else {
      digitalWrite(RuLangPin, LOW);
      digitalWrite(EnLangPin, LOW);
      digitalWrite(OtherLangPin, LOW);
  }
  delay(1);        // delay in between reads for stability
}
