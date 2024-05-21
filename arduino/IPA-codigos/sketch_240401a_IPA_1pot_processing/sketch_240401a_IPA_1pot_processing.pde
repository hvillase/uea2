import processing.serial.*; // comunicación serial

Serial myPort;
int potValue;

void setup() {
  size(800, 800);
  //Lee el nombre de tu puerto, revisa que coincida con la velocidad de lectura
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600); 
}

void draw() {
  background(255, 0, 0);
  if (myPort.available() > 0) {
    String data = myPort.readStringUntil('\n');
    if (data != null) {
      data = data.trim();
      potValue = int(data);
    }
  }
  // Mapea el valor del potenciometero a lo alto de la ventana
  float mappedValue = map(potValue, 0, 1023, 0, height);
  // Dibuja una ellipse cuya anchura cambia con el potenciometro
  ellipse(width/2, height/2, 50, mappedValue);
}
