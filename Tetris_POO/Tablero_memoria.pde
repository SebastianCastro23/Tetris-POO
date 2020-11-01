//Creamos la clase del tablero memoria
//Este contendra y dibujara todas las fichas que han sido acomodadas en el tablero
class T_memoria {

  //variables
  int [][][] colores; //matriz que contiene el color de cada casilla
  int t_casilla; //Tamaño cada casilla
  int x;
  int y;
  int n_color;

  //Constructor
  T_memoria() {
    colores = new int [12][24][1];
    t_casilla = width/24;
  }

  //Método display
  void display() {
    for (int i = 0; i < 12; i++) {
      for (int j = 0; j < 24; j++) {
        //Elegir el color
        n_color = colores[i][j][0];
        fill(n_color);
        rect(i * t_casilla, j * t_casilla, t_casilla, t_casilla);
      }
    }
  }

  //Método plasmar figura
  void plasmar(Tetromino f) {
    //Coordenadas de cada bloque
    for (int i = 0; i < 4; i++) {
      x = f.figura[i][0];
      y = f.figura[i][1];
      //Añadir el color
      colores[x][y][0] = f.Color;
    }
  }
}
