Tablero t1;
Tetromino ficha;

void setup(){
  strokeWeight(2);
  size(720,720);
  t1 = new Tablero();
  ficha = new Tetromino();
}

void draw(){
  background(0);
  t1.display();
  ficha.display();
}

void keyPressed(){
  if (keyCode == RIGHT){
    ficha.mover("DERECHA");
  } else if (keyCode == LEFT){
    ficha.mover("IZQUIERDA");
  } else if (keyCode == DOWN){
    ficha.mover("ABAJO");
  }
}

//Hacemos un keyReleased para las rotaciones
void keyReleased(){
  if(keyCode == UP){
    //Se añade dos veces la función rotar
    //En la primera se guardan las coordenadas de la figura rotada
    //En la segunda se coloca la ficha en la posición actual
    ficha.rotar();
    ficha.rotar();
    
    ficha.cont_rotaciones ++; //Actualizar el contador de la rotación actual
  }
}
