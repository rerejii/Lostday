class Boss{
  
  int bosst;//time
  float bossx;//妖精座標
  float bossy;//妖精座標
  float bossvx;//妖精座標
  float bossvy;//妖精座標
  int blockbossx = 0;//ブロックの座標x 0-2 3-5 6-8 9-12
  int blockbossy = 0;//ブロックの座標y 0-4 5-8ソード
  final float blockbossvx = 24;//元となるブロックごとの座標
  final float blockbossvy = 32;//元となるブロックごとの座標256
  float sizebossx = 100;//妖精画像倍率
  float sizebossy = 180;//妖精画像倍率
  final PImage bosspic = loadImage("black.png");//妖精画像
  PImage bosscut;//切り取った妖精画像格納庫
  int bossnow = 0;//画面上にいるか
  int bosscheck = 0;//初期動作のためのスイッチ
  int bossHP;//体力
  int bosstenmet;
  
  Boss(){
    bossx = 0;
    bossy = 0;
    bosst = 0;
    bossnow = 0;
  }
  
  
  void bossreset(){
    bosscheck = 0;
    bossnow = 0;
  }
  
  boolean bossrady(){
    if(bossnow == 0){
      return true;
    }
    return false;
  }
  
void bosshitter(){
    bossHP--;
    if(bossHP == 0){
      bossnow = 0;
      bossx = 0;
      bossy = 0;
      bossvx = 0;
      bossvy = 0;
    }else{
      bosstenmet = 2;
    }
  }
  
  void bossdraw(){
    if(bosstenmet == 0){
      imageMode(CENTER);
      bosscut = bosspic.get(floor(blockbossx * blockbossvx), floor(blockbossy * blockbossvy),
      floor(blockbossvx), floor(blockbossvy));
      image(bosscut, bossx, bossy, 96, 128);
      imageMode(CORNER);
    }else{
      bosstenmet--;
      
    }
  }
  
  void bosscame(int f){
    bossHP = 150 + 30 * f;
    bosstenmet = 0;
    bossx = 300;
    bossy = -48;
    bossnow = 1;
    blockbossx = 0;
    bosscheck = 0;
    bossvy = 1;
    bosst = 0;
    blockbossy = 6;
  }
  
  void bossmove(){
    if(bossnow == 1){
      bosst++;
      
      if(bosst % 100 == 0){
        bosscheck = (bosscheck + 1) % 2;
        if(bosscheck == 0){
          blockbossx = 3;
        }else{
          blockbossx = 0;
        }
      }
      
      if(bosscheck == 0){
        if(bosst % 10 == 0){
          if(blockbossx == 5){
            blockbossx = 3;
          }else{
            blockbossx++;
          }
        }
      }else{
        if(bosst % 10 == 0){
          if(blockbossx == 2){
            blockbossx = 0;
          }else{
            blockbossx++;
          }
        }
      }
        
        if(bosst <= 120){
          bossy += bossvy;
        }
       
        bossdraw();
    }
  }
    
  boolean bosscanshot(int lev){
    if(bosscheck == 0){
      int mas = bosst % 100;
      if(mas % (30 - (6 * lev) ) == 0){
        return true;
      }
    }
    return false;
  }
  
  
  int bosslive(){
    return bossnow;
  }
  
  float bosstox(){
    return bossx;
  }
  
  float bosstoy(){
    return bossy;
  }
    
  boolean bossclear(){
    if(bossnow == 0){
      return true;
    }
    return false;
  }
    
  int bossHPcame(){
    return bossHP;
  }
    
}
    
    
  
    

