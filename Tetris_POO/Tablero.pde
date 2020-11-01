//Creo la clase tablero
class Tablero {

  //Variable del tamaño de cada casilla
  float t_casilla;

  //Constructor
  Tablero() {
    t_casilla = width/24; //Establezco el tamaño de cada casilla
  }

  //Establezco el metodo display para dibujar el tablero en la pantalla
  void display() {
    stroke(255);
    for (int i = 0; i < 13; i++) {
      line(0, i * t_casilla, width/2, i * t_casilla); //Lineas horizontales 0-13
      line(0, (i+12) * t_casilla, width/2, (i+12) * t_casilla); //Lineas horizontales 13-25  
      line(i * t_casilla, 0, i * t_casilla, height); //Lineas verticales
    }
  }
}
