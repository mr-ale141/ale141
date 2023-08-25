int val = 0;
int RuLangPin = 10;
int EnLangPin = 12;
int OtherLangPin = 11;
void setup() {
  
  Serial.begin(9600);
  
  pinMode(RuLangPin, OUTPUT);
  pinMode(EnLangPin, OUTPUT);
  pinMode(OtherLangPin, OUTPUT);
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(RuLangPin, HIGH);
  digitalWrite(EnLangPin, HIGH);
  digitalWrite(OtherLangPin, HIGH);
  digitalWrite(LED_BUILTIN, LOW);
}

// the loop routine runs over and over again forever:
void loop() {
  if (Serial.available() > 0) {
    val = Serial.read();
    switch (val) {
      case 'R':
        digitalWrite(RuLangPin, LOW);
        digitalWrite(EnLangPin, HIGH);
        digitalWrite(OtherLangPin, HIGH);
        break;
      case 'E':
        digitalWrite(RuLangPin, HIGH);
        digitalWrite(EnLangPin, LOW);
        digitalWrite(OtherLangPin, HIGH);
        break; 
      case 'O':
        digitalWrite(RuLangPin, HIGH);
        digitalWrite(EnLangPin, HIGH);
        digitalWrite(OtherLangPin, LOW);
        break;    
    } 
     
  } else {
      digitalWrite(RuLangPin, HIGH);
      digitalWrite(EnLangPin, HIGH);
      digitalWrite(OtherLangPin, HIGH);
  }
  delay(1);        // delay in between reads for stability
}
