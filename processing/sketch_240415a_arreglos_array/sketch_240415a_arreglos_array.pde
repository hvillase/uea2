// declaramos un arreglo con 4 valores llamado rX por rect X
int[] rX = {30, 40, 50, 60};

void setup(){
  size(600, 600);
}

void draw(){
  background(0);
  // usamos los valores del arreglo
  rect(rX[0], 30, 50, 50); // el valor del eje x toma el índice 1 igual a 30
  rect(rX[1], 90, 50, 50); // el valor del eje x toma el índice 1 igual a 40
  rect(rX[2], 150, 50, 50); // el valor del eje x toma el índice 1 igual a 50
  rect(rX[3], 210, 50, 50); // el valor del eje x toma el índice 1 igual a 60
}
