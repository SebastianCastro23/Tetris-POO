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
  int[][] figura, f_original, f_sombra; //Array de la figura actual y figura original
  int eleccion; //Seleccion de la figura
  color Color; //Color de la figura
  boolean enJuego; //Verifica si la ficha ya se colocó o no
  float t_casilla; //tamaño de cada casilla
  int tiempo; //tiempo transcurrido
  int cont_rotaciones; //contador de las rotaciones
  int x; 
  int y;
  int y_sombra;
  int c_sombra;

  //Booleano para verificar si la ficha se encuentra en un límite
  boolean limite(String direccion) {
    //Hacemos casos para cada dirección
    switch(direccion) {
    //ES POSIBLE...
    case "DERECHA": //MOVER A LA DERECHA? 
      for (int i = 0; i < 4; i++) {
        if (figura[i][0] > 10) { //si la posición es mayor a la casilla 10 devuelve falso
          return false;
        }
      }
      break;

    case "IZQUIERDA": //MOVER A LA IZQUIERDA??
      for (int i = 0; i < 4; i++) {
        if (figura[i][0] < 1) { //si la posición en x es menor a la casilla 1 devuelve falso
          return false;
        }
      }
      break;

    case "ABAJO": //MOVER HACIA ABAJO??
      for (int i = 0; i < 4; i++) {
        if (figura[i][1] > 22) { //si la posición en y es mayor a la casilla 22 devuelve falso
          enJuego = false;
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
    tiempo = 1; //incializamos el tiempo en 1
    f_original = figura; //Figura original
    cont_rotaciones = 0; //inicializamos el contador de rotaciones en 0
  } 
  
  //METODOS
  
  //Método display
  void display() {
    fill(Color);
    for (int i = 0; i < 4; i++) { //Recorre el array de cada figura
      rect(figura[i][0] * t_casilla, figura[i][1] * t_casilla, t_casilla, t_casilla);
    }
  }
  
  
  //Dibujo la figura siguiente en la parte derecha del tablero
  void m_sig() { 
    fill(179,244,208);
    rect(width/2,0,width/2,height);
    fill(0);
    text("SIGUIENTE FICHA:",width/2 + 60, 70);
    fill(83,147,111);
    text("SIGUIENTE FICHA:",width/2 + 62, 72);
    
    fill(Color);
    for (int i = 0; i < 4; i++) {
      rect(figura[i][0] * t_casilla + width/2 + 140, figura[i][1] * t_casilla + 100, t_casilla, t_casilla); //La muestro en la parte derecha del tablero
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
  void caida(int nivel) { //la velocidad de caída depende del nivel
    if (tiempo%(50-(nivel*5)) == 0) { //Entre mayor sea el módulo menor será la velocidad de caída
      mover("ABAJO");
    }
    tiempo ++; //aumentamos el contador
  }

  //Método rotar
  void rotar() {
    if (figura != O) { //No aplicar la rotación si la figura es la O

      //nueva array para la rotación
      //Siempre rotamos la figura original (f_original)
      //Le restamos la posición actual para que rote en esa posición
      int[][] rotacion = new int[4][2];

      //90° (x,y) = (y,-x)
      if (cont_rotaciones%4 == 0) {
        for (int i = 0; i < 4; i++) {
          rotacion[i][0] = f_original[i][1] - figura[1][0]; 
          rotacion[i][1] = -f_original[i][0] - figura[1][1];
        }
      }

      //180° (x,y) = (-x,-y)
      else if (cont_rotaciones%4 == 1) {
        for (int i = 0; i < 4; i++) {
          rotacion[i][0] = -f_original[i][0] - figura[1][0]; 
          rotacion[i][1] = -f_original[i][1] - figura[1][1];
        }
      }

      //270° (x,y) = (-y,x)
      else if (cont_rotaciones%4 == 2) {
        for (int i = 0; i < 4; i++) {
          rotacion[i][0] = -f_original[i][1] - figura[1][0]; 
          rotacion[i][1] = f_original[i][0] - figura[1][1];
        }
      }

      //360°(Retornar al lugar original)
      else if (cont_rotaciones%4 == 3) {
        for (int i = 0; i < 4; i++) {
          rotacion[i][0] = f_original[i][0] - figura[1][0]; 
          rotacion[i][1] = f_original[i][1] - figura[1][1];
        }
      }

      figura = rotacion; //guardamos los datos de la figura rotada en la figura actual
    }
  }

  //Booleano para verificar si puede seguir bajando o no
  boolean fondo(T_memoria tab) { //Recibe datos del tablero memoria
    for (int i = 0; i < 4; i++) { //verifica el array de la figura
      x = figura[i][0]; //Saca la posicion en x
      y = figura[i][1]; //Saca la posicion en y
      if (x >= 0 && x < 12 && y >= 0 && y < 23) {
        if (tab.colores[x][y+1][0] != 0) { // si el color de abajo no es negro, no puede bajar más
          return false;
        }
      }
    }
    return true;
  }
}
