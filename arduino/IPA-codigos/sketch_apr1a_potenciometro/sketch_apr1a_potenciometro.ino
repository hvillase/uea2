const int potPin = A0;
int potenciometro = 0;

void setup() {
  // coloca tu código setup aquí, el cual corre una vez:
  Serial.begin(9600);
}

void loop() {
  // coloca tu código principal aquí, el cual corre repetidamente:
  // variable que lee potenciomentro en pin 0
  potenciometro = analogRead(potPin);
  // imprime el valor del potenciometro
  Serial.println(potenciometro);
  // retraso entre lecturas para estabilizar
  delay(100);
}
