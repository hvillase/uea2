// Es difícil ser un gatico satánico
// Crédito de la foto: tam tam. CC BY-SA 2.0 DEED
// https://www.flickr.com/photos/80502676@N00/164785542
// Crédito del sonido: Pello el Afrokán (1988). Congas por Barrios. Ciudad de La Habana: Areito.

import processing.sound.*; // importa biblioteca de sonido, antes hay que instalarla en Libraries
int y = 0; //declaro la variable integro y
SoundFile sonido; // crea variable sonido

void setup(){
  // size(533, 799);
  fullScreen(); // para ver vantalla completa
  frameRate(30); // cuadros por segundo para animación 
  noCursor(); // esconde el cursor en la imagen
  
  sonido = new SoundFile(this, "../assets/loop1.wav");
}

void draw(){
  background(255,0, 220);
  
  PImage img; // declaro variable de imagen
  img = loadImage("../assets/gatico.jpg"); // ruta de la imagen
  image(img, 0, 0); // cargo la imagen en una posición xy
  
  fill(230, 10, 198, 205); // color
  // bucle for para los circulos de la izquierda de gatico
  for(int i =0; i<10; i++){
  ellipse(50,50*i, 100, 100);
  }
  // animación de ojos energizados de gatico
  ellipse(350, 300, y * 30 % 32, y * 30 % 32); // y multiplica a 30, a su vez la operación módulo 32 arroja un residuo 0 que evita que el círcilo sigra creciendo
  ellipse(265, 300, y * 30 % 32, y * 30 % 32);
  y = y + 1; // nota que no hay bucle pero si una cuenta iterativa
  
  // forma amarilla hecha con 5 puntos vertex
  fill(255, 255, 0);
  beginShape(); // inicia forma
  vertex(1200, 80); // posición xy de punto 1
  vertex(width/1.2, 80);
  vertex(width/1.2, 300);
  vertex(1200, 300);
  vertex(56, 789);
  endShape(CLOSE); // cierro los 5 puntos vertex
  
  // color y tamaño del texto. Va aquí para mandarlo adelante
  fill(0);
  textSize(40);
  text("es díficil ser un gatico satánico", 800, 400);
  
  // sonido  
  if(keyPressed){
    if(key== 'q'){
      sonido.loop();
    }else{
      if(key == 'w'){
      sonido.stop();
      }
    }
  }
}
