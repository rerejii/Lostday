
class Greenshot{
  //ショット用変数///////////////////////////////
  float greenx;//円のx座標
  float greeny;//円のy座標
  float greent;//円の進む角度
  float greenv;//円の速度
  float greensx;//円描写の基準となるx座標
  float greensy;//円描写の基準となるy座標
  float greenp;////円の中心からの距離
  float greenfin;//画面内にいるかどうかの変数
  //ショット用変数///////////////////////////////

  Greenshot(){
  }
  
  void greenshotRESET(){
    greenx = 0;
    greeny = 0;
    greensx = 0;
    greensy = 0;
    greenv = 0;
    greent = 0;
    greenp = 0;
    greenfin = 0;
  }
  
  void greenshotdraw(){
    ellipse( greenx, greeny, 20, 20);
  }

  void greenshotmove(){
    
    if( abs(greenx - width / 2) + abs(greeny - height / 2) 
    < (width + height) / 2 && greenfin == 1){
        fill(210,255,255 );
        ellipse( greenx, greeny, 20, 20);
      greenp += greenv;
      greenx = greenp * cos(greent) + greensx;
      greeny = greenp * sin(greent) + greensy;
    }else{
      greenfin = 0;
    }
  
  }
  
  void greenshotstart(float mx, float my, float fx, float fy, float plust){

    greenx = mx;
    greeny = my;
    greensx = mx;
    greensy = my;
    greenv = random(4,7);
//    greent = atan2(my - fy, mx - my);
    greent = atan2(fy - my, fx - mx) + radians(plust);
    greenp = 0;
    greenfin = 1;

  }
  
  boolean greenshotfin(){
    if(greenfin == 0){
    return true;
    }
    return false;
  }
  
  float greencheckx(){
   return greenx;
 }
 
 float greenchecky(){
   return greeny;
 }
 void greenshotend(){
   greenfin = 0;
 }
  
}

