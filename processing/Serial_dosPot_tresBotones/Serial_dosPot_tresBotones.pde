/** 
 * Basado en ejemplo:
 * Serial Call-Response 
 * de Tom Igoe. 
 * 
 * Sends a byte out the serial port, and reads 3 bytes in. 
 * Sets foregound color, xpos, and ypos of a circle onstage
 * using the values returned from the serial port. 
 * Thanks to Daniel Shiffman  and Greg Shakar for the improvements.
 * 
 * Note: This sketch assumes that the device on the other end of the serial
 * port is going to send a single byte of value 65 (ASCII A) on startup.
 * The sketch waits for that byte, then sends an ASCII A whenever
 * it wants more data. 
 */
 
import processing.serial.*;

int bgcolor;			     // Background color
int fgcolor;			     // Fill color
Serial myPort;                       // El puerto serial
int[] serialInArray = new int[5];    // Donde pondremos lo que recibimos
int serialCount = 0;                 // Cuenta de cuntos bytes recibimos
int xpos, ypos;	                    // Comenzamos posición del círculo
int widE;	                             // ancho del círculo
boolean firstContact = false;        // Si escuchamos desde el microcontrolador

void setup() {
  size(256, 256);  // tamaño de lienzo
  noStroke();      // No border on the next thing drawn

  // Set the starting position of the ball (middle of the stage)
  xpos = width/2;
  ypos = height/2;

  // Print a list of the serial ports, for debugging purposes:
  printArray(Serial.list());

  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  background(bgcolor, 150, 120);
  fill(fgcolor);
  // Draw the shape
  ellipse(xpos, ypos, widE, 20);
}

void serialEvent(Serial myPort) {
  // read a byte from the serial port:
  int inByte = myPort.read();
  // if this is the first byte received, and it's an A,
  // clear the serial buffer and note that you've
  // had first contact from the microcontroller. 
  // Otherwise, add the incoming byte to the array:
  if (firstContact == false) {
    if (inByte == 'A') { 
      myPort.clear();          // clear the serial port buffer
      firstContact = true;     // you've had first contact from the microcontroller
      myPort.write('A');       // ask for more
    } 
  } 
  else {
    // Add the latest byte from the serial port to array:
    serialInArray[serialCount] = inByte;
    serialCount++;

    // If we have 3 bytes:
    if (serialCount > 4 ) {
      xpos = serialInArray[0];
      ypos = serialInArray[1];
      fgcolor = serialInArray[2];
      bgcolor = serialInArray[3];
      widE = serialInArray[4];

      // print the values (for debugging purposes only):
      println(xpos + "\t" + ypos + "\t" + fgcolor + "\t" + bgcolor + "\t" + widE);

      // Send a capital A to request new sensor readings:
      myPort.write('A');
      // Reset serialCount:
      serialCount = 0;
    }
  }
}


/*

//  Serial Call and Response
//  de Tom Igoe
//  Lenguaje: Wiring/Arduino
  
//  This program sends an ASCII A (byte of value 65) on startup
//  and repeats that until it gets some data in.
//  Then it waits for a byte in the serial port, and 
//  sends five sensor values whenever it gets a byte in.
  
//  Created 26 Sept. 2005
//  Updated 18 April 2008
//  Adaptado 21 de mayo 2024

int firstSensor = 0;    // first analog sensor
int secondSensor = 0;   // second analog sensor
int thirdSensor = 0;    // sensor digital o boton
int fourthSensor = 0;   // sensor digital o boton
int fifthSensor = 0;   // sensor digital o boton
int inByte = 0;         // incoming serial byte

void setup()
{
  // start serial port at 9600 bps:
  Serial.begin(9600);
  pinMode(2, INPUT);   // digital sensor is on digital pin 2
  pinMode(3, INPUT);   // sensro digital esta en pin digital 3
  pinMode(4, INPUT);   // sensro digital esta en pin digital 4
  establishContact();  // send a byte to establish contact until Processing responds 
}

void loop()
{
  // if we get a valid byte, read analog ins:
  if (Serial.available() > 0) {
    // get incoming byte:
    inByte = Serial.read();
    // read first analog input, divide by 4 to make the range 0-255:
    firstSensor = analogRead(0)/4;
    // delay 10ms to let the ADC recover:
    delay(10);
    // read second analog input, divide by 4 to make the range 0-255:
    secondSensor = analogRead(1)/4;
    // read  switch, multiply by 155 and add 100
    // so that you're sending 100 or 255:
    thirdSensor = 100 + (155 * digitalRead(2));
    // ibidem
    fourthSensor = 100 + (155 * digitalRead(3));
    // ibidem
    fifthSensor = 10 + (15 * digitalRead(4));
    // send sensor values:
    Serial.write(firstSensor);
    Serial.write(secondSensor);
    Serial.write(thirdSensor); 
    Serial.write(fourthSensor);
    Serial.write(fifthSensor);              
  }
}

void establishContact() {
 while (Serial.available() <= 0) {
      Serial.write('A');   // send a capital A
      delay(300);
  }
}

*/
