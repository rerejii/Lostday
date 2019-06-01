class Lineout{
  
  Lineout(){
    int i = 0;
  }
  
  void black(float wid){
    for(int m = 0; m < 28; m++){
      int d = m * 60 + 1;
      stroke(180,255,50);
      strokeWeight(wid);
      line(d - wid /2,0,0,d - wid /2);
    }
  }
  
}
