Tablero t1;
Tetromino figura;

void setup(){
  strokeWeight(2);
  size(720,720);
  t1 = new Tablero();
  figura = new Tetromino();
}

void draw(){
  background(0);
  t1.display();
  figura.display();
}
