//---------------------------------------------------------
// FPS描画
//---------------------------------------------------------
// int TEXT_SIZE テキストサイズ
// color TEXT_COLOR_G テキストカラー 緑
// color TEXT_COLOR_Y テキストカラー 黄
// color TEXT_COLOR_R テキストカラー 赤
// void Update() 更新
// void Drawing(float x, float y) 描画
/*
  使うときはFPS FPS = new FPS(FRAME_RATE);
  ゲームのフレームレートを渡してインストラクタ呼んでくださいな。
  Update()は毎フレーム呼んで下さい。
  Drawing(float x, float y)のx, yはFPSの描画座標です。
*/
 
class FPS
{
  int TEXT_SIZE = 24;
  color TEXT_COLOR_G = color(0, 255, 0);
  color TEXT_COLOR_Y = color(255, 255, 0);
  color TEXT_COLOR_R = color(255, 0, 0);
 
  int FRAME_RATE;
  float FPS, sumFPS;
  int cntFPS;

  FPS(int _FRAME_RATE){
    FRAME_RATE = _FRAME_RATE;
    FPS = _FRAME_RATE;
  }
  void Update(){
    if(cntFPS < FRAME_RATE){
      sumFPS += frameRate;
      cntFPS++;
    }else{
      FPS = round(sumFPS / FRAME_RATE * 10) / 10.0;
      sumFPS = cntFPS = 0;
    }
  }
  void Drawing(float x, float y){
    if(FPS < FRAME_RATE / 2){
      fill(0,255,255);
    }else if(FPS < FRAME_RATE / 3 * 2){
      fill(30,255,255);
    }else{
      fill(45,255,255);
    }
    textSize(TEXT_SIZE);
    text("" + FPS, x, y);
  }
}
