class Tree{
   PImage pic;//画像
 
  Tree(){
    pic = loadImage("tree.jpg");
  }
  
  void treepic(){
    image(pic,0,0,width,height);
  }
  
}
  
  
