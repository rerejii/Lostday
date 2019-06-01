class Face{
  int t;//time
  float facex;//座標
  float facey;//座標
  int blockfx;//ブロックの座標x 0〜3
  int blockfy;//ブロックの座標y 0〜3
  final float blockfvx = 48;//元となるブロックごとの座標
  final float blockfvy = 48;//元となるブロックごとの座標
  float sizefx = 100;//画像倍率
  float sizefy = 100;//画像倍率
  final PImage facepic = loadImage("fase.png");//妖精画像
  PImage fac;//切り取った妖精画像格納庫

  Face(){
    t = 0;
    facex = 650;
    facey = 100;
  }
  /*
  a アイテム bボム /ダメージ
  0普通 a1やった 2ムッ 3ポヘー b4がおー 5しゅん /6ムー 7ニパー 
  8苦笑い 9じとー 10どや /11びっくり 12んっ？ /13泣き /14白目びっくり
  */
  void picface(int i){
    blockfx = i % 4;
    blockfy = floor(i / 4);
    fac = facepic.get(floor(blockfx * blockfvx), floor(blockfy * blockfvy),floor(blockfvx), floor(blockfvy));
    image(fac, facex, facey,sizefx,sizefy);
    
  }
  
}
