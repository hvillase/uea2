import processing.serial.*;

Serial myPort;
String val;
float wPot;

void setup(){
  size(400, 400);
  
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600); 
}

void draw(){
  background(255);
  if(myPort.available() > 0)
  {
  val=myPort.readStringUntil('\n');

    wPot=float(val);
ellipse(width/2, height/2, wPot, 20);    
  

}
  wPot=0;
  val=" ";

}
