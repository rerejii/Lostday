class Colball{
  float x;
  float y;
  float dy;//スピード
  float wid;//ロードバーの長さ
  float hig;//ロードバーの高さ
  float lodx;//ロードバーの基準x座標
  float lody;//ロードバーの基準y座標
  float DIA;//円の直径
  float colors;
  
  Colball(){
    wid = 400;
    hig = 50;
    lodx = 200;
    lody = 375;
    DIA = random(5,30);
    x = random(lodx, lodx + wid);
    y = random(lody, hig + lody);
    dy = random(1,3);
    colors = random(0,255);
  }
  //load時のボール
   void geji(){
     fill(colors,255,255);
     noStroke();
     ellipse(x,y,DIA,DIA);
     
     if(y + DIA / 2 < lody){
       x = random(lodx,lodx + wid);
       y = hig + lody;
       dy = random(1,3);
       DIA = random(5,30);
       colors = random(0,255);
     }else{
       y -= dy;
     }
   }
  
}
