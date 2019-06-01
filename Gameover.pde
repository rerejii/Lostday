class Gameover{
  PImage owatapic = loadImage("owata.png");
  Gameover(){
  }
  void end(){
    fill(25,255,255);
    textSize(40);
    text("Continue? Y/N",250,380);
    image(owatapic,650,100,100,100);
  }
}
