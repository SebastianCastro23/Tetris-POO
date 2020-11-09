Tablero tab; //Tablero
Tetromino ficha, f_sig; //Ficha actual y en espera
T_memoria memoria; //Tablero memoria

void setup() {
  strokeWeight(0.1);
  size(720, 720);
  tab = new Tablero();
  ficha = new Tetromino(); //Ficha actual
  f_sig = new Tetromino(); //Ficha Siguiente
  ficha.enJuego = true; //Ponemos la ficha en juego
  memoria = new T_memoria();
  textSize(30);
}

void draw() {
  memoria.display(); //Mostramos el tablero memoria
  tab.display(); //Mostramos el tablero de la ficha en juego
  dibujarfigura(); //Dibujamos la ficha actual
  f_sig.m_sig(); //Muestra la ficha en espera
  
  //Letreros de la derecha
  fill(0);
  text("Puntaje: " + memoria.puntaje, width/2 + 100, height -100);
  text("Nivel: " + memoria.nivel, width/2 + 100, height -160);
  text("Líneas: " + memoria.lineas_t, width/2 + 100, height -220);
  fill(83,147,111);
  text("Puntaje: " + memoria.puntaje, width/2 + 102, height -98);
  text("Nivel: " + memoria.nivel, width/2 + 102, height -158);
  text("Líneas: " + memoria.lineas_t, width/2 + 102, height -218);
}

//Dibujar figura en el tablero
void dibujarfigura() {
  ficha.display(); //Mostramos la ficha
  ficha.sombra(memoria);

  if (ficha.fondo(memoria)) { //Verifica si la ficha puede seguir bajando

    //Si la ficha no ha alcanzado el fondo, sigue bajando
    ficha.caida(memoria.nivel);
  } else {

    //si no puede bajar más, desactiva el estado "en juego" de la ficha
    ficha.enJuego = false;
  }

  if (!ficha.enJuego) { //Verifica si la ficha ya no esta en juego
    memoria.plasmar(ficha); //Plasma la figura en el tablero memoria
    ficha = f_sig; //La nueva ficha en juego es la ficha que estaba en espera
    ficha.enJuego = true; //Pone la ficha en juego
    f_sig = new Tetromino(); //Genera una nueva ficha en espera
    memoria.f_eliminadas = 0;
  }
}

//Mover la ficha
void keyPressed() {
  if (keyCode == RIGHT) {
    ficha.mover("DERECHA");
  } else if (keyCode == LEFT) {
    ficha.mover("IZQUIERDA");
  } else if (keyCode == DOWN) {
    ficha.mover("ABAJO");
    memoria.puntaje++;
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

void mouseReleased(){
  ficha.bajarfondo(memoria);
  memoria.puntaje = 2 * ficha.filasbajadas;
  
}
