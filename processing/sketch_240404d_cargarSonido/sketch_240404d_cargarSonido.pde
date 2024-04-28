// Cargar sonido
// Crédito del sonido: Pello el Afrokán (1988). Congas por Barrios. Ciudad de La Habana: Areito.

import processing.sound.*; // importa biblioteca de sonido, antes hay que instalarla en Libraries
SoundFile sonido; // crea variable sonido

void setup() {
  // size(533, 799);
  fullScreen(); // para ver vantalla completa
  frameRate(30); // cuadros por segundo para animación
  noCursor(); // esconde el cursor en la imagen

  sonido = new SoundFile(this, "assets/loop1.wav");
}

void draw() {
  background(255, 0, 220);

  // color y tamaño del texto. Va aquí para mandarlo adelante
  fill(0);
  textSize(40);
  text("Presiona la letra q para iniciar sonido", width/2, height/2);
}

void keyPressed() {
  if (key== 'q') {
    sonido.play();
  } else {
    if (key == 'w') {
      sonido.stop();
    }
  }
}
