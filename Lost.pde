class Lost{
  
  PImage pic;//画像
 
  Lost(){
    pic = loadImage("Fairy's lost day.png");
  }
  
  void lostpic(){
    image(pic,70,50,350,100);
  }
  
}
