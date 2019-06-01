/*
画面上に光の球を浮かべるHikari
個数を設定しなければx座標に等間隔、y座標にランダムに配置
*/

class Hikari{
  float x;
  float y;
  float vx;
  float vy;
  float dx;//基準軸
  float ran;
  float ran2;
  
  Hikari(int m){
    ran = random(-30,30);
    ran2 = random(0, 60);
    x = m - ran;
    y = random(0,height);
    vx = 0;
    vy = 0.5;
    dx = m;
  }


 void ball(int i){
    noStroke();
    while(i > 0){
      fill(255,250 - (i * 25) );
      ellipse(x, y, i * 2, i * 2);
      i--;
    }
  }
  
  void move(){
    if(ran2 < 0){
      y += vy;
      x += vx;
      vx += 0.001 * (dx - x);
    }else{
      ran2 -= 1;
    }
    
    if(y >= height + 10){
      ran = random(-30,30);
      y = 0;
    }
  }
  
  
}

