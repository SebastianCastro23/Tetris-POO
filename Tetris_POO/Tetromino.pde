//Creo la clase tetromino
class Tetromino {

  //Arrays para cada ficha
  int[][] O = {{0, 0}, {1, 0}, {0, 1}, {1, 1}}; //O
  int[][] I = {{0, 0}, {1, 0}, {2, 0}, {3, 0}}; //I
  int[][] T = {{0, 0}, {1, 0}, {2, 0}, {1, 1}}; //T
  int[][] L = {{0, 0}, {1, 0}, {2, 0}, {0, 1}}; //L
  int[][] J = {{0, 0}, {0, 1}, {1, 1}, {2, 1}}; //J
  int[][] S = {{0, 1}, {1, 1}, {1, 0}, {2, 0}}; //S
  int[][] Z = {{0, 0}, {1, 0}, {1, 1}, {2, 1}}; //Z

  //Variables empleadas
  int[][] figura; //Array de la figura
  int eleccion; //Seleccion de la figura
  color Color; //Color de la figura
  boolean is;
  float t_casilla; //tamaño de cada casilla
  int contador; //contador para la velocidad de caída
  
  //Booleano para verificar si la ficha se encuentra en un límite
  boolean limite(String direccion) {
    //Hacemos casos para cada dirección
    switch(direccion) {
    case "DERECHA":
      for (int i = 0; i < 4; i++) {
        if (figura[i][0] > 10) { //si la posición es mayor a la casilla 10 devuelve falso
          return false;
        }
      }
      break;

    case "IZQUIERDA":
      for (int i = 0; i < 4; i++) {
        if (figura[i][0] < 1) { //si la posición en x es menor a la casilla 1 devuelve falso
          return false;
        }
      }
      break;

    case "ABAJO":
      for (int i = 0; i < 4; i++) {
        if (figura[i][1] > 22) { //si la posición en y es mayor a la casilla 22 devuelve falso
          return false;
        }
      }
      break;
    }
    return true; //en cualquier otro caso devuelve verdadero
  }

  //Constructor
  Tetromino() {
    t_casilla = width/24;
    eleccion = (int)random(7) ; //Elegimos la figura

    //Casos
    switch(eleccion) {
    case 0:
      figura = O;
      Color = #FAFC69;
      break;

    case 1:
      figura = I;
      Color = #63F9C2;
      break;

    case 2:
      figura = T;
      Color = #B763F9;
      break;

    case 3:
      figura = L;
      Color = #F3B453;
      break;

    case 4:
      figura = J;
      Color = #F270AD;
      break;

    case 5:
      figura = S;
      Color = #F84747;
      break;

    case 6:
      figura = Z;
      Color = #9AF857;
      break;
    }
  }

  //Método display
  void display() {
    fill(Color);
    for (int i = 0; i < 4; i++) {
      rect(figura[i][0] * t_casilla, figura[i][1] * t_casilla, t_casilla, t_casilla);
    }
  }

  //Método mover
  void mover(String direccion) { //Direccion dada por una string
    //Primero verificamos si es posible realizar el movimiento
    if (limite(direccion)) {
      if (direccion == "DERECHA") {
        for (int i = 0; i < 4; i++) {
          figura[i][0]++; //Sumar 1 a la posición en x
        }
      } else if (direccion == "IZQUIERDA") {
        for (int i = 0; i < 4; i++) {
          figura[i][0]--; //Restar 1 a la posición en x
        }
      } else if (direccion == "ABAJO") {
        for (int i = 0; i < 4; i++) {
          figura[i][1]++; //Sumar 1 a la posición en y
        }
      }
    }
  }
  
  //Caida
  void caida(int nivel){ //la velocidad de caída depende del nivel
  if (contador%50 == 0){
    mover("ABAJO");
  }
  contador ++; 
  }
}
