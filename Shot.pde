/*
弾幅16,長さ22
*/

class Shot{
  float shotx;//x座標
  float shoty;//y座標
  int shotnow;//画面上にあるか
  PImage shotpic = loadImage("tama.png");//
  float shotvx;//xスピード
  float shotvy;//yスピード
  
  Shot(){
    shotx = 0;
    shoty = 0;
    shotnow = 0;
    shotvy = -10;
  }
  
  void printshot(){
    image(shotpic,shotx,shoty);
  }
  
  void fire(float x, float y){
    shotnow = 1;
    shotx = x;
    shoty = y + shotvy;
    image(shotpic,shotx,shoty);
  }
  
  void shotmove(){
    if(shotnow == 1){
      shoty += shotvy;
      if(shoty < -74){
        shotnow = 0;
        shotx = 0;
        shoty = 0;
      }else{
      image(shotpic,shotx,shoty);
      }
    }
  }
  
  boolean shotcheck(){
    if(shotnow == 0){
      return true;
    }
    return false;
  }
  
  void shotbreak(){
    shotnow = 0;
    shotx = 0;
    shoty = 0;
    /*
    shotx = 0;
    shoty = 0;
    shotvx = 0;
    shotvy = 0;
    */
  }
  
  int shotlive(){
    return shotnow;
  }
  
  float shottox(){
    float sum = shotx + 8;
    return sum;
  }
  
  float shottoy(){
    float sum = shoty + 11;
    return sum;
  }
  
}
  
