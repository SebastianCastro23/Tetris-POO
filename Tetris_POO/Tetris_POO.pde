Tablero tab;
Tetromino ficha, f_sig;
T_memoria memoria;

void setup() {
  strokeWeight(2);
  size(720, 720);
  tab = new Tablero();
  ficha = new Tetromino();
  f_sig = new Tetromino();
  ficha.enJuego = true; //Ponemos la ficha en juego
  memoria = new T_memoria();
}

void draw() {
  //background(0);
  memoria.display();
  tab.display();
  dibujarfigura();
}

//Dibujar figura en el tablero
void dibujarfigura() {
  ficha.display();

  if (ficha.fondo(memoria)) { //Verifica si la ficha puede seguir bajando

    //Si la ficha no ha alcanzado el fondo, sigue bajando
    ficha.caida(1);
  } else {

    //si no puede bajar más, desactiva el estado "en juego" de la ficha
    ficha.enJuego = false;
  }

  if (!ficha.enJuego) { //Verifica si la ficha ya no esta en juego
    memoria.plasmar(ficha); //Plasma la figura en el tablero memoria
    ficha = f_sig; //La nueva ficha en juego es la ficha que estaba en espera
    ficha.enJuego = true; //Pone la ficha en juego
    f_sig = new Tetromino(); //Genera una nueva ficha en espera
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    ficha.mover("DERECHA");
  } else if (keyCode == LEFT) {
    ficha.mover("IZQUIERDA");
  } else if (keyCode == DOWN) {
    ficha.mover("ABAJO");
  }
}

//Hacemos un keyReleased para las rotaciones
void keyReleased() {
  if (keyCode == UP) {
    //Se añade dos veces la función rotar
    //En la primera se guardan las coordenadas de la figura rotada
    //En la segunda se coloca la ficha en la posición actual
    ficha.rotar();
    ficha.rotar();

    ficha.cont_rotaciones ++; //Actualizar el contador de la rotación actual
  }
}

//Dibujar la ficha cuando llegue al fondo
void Fondo() {
  if (!ficha.enJuego) { //Verifica si la ficha ya no esta en juego
    dibujarfigura(); //Dibuja la figura en el tablero memoria
    ficha = f_sig; //La nueva ficha en juego es la ficha que estaba en espera
    ficha.enJuego = true; //Pone la ficha en juego
    f_sig = new Tetromino(); //Genera una nueva ficha en espera
  }
}
