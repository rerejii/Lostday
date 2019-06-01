class Status{
  PImage heart = loadImage("heart.png");
  PImage bomepic = loadImage("bome.png");
  int SCORE;
  int bomeSCORE;
  int HPSCORE;
  
  Status(){
    SCORE = 0;
  }
  
  void openstatus(){
    fill(210, 255, 64, 255);
    noStroke();
    rect(600,0,200,height);
  }
  
  void HPprint(int HP){
    switch(HP){
      case 5:
        image(heart, 740, 270);
      case 4:
        image(heart, 710, 270);
      case 3:
        image(heart, 680, 270);
      case 2:
        image(heart, 650, 270);
      case 1:
        image(heart, 620, 270);
      case 0:
        textSize(30);
        fill(235,255,255);
        text("HP",620,250);
      break;
    }
  }
  
  void BOMEprint(int BOME){
    switch(BOME){
      case 5:
        image(bomepic, 740, 350);
      case 4:
        image(bomepic, 710, 350);
      case 3:
        image(bomepic, 680, 350);
      case 2:
        image(bomepic, 650, 350);
      case 1:
        image(bomepic, 620, 350);
      case 0:
        textSize(30);
        fill(25,255,255);
        text("BOME",620,330);
        
      break;
    }
  }
  
  void SCOREprint(){
    textSize(30);
    fill(255);
    text("SCORE",620,410);
    textAlign(RIGHT);
    text(SCORE,780,460);
    textAlign(LEFT);
  }
  
  void SCOREplus(int tokuten){
    SCORE += tokuten;
    bomeSCORE += tokuten;
    HPSCORE += tokuten;
  }
  
  void SCOREreset(){
    SCORE = 0;
  }
  
  boolean bomeplus(){
    if(bomeSCORE > 1000){
      bomeSCORE -= 1000;
      return true;
    }
    return false;
  }
  
  boolean HPplus(){
    if(HPSCORE > 3000){
      HPSCORE -= 3000;
      return true;
    }
    return false;
  }
  
  
}

