// Cargar una imagen
// Crédito de la foto: tam tam. CC BY-SA 2.0 DEED
// https://www.flickr.com/photos/80502676@N00/164785542

PImage img; // declaro variable de imagen

void setup() {
  // size(533, 799);
  fullScreen(); // para ver vantalla completa
  noCursor(); // esconde el cursor en la imagen

  img = loadImage("assets/gatico.jpg"); // carga imagen desde la carpeta assets
}

void draw() {
  background(255, 0, 220);
  image(img, 0, 0); // cargo la imagen en una posición xy
}
