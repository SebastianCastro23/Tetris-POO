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

  //Array de la figura
  int[][] figura;
  int eleccion; //Seleccion de la figura
  color Color;
  boolean is;
  float t_casilla;

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
  void display(){
    fill(Color);
    for(int i = 0; i < 4; i++){
      rect(figura[i][0] * t_casilla, figura[i][1] * t_casilla, t_casilla, t_casilla);
    }
  }
}
