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
  ficha.caida(1);
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
