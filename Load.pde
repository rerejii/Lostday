class Load{
  
  
  Load(){
  }
 
 void back(){
    noStroke();
    fill(180,255,50);
    //黒四角でカラー円がはみ出すのを隠す/////
    rect(180,335,450,40);
    rect(180,425,420,20);
    rect(180,355,20,100);
    rect(600,355,20,100);
    /////////////////////////////////
 }
  void ing(int longs){
    fill(0);
    stroke(255);
    strokeWeight(2);
    rect(200,375,400,50);
    fill(150,255,100);
    rect(200 + longs,375,400 - longs,50);
    int pasent =  floor(longs / 4);
    textSize(30);
    fill(longs / 2,255,255);
    text("Now Loading"+"   "+pasent + "%",470,475);
  }
  
  void loadline(int longs){
    noFill();
    stroke(255);
    strokeWeight(2);
    rect(200,375,400,50);
    fill(150,255,100);
    rect(200 + longs,375,400 - longs,50);
    int pasent =  floor(longs / 4);
    textSize(30);
    fill(longs / 2,255,255);
  }
}
