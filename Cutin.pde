class Cutin{
  PImage cutinpic = loadImage("cutin.gif");
  float cutinx;
  float cutiny;
  int cutint;
  float stopx;
  
  
  Cutin(){
    cutinx = 200;
    cutiny = 250;
    cutint = 0;
    stopx = 550;
  }
  
  void cutinprint(float x, float y){
    image(cutinpic,x,y);
}
  
  void bomecutin(){
    /*
    cutint++;
    float f = stopx / 60;
    if(cutint <= 60){
      cutin.cutinprint(f * cutint);
    }else if(cutint < 180){
      cutin.cutinprint(stopx);
    }else{
      cutin.cutinprint(stopx + (cutint - 180) * f);
    }
  }
  */
  fill(255,255,255);
  ellipse(400,400,200,200);
  //image(cutinpic,cutinx ,cutiny);
  }
}
    
    
    
