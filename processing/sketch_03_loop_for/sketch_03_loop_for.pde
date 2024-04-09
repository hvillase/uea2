int eAncho = 20;
int eAlto = 20;

// setup se ejecuta una vez al inicio
void setup(){
  fullScreen(); // pantalla completa en lugar de size
  //size(400, 400);
}

// draw se ejecuta en bucle
void draw(){
  background(255,0,150);
  fill(0, 190, 155, 19); // color RGB y Alfa
  for(int i=0; i<20; i++){
  ellipse(width/2, height/2, eAncho*i, eAlto*i);
  }
}
