// setup se ejecuta una vez al inicio
void setup(){
  size(400, 400);
}

// draw se ejecuta en bucle
void draw(){
  background(255,0,150);
  fill(0, 190, 155, 90); // color RGB y Alfa
  ellipse(50, 50, 60, 60);
  rect(60, 60, 70, 70);
  line(50, 30, 90, 170);
}
