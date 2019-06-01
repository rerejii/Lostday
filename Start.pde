/*
スタート時にロゴを表示させる
*/

class Start{
  
  float rx;
  float ry;
  PImage fairy;
  PImage rogo;
  PImage rogocut;
  int s ;//文字の幅
  int t = 0;
  int next;
  int colors;
  
  Start(){
    rogo = loadImage("REREX.png");
    t = -40;
    next = 0;
    colors = 0;
  }
  
  void RESET(){
    t = -40;
  }
  
  void draw(){
    t += 3;//タイムを進める
   // txt(t / 50);//ロゴ表示
   if(t < 0){
     s = 0;
   }else{
     s = t;
   }
   rogocut = rogo.get(0, 0, s, rogo.height);
    image(rogocut, (width-rogo.width)/2, (height-rogo.height)/2);
  }
  
  void nextplus(){
    next++;
  }
  
  
  
}
