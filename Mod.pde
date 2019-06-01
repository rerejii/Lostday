class Mod{
  
  int modt;//time
  float modx;//妖精座標
  float mody;//妖精座標
  float modvx;//妖精座標
  float modvy;//妖精座標
  int blockmodx = 0;//ブロックの座標x 0-2 3-5 6-8 9-12
  int blockmody = 0;//ブロックの座標y 0-4 5-8ソード
  final float blockmodvx = 24;//元となるブロックごとの座標
  final float blockmodvy = 32;//元となるブロックごとの座標256
  float sizemodx = 100;//妖精画像倍率
  float sizemody = 180;//妖精画像倍率
  final PImage modpic = loadImage("green.png");//妖精画像
  PImage modcut;//切り取った妖精画像格納庫
  int modnow = 0;//画面上にいるか
  int modcheck = 0;//初期動作のためのスイッチ
  int HP;//体力
  int tenmet;
  
  
  Mod(){
    modt = 0;
    modnow = 0;
  }
  
  void modreset(){
    modnow = 0;
  }
  
  boolean modrady(){
    if(modnow == 0){
      return true;
    }
    return false;
  }
  
  void modraw(){
    if(tenmet == 0){
      modcut = modpic.get(floor(blockmodx * blockmodvx), floor(blockmody * blockmodvy),
      floor(blockmodvx), floor(blockmodvy));
      image(modcut, modx, mody, 48, 64);
    }else{
      tenmet--;
    }
  }
  
  void came(float x, int f){
    HP = 5 + (3 * f);
    tenmet = 0;
    x += 25;
    modx = random(12,width - 224 );
    mody = -32;
    modnow = 1;
    blockmodx = 0;
    modcheck = 0;
    modvy = random(0.5,1);
    modt = 0;
    if(modx < x - 100){
      blockmody = 1;
    }else if(modx > x + 100) {
      blockmody = 3;
    }else{
      blockmody = 2;
    }
  }
  
  void modmove(float x){
    x += 25;
    if(modnow == 1){
      modt++;
      if(modt <= 180){
      
        if(modt % 10 == 0){
          if(blockmodx == 2){
            blockmodx = 0;
          }else{
            blockmodx++;
          }
        }
        if(modt <= 60){
          mody += modvy;
        }
        modraw();

      }else if(modx < -24 || modx > width - 200 || mody > height + 32){
        modnow = 0;
      }else{
        if(modcheck == 0){
          modcheck = 1;
          blockmodx = 4;
          if(modx < x - 100){
            blockmody = 1;
            modvx = random(1,3);
            modvy = random(1,3);
          }else if(modx > x + 100) {
            blockmody = 3;
            modvx  = random(-3,-1);
            modvy = random(1,3);
            
          }else{
            blockmody = 2;
            modvx  = 0; 
            modvy = random(1,3);
          }
        }
        if(modt % 10 == 0){
          if(blockmodx == 5){
            blockmodx = 3;
          }else{
            blockmodx++;
          }
        }
         modx += modvx;
         mody += modvy;
         modraw();
      }
    }
  }  
  
  void hitter(){
    HP--;
    if(HP == 0){
      modnow = 0;
      modx = 0;
      mody = 0;
      modvx = 0;
      modvy = 0;
    }else{
      tenmet = 2;
    }
  }
  
  boolean shottime(int lev){
    if(lev == 0){
      if(modt == 30 ||modt == 180){
        return true;
      }
    }else if(lev == 1){
      if(modt == 30 || modt == 180 || modt == 320){
        return true;
      }
    }else if(lev == 2){
      if(modt == 30 || modt == 180 || modt == 270 || modt == 320){
        return true;
      }
    }
    return false;
  }
      
  
  
  
  
  int modlive(){
    return modnow;
  }
  
  float modtox(){
    float sum = modx + 24;
    return sum;
  }
  
  float modtoy(){
    float sum = mody + 32;
    return sum;
  }
  
}
    
