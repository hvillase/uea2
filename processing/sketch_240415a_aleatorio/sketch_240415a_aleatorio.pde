// declaramos la variable r con un valor random entre 0 y 500

void setup(){
  
  size(600, 600);
  background(0);
  
  int i = 0;
  while(i < 30){ // el bucle while sucede hasta que i es mayor a 10
  float r = random(500);
  rect(r, r, 50, 50); // el valor de los ejes x y y toman un valor aeatorio entre 0 y 500
  i = i + 1; // incremento iterativo de i dentro del bucle
}
}

void draw(){
  // prueba pasar las líneas 6 a la 13 aquí
}
