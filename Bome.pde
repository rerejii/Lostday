class Bome{
  float bomex;
  float bomey;
  float bomed;
  float bomenow;
  float bomet;
  
  Bome(){
    bomex = 0;
    bomey = 0;
    bomed = 0;
    bomenow = 0;
    bomet = 255;
  }
 
 void wearb(float x, float y){
   if (bomenow == 0) {
    bomex = x;
    bomey = y;
    bomenow = 1;
    bomed = 15;
    bomet = 255;
    
   }
 }
 
 void move(){
   if(bomenow == 1){
     bomed += 8;
     if(bomed < 1500 && bomet > 0){
       strokeWeight(10);
       noFill();
       stroke(100, 50, 255, bomet);
       ellipse(bomex, bomey, bomed, bomed);

       bomet -= 2;
     }else{
       bomenow = 0;
     }
   }
 }
 
 boolean can(){
   if(bomenow == 0){
     return true;
   }
   return false;
 }
 
 float bomecheckx(){
   return bomex;
 }
 
 float bomechecky(){
   return bomey;
 }
 
 float bomecheckd(){
   return bomed;
 }
 
  
}
