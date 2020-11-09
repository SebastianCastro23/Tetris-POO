//Creamos la clase del tablero memoria
//Este contendra y dibujara todas las fichas que han sido acomodadas en el tablero
class T_memoria {

  //variables
  int [][][] colores; //matriz que contiene el color de cada casilla
  int t_casilla; //Tamaño cada casilla
  int x;
  int y;
  int n_color;
  int puntaje; //Puntaje
  int f_eliminadas; //Número de filas eliminadas
  int lineas_t; //Total de filas eliminadas durante la partida
  int nivel = 1; //Nivel

  //Constructor
  T_memoria() {
    colores = new int [12][24][1]; //Crea la matriz
    t_casilla = width/24;
  }

  //Método display
  void display() {
    for (int i = 0; i < 12; i++) { //Recorre todas las filas y columnas 
      for (int j = 0; j < 24; j++) {
        //Elegir el color
        n_color = colores[i][j][0]; //Extrae el color de la casilla de la matriz
        fill(n_color);
        rect(i * t_casilla, j * t_casilla, t_casilla, t_casilla); //Dibuja un rectangulo del color seleccionado en la posición actual
      }
    }

    //Si hay una fila completa...
    for (int i = 0; i < 24; i++) { //Verifica las 24 filas
      if (fil_completa(i)) { //Mira si arroja verdadero
        f_eliminadas ++;
        eliminar(i); //Elimina la fila i
      };
    };
    lineas_t += f_eliminadas;
    //Asigno el puntaje por filas eliminadas
    while (f_eliminadas != 0) {
      if (f_eliminadas >= 4) {
        puntaje = puntaje + (((f_eliminadas - (f_eliminadas%4))/4) * 800 * nivel);
        f_eliminadas = f_eliminadas - (f_eliminadas - (f_eliminadas&4));
      } else if (f_eliminadas == 3) {
        puntaje = puntaje + (500 * nivel);
        f_eliminadas = f_eliminadas - 3;
      } else if (f_eliminadas == 2) {
        puntaje = puntaje + (300 * nivel);
        f_eliminadas = f_eliminadas -2;
      } else if(f_eliminadas == 1){
        puntaje = puntaje + (100 * nivel);
        f_eliminadas --;
      }
    };
    
    //Por último miramos si se puede cambiar de nivel
    if(lineas_t >= (nivel*10)){
      println("listo");
      nivel ++;
    }
  }

  //Método plasmar figura en el tablero memoria
  void plasmar(Tetromino f) { //Recibe los datos de algún tetromino
    //Coordenadas de cada bloque
    for (int i = 0; i < 4; i++) {
      x = f.figura[i][0]; //Coordenada x de la ficha
      y = f.figura[i][1]; //Coordenada y de la ficha
      //Añadir el color
      colores[x][y][0] = f.Color; //Guarda en la matriz el color de la ficha
    }
  }

  //Verificar si hay alguna fila completa
  boolean fil_completa(int fil) {
    for (int i = 0; i < 12; i++) {
      if (colores[i][fil][0] == 0) {
        return false;
      }
    }
    return true;
  }

  //Eliminar filas
  void eliminar(int fil) {
    for (int j = fil; j >= 1; j--) {
      for (int i = 0; i < 12; i++) { //Verifica todas las casillas de la fila
        colores[i][j][0] = colores[i][j-1][0]; //Las cambia por casillas negras
      }
    }
  }
}
