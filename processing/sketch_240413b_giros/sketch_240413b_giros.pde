// giros de círculos

int y=0; // declaras variable "y"

void setup(){
  fullScreen(); // pantalla completa
  frameRate(60); // cuadros por segundo de la animación
}

void draw(){
  background(0); // fondo negro
  
  ellipseMode(RADIUS); // origen de la elipse es cambiada a radios
  translate(width/2, height/2); // trasladamos el punto de origen del lienzo (xy) a la mitad de la pantalla
  ellipse(0, 0, 200, 200); // elipse fija de 200 x 200, nota que su eje (xy) es 0, 0 pero se traslado a la mitad de la pantalla 
  rotate(radians(y % 360)); // rotamos en radianes del 0 al infinito pero el módulo (%) hace quer al llegar a 360 el resto sea igual a 0 por lo que vuelve a contar
  ellipse(0, 0, 120, 100); // esta elipse es la que rota sobre su centro que fue cambiado a modo de RADIUS
  y = y + 1; // la variable "y" incrementa 1 valor por cada vuelta de draw
}
