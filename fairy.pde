class Fairy{
  int t;//time
  float faix;//妖精座標
  float faiy;//妖精座標
  float kakux;//当たり判定用
  float kakuy;//当たり判定用
  int H_POINT;//判定回数
  color H_COLOR;//判定用カラー
  int blockx;//ブロックの座標x 0〜3動き
  int blocky;//ブロックの座標y 0〜3向き 0前 1左 2右 3後
  final float blockvx = 32;//元となるブロックごとの座標
  final float blockvy = 48;//元となるブロックごとの座標
  float sizex = 100;//妖精画像倍率
  float sizey = 180;//妖精画像倍率
  final PImage faipic = loadImage("fairy.png");//妖精画像
  PImage fai;//切り取った妖精画像格納庫
  float muteki;//無敵時間
  float mswitch;//点滅用スイッチ
Fairy(){
    faix = 0;     //妖精用座標x
    faiy = (height-faipic.height)/2; //妖精用座標y
    t = 0;
    H_POINT = 120;
    muteki = 0;
    mswitch = 0;
  }
  
    void RESET(){
    faix = 0;     //妖精用座標x
    faiy = (height-faipic.height)/2; //妖精用座標y
    t = 0;
    H_POINT = 120;
    muteki = 0;
    mswitch = 0;
    sizey = 180;//妖精画像倍率
    sizex = 100;//妖精画像倍率
    }
  
    void startmove(){

    

    faix += 3;//左から右へ
    blocky = 2;//右向き
    t++;//タイムを動かす
    if(t == 10){//妖精に時間ごとに動きを入れる
      blockx = (blockx + 1) % 4;
      //println(blockx);//てすと
      t = 0;
    }
    fai = faipic.get(floor(blockx * blockvx), floor(blocky * blockvy),
    floor(blockvx), floor(blockvy));
    fairy.draw(faix, faiy);
    }
  
  void draw(float x,float y){
    if(muteki == 0){
      image(fai, x, y,sizex,sizey);
    }else{
      if(mswitch == 0 || mswitch == 1 || mswitch == 2){
        image(fai, x, y,sizex,sizey);
        if(mswitch == 0){
          muteki--;
          mswitch = 5;
        }else{
          mswitch--;
        }
      }else{
        mswitch--;
      }
    }
  }
  
  void standby(int level){
    t++;
    faix = 50;
    faiy = 530;
    blocky = 0;//前向き
    sizex = 50;
    sizey = 90;
    if(t == 10){//妖精に時間ごとに動きを入れる
      blockx = (blockx + 1) % 4;
      //println(blockx);//てすと
      t = 0;
    }
    fai = faipic.get(floor(blockx * blockvx), floor(blocky * blockvy),
    floor(blockvx), floor(blockvy));
    fairy.draw(faix, faiy + level * 70);
  }
  
  void fairygame(float x, float y){
    t++;
    faix = x;
    faiy = y;
    blocky = 3;//後ろ向き
    sizex = 50;
    sizey = 90;
    if(t == 10){//妖精に時間ごとに動きを入れる
      blockx = (blockx + 1) % 4;
      //println(blockx);//てすと
      t = 0;
    }
    fai = faipic.get(floor(blockx * blockvx), floor(blocky * blockvy),
    floor(blockvx), floor(blockvy));
    fairy.draw(faix, faiy);
//    ellipse(faix + sizex / 2,faiy + sizey / 2,10,10);
    noStroke();
    fill(127,255,255,255 );
    ellipse(faix + sizex / 2, faiy + sizey / 2 - 5, 17, 17);
    /*
    for(float i = 10; i > 0; i--){
      if(i > 5.5){
        fill(127,255,255,255 );
        ellipse(faix + sizex / 2, faiy + sizey / 2 - 5, 16, 16);
      }else{
        fill(170 - (43 / 10) * i,255,255,70 );
        ellipse(faix + sizex / 2, faiy + sizey / 2 - 5, i * 2, i * 2);
      }
    }
    */
 //   for(float i = 10; i > 0; i--){
 //     fill(170 - (43 / 7) * i,255,255,75 );
 //     ellipse(faix + sizex / 2, faiy + sizey / 2 - 5, i * 2, i * 2);
 //   }
    /*
    for (int i = 0; i < H_POINT; i++) {
      fill(170,255,255,70 );
      float kaku = i * TWO_PI / H_POINT;   // t の範囲 0〜TWO_PI
      kakux = 8 * cos(kaku);
      kakuy = 8 * sin(kaku);
      ellipse(kakux + faix + sizex / 2,kakuy + faiy + sizey / 2 - 5,1,1);
    }
    */
  }
  boolean atari(){
    for (int i = 0; i < H_POINT; i++) { // 繰り返し回数 H_POINT
      float kaku = i * TWO_PI / H_POINT;   // t の範囲 0〜TWO_PI
      kakux = 7 * cos(kaku);
      kakuy = 7 * sin(kaku);
      //line(int((faiy + sizey / 2 - 5) + kakuy + 30, int((faix + sizex / 2) + kakux) + 30 ,int((faiy + sizey / 2 - 5) + kakuy) + 30, int((faix + sizex / 2) + kakux) + 30 );
      H_COLOR = get( int(kakux + faix + sizex / 2), int(kakuy + faiy + sizey / 2 - 5) );
      noStroke();
      stroke(0,255,255);
     // strokeWeight(1);
      fill(0,255,255);
   //   ellipse(int((faix + sizex / 2) + kakux), int((faiy + sizey / 2 -5)) , 1, 1);
  //    ellipse(int(kakux + faix + sizex / 2),int(kakuy + faiy + sizey / 2 - 5),1,1);
    //  ellipse(kakux,kakuy,1,1);
      if(H_COLOR != -16711685 && H_COLOR != -16711684 ){
    //    println(H_COLOR);
        muteki = 10;
        return true;
      }
      
 //     loadPixels();
 //     H_COLOR = pixels[ int( ( (faiy + sizey / 2 - 5) + kakuy ) * width + (faix + sizex / 2) + kakux )];
 //     if(fill(H_COLOR) != fill(127,255,255,70 )){
 //       return false;
 //     }
    }
  return false;
  }
  
  boolean nomuteki(){
    if(muteki != 0){
      return false;
    }
    return true;
  }
  
  void bomemuteki(int i){
    muteki = i;
  }
  
}
