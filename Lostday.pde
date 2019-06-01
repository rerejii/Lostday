/**
*<h1>Fairy's lost day</h1>
*
*20クラス2300行の自作プログラムです。<br>
*
*方向キー:移動、難易度選択 「z」:ショット、連射可能　「x」:ボム　「shift」:押している間低速移動　「n」:ゲームリセット 「y」:コンティニュー復活  「s」特定シーンスキップ<br>
*<ul>
*<li>妖精さんが妖精さん達と戦う縦シューティングゲームです。</li>
*<li>ステージの途中に出てくる大きな妖精さんを倒せばクリアです。</li>
*<li>難易度選択画面では方向キー上下で選択してください</li>
*<li>「z」を押している間弾が発射されます</li>
*<li>「x」を押すとボムを使用して、弾消し、広範囲攻撃、無敵化を行います。</li>
*<li>自機の中心にあるあたり判定「青い丸」に敵の弾があたるとダメージです。</li>
*<li>HPがなくなるとゲームオーバです</li>
*<li>ゲームオーバになったら「n」:ゲームリセット 「y」:コンティニュー復活　で選択してください。</li>
*<li>「n」:ゲームリセットはいつでも使えます。難易度を選び間違えた時などにどうぞ。</li>
*<li>ロゴ画面→タイトル移行→タイトル&難易度選択→ロード画面→ゲームと移行していきます。</li>
*<li>ロゴ画面,タイトル移行,ロード画面では「s」キーで１つスキップ出来ます。</li>
*<li>「s」→「s」→難易度選択→「s」が最速でゲームまで飛びます</li>
*</ul>
*
*<h2>素材として使用した画像</h2>
*<ul>
*<li>背景木: <a href="http://eurs.blog65.fc2.com/blog-category-12.html">"tree"</a></li>
*<li>弾: <a href="http://hal900.dyndns-home.com/HAL900page/index.html">"tama"</a></li>
*<li>ハート: <a href="http://www.ac-illust.com/main/search_result.php?page=3&word=%E3%83%8F%E3%83%BC%E3%83%88&mode=&cid=&word_id=&order=1&format=all&pp=69">"heart"</a></li>
*<li>星: <a href="http://www.ac-illust.com/main/search_result.php?search_word=%E6%98%9F">"star"</a></li>
*<li>妖精さんシリーズ<a href="http://www54.atwiki.jp/viprpg_sozai/pages/296.html">"fairy"</a></li>
*<li>テスト用にFPS表示プログラムを<a href="http://codetter.com/?p=805">"FPS"</a>を
借りました</li>
*<li>REREXとFairy's lost dayは自作です</li>
*<li>またゲームシステムのプログラムは自身で考えました</li>
*
*時間さえあればもっといじりたかった。
*/

//おまじない//////////////////////////////
/* @pjs preload="fairy.png"; */
/* @pjs preload="fase.png"; */
/* @pjs preload="Fairy's lost day.png"; */
/* @pjs preload="green.png"; */
/* @pjs preload="REREX.png"; */
/* @pjs preload="tree.jpg"; */
/* @pjs preload="tama.png"; */
/* @pjs preload="heart.png"; */
/* @pjs preload="owata.png"; */
/* @pjs preload="bome.png"; */
/* @pjs preload="cutin.gif"; */
////////////////////////////////////////

//6 11 13 14
//変数設定///////////////////////////////
int N = 20;//間隔
int mode = 0;//0はスタート 1オープニングムービ 2 3
int t = 0;//タイム
int t2 = 0;
int colors = 0;//白黒からー
int ballright = 0;//光の玉の大きさ
int tomei = 255;//背景の透明度
int stop = 0;//等連続禁止
int shotstop = 0;
int level = 0;//ease0 normal1 hard2
int loadball = 60;
int FRAME_RATE = 100;
float mainx = 300;//x座標
float mainy = 700;//y座標
boolean up, down, left, right, shift, z, y, n, x, c;//キーが押されたかどうか
int tamakazu = 50;//画面上に出る弾の最大数
int MODkazu = 50;//画面上に出る敵の最大数
int modwarm;//敵が一度にでた数
int greenkazu = 100;
int faiHP = 5;
int [] damegiface = {6,11,13,14};
int faceswitch = 0;
int face4;
int bomestop = 0;
int bomet = 0;
int faiBOME = 3;
int t7 = 0;
int true1 = 0;
int true2 = 0;
int noreset = 0;
int hako;
//PImage apic = loadImage("cutin.gif");
//PImage pic;//画像
//変数設定ここまで///////////////////////////////

//オブジェクト宣言///////////////////////////////
Start start; //Start型変数であるstartの宣言
Fairy fairy; //Fairy型変数であるfairyの宣言
Hikari[] hikari = new Hikari[N]; //Hikari型変数であるhikariの宣言
Tree tree;//Tree型変数であるtreeの宣言
Lost lost;//Lost型変数であるlostの宣言
Manu manu;//Manu型変数であるmanuの宣言
Lineout lineout;//Lineout型変数であるLineoutの宣言
Load load;//Lode型変数であるlodeの宣言
Colball[] colball = new Colball[loadball]; //Colball型変数であるcolballの宣言
Status status;//Status型変数であるstatusの宣言
Face face;//Face型変数であるfaceの宣言
Shot[] shot = new Shot[tamakazu];//Shot型変数であるshotの宣言
Mod[] mod = new Mod[MODkazu];//Mod型変数であるmodの宣言
Greenshot[] greenshot = new Greenshot[MODkazu * 2];//Greenshot変数であるgreenshotの宣言
Gameover gameover;//Gameover変数であるgameoverの宣言
Bome bome;//Bome変数であるbomeの宣言
Cutin cutin;//Cutin変数であるcutinの宣言
Boss boss;//Boss変数であるbossの宣言
Clear clear;//Boss変数であるbossの宣言
FPS fps;//http://codetter.com/?p=805から拝借
//オブジェクト宣言ここまで///////////////////////////////

//set up//////////////////////////////////
void setup(){
  size(800,800);
  colorMode(HSB);//カラーモードHSB
  //せんげーん//////////////////////////////
  start = new Start();
  fairy = new Fairy();
  tree = new Tree();
  lost = new Lost();
  manu = new Manu();
  lineout = new Lineout();
  fps = new FPS(FRAME_RATE);
  load = new Load();
  status = new Status();
  face = new Face();
  gameover = new Gameover();
  bome = new Bome();
  cutin = new Cutin();
  boss = new Boss();
  clear = new Clear();
  for(int i = 0; i < N; i++){
    hikari[i] = new Hikari(i * (width / N) );
  }
  for(int i = 0; i < loadball; i++){
    colball[i] = new Colball();
  }
  for(int i = 0; i < tamakazu; i++){
    shot[i] = new Shot();
  }
  for(int i = 0; i < MODkazu; i++){
    mod[i] = new Mod();
  }
  for(int i = 0; i < greenkazu; i++){
    greenshot[i] = new Greenshot();
  }
  //せんげーん//////////////////////////////
  
  //pic = loadImage("tree.jpg");
}
//set up//////////////////////////////////


//メイン//////////////////////////////////
void draw(){
  //モードスイッチ制/////////////////////////////
  
  switch(mode){
    case 0://スタート
      t++;//タイム
      background( colors );//背景
      
      start.draw();//REREX
      fairy.startmove();//妖精動かすよ
      if(t > 220 && colors < 255){//背景を白く
        colors += 3;
      }
      
      if(t == 350){//次のモード
        mode++;
        colors = 0;
        t = 0;
      }
      
    break;
      
    case 1:
    t++;
    
    if(t < 180){//動きがあるまでのつなぎ
      background(colors);
    }
    
    if(t >= 180 && t < 270){//画面ホワイト
      if(colors < 253){
        background(colors);
        colors += 3;
      }else{
        background(colors);
        colors = 255;
      }
    }
   
    if(t >= 270 && tomei > 0){//白がはれるまで
      tree.treepic();//背景木
      lost.lostpic();//Fairy's lost day
      fairy.standby(level);//妖精カーソル
      tomei--;//透明度減少
      fill(colors, tomei);//カラー
      rect( 0, 0, width, height);//背景ホワイト
      
    }else if(t >= 270 && tomei <= 0){//next mode
      tree.treepic();
      lost.lostpic();
      fairy.standby(level);
      mode++;
      t = 0;
    }
    
    if(t >= 100){//光の玉
      if(t % 10 == 0 && ballright < 10){
          ballright++;
        }
      for(int i = 0;i < N; i++){
        hikari[i].ball(ballright);
        hikari[i].move();
      }
    }
      
      
    break;
    
    case 2:
    
    t++;
    
    //background(pic);
    tree.treepic();
    lost.lostpic();
    fairy.standby(level);
    
    if(t >= 0){//光の玉
      if(t % 10 == 0 && ballright < 10){
          ballright++;
        }
      for(int i = 0;i < N; i++){
        hikari[i].ball(ballright);
        hikari[i].move();
      }//for
    }//if
    
    manu.starttext();

    textSize(10);
    
    //決定z押したらモード移行
    if(key == 'z'){
        mode = 3;
        t = 0;
    }
    
    break;
    
    case 3:
    
    t++;
    
    if(t <= 60){
      
      tree.treepic();
      lost.lostpic();
      fairy.standby(level);
    
      if(t >= 0){//光の玉
        if(t % 10 == 0 && ballright < 10){
            ballright++;
          }
        for(int i = 0;i < N; i++){
          hikari[i].ball(ballright);
          hikari[i].move();
        }//for
      }//if
      
      lineout.black(t);
      
    }
    
    if(t > 60){
      if(t2 <= 400){
        t2 += 2;
      }
      background(180,255,50);
      load.ing(t2);
      for(int i = 0; i < loadball; i++){
        colball[i].geji();
      }
      load.back();
      
      load.loadline(t2);
      if(t == 300){
        t = 0;
        t2 = 0;
        mode++;
      }
    }
    
    onstop();
    
    break;
   
    case 4:
    t++;
    
    if (t == 10){
      mainx = 300;//x座標
      mainy = 700;//y座標
    }
    
    if(t < 30){
    background(180,255,50);
    t2 = 60;
    }
    
    
    if(t >= 30 && t2 > 0){
      t2--;
      background(0);
      fairy.fairygame(mainx, mainy);
      lineout.black(t2);
    }else if(t > 80){
      background(0);
      fairy.fairygame(mainx, mainy);
      mode++;
      t = 0;
    }
    break;
    
    case 5:
    t++;
    if(fairy.nomuteki() && fairy.atari()){
      faiHP--;
    }
    
    background(0);
    bome.move();
    if(status.bomeplus() && faiBOME < 5){
      faiBOME++;
    }
    if(status.HPplus() && faiHP < 5){
      faiHP++;
    }
//////アイテムはここより後ろ、あたり判定あるのは前に書く/////////////////////////////
    if(faiHP > 0){
      fairy.fairygame(mainx,mainy);
      faigo();
      
    }else{//ゲームオーバ
      mode++;
    }
    for(int i = 0; i < tamakazu; i++){
      shot[i].shotmove();
    }
    
    //敵//////////////////////////////////////////////
    
    if(t % 150 == 0){
      modwarm = 0;
      for(int i = 0; i < MODkazu; i++){
        if(mod[i].modrady()){
          mod[i].came(mainx, level);
          modwarm++;
          if(modwarm == 3 + floor(level / 2)  ){
            break;
          }
        }
      }
    }
    
    for(int i = 0; i < MODkazu; i++){
      mod[i].modmove(mainx);
      if(mod[i].shottime(level) ){
      //  if(m < greenkazu){
        for(int m = 0; m < greenkazu; m++){
          if(greenshot[m].greenshotfin() ){
            greenshot[m].greenshotstart(mod[i].modtox(), mod[i].modtoy(), mainx + 24, mainy + 32,0);
            m++;
            break;
          }
     //   }else{
     //     m = 0;
      //    greenshot[m].greenshotstart(mod[i].modtox(), mod[i].modtoy(), mainx + 24, mainy + 32,0);
      //    m++;
        }
      }
    }
      for(int f = 0; f < MODkazu; f++){
        greenshot[f].greenshotmove();
      }
      
    //敵//////////////////////////////////////////////
    
    
    status.openstatus();
    /////////////////////////////
    if(fairy.nomuteki() == false ){
      if(bome.can() == false){
        face.picface(4);
      }else if(faceswitch == 0){
        face4 = int(random(0,3) );
        face.picface( damegiface[face4] );
        faceswitch = 1;
      }else{
        face.picface( damegiface[face4] );
      }
    }else{
      face.picface(0);
      faceswitch = 0;
    }
    ////////////////////////////
    status.HPprint(faiHP);
    status.BOMEprint(faiBOME);
    status.SCOREprint();
    hitormiss();
    bomepowar();
    
    if( t == 1000){
      mode = 8;
      t = 0;
    }
    
//    strokeWeight(30);
//    fill(255,255,255);
//    stroke(0,255,255);
//    line(100,0,100,800);



    break;
    
    case 6:
    background(0);
    for(int i = 0; i < MODkazu; i++){
      mod[i].modmove(mainx);
      if(mod[i].shottime(level) ){
      //  if(m < greenkazu){
        for(int m = 0; m < greenkazu; m++){
          if(greenshot[m].greenshotfin() ){
            greenshot[m].greenshotstart(mod[i].modtox(), mod[i].modtoy(), mainx + 24, mainy + 32,0);
            m++;
            break;
          }
        }
      }
    }
      for(int f = 0; f < MODkazu; f++){
        greenshot[f].greenshotmove();
      }
    status.openstatus();
    
    /////////////////////////////
    if(fairy.nomuteki() == false ){
      if(faceswitch == 0){
        face4 = int(random(0,3) );
        face.picface( damegiface[face4] );
        faceswitch = 1;
      }else{
        face.picface( damegiface[face4] );
      }
    }else{
      face.picface(0);
      faceswitch = 0;
    }
    ////////////////////////////
    
    status.HPprint(faiHP);
    status.BOMEprint(faiBOME);
    status.SCOREprint();
    gameover.end();
    break;
    


    case 7:
     t7++;
    if(t7 < 30){
      background(0);
      fairy.fairygame(mainx,mainy);
      for(int i = 0; i < tamakazu; i++){
        shot[i].printshot();
      }
      for(int i = 0; i < MODkazu; i++){
      mod[i].modraw();
      greenshot[i].greenshotdraw();
      }
      status.openstatus();
      status.HPprint(faiHP);
      status.BOMEprint(faiBOME);
      status.SCOREprint();
      face.picface(4);
      imageMode(CENTER);
      cutin.cutinprint(400,400);
      imageMode(CORNER);
    }else{
      fairy.bomemuteki(20);//無敵時間
    mode = hako;
    }
    break;
    
    case 8://ボス
    
    t++;
    
    if(t == 1){
      boss.bosscame(level);
    }
    
    if(fairy.nomuteki() && fairy.atari()){
      faiHP--;
    }
    
    background(0);
    bome.move();
    if(status.bomeplus() && faiBOME < 5){
      faiBOME++;
    }
    if(status.HPplus() && faiHP < 5){
      faiHP++;
    }
//////アイテムはここより後ろ、あたり判定あるのは前に書く/////////////////////////////
    if(faiHP > 0){
      fairy.fairygame(mainx,mainy);
      faigo();
      
    }else{//ゲームオーバ
      mode = 6;
    }
    for(int i = 0; i < tamakazu; i++){
      shot[i].shotmove();
    }
    
    //敵//////////////////////////////////////////////
    
    if(t % 150 == 0){
      modwarm = 0;
      for(int i = 0; i < MODkazu; i++){
        if(mod[i].modrady()){
          mod[i].came(mainx, level);
          modwarm++;
          if(modwarm == 3 + floor(level / 2)  ){
            break;
          }
        }
      }
    }
    
    for(int i = 0; i < MODkazu; i++){
      mod[i].modmove(mainx);
      if(mod[i].shottime(level) ){
      //  if(m < greenkazu){
        for(int m = 0; m < greenkazu; m++){
          if(greenshot[m].greenshotfin() ){
            greenshot[m].greenshotstart(mod[i].modtox(), mod[i].modtoy(), mainx + 24, mainy + 32,0);
            m++;
            break;
          }
     //   }else{
     //     m = 0;
      //    greenshot[m].greenshotstart(mod[i].modtox(), mod[i].modtoy(), mainx + 24, mainy + 32,0);
      //    m++;
        }
      }
    }
      for(int f = 0; f < MODkazu; f++){
        greenshot[f].greenshotmove();
      }
      
      
      //ボス
      
      boss.bossmove();
      
      if(boss.bosscanshot(level) ){
        for(int m = 0; m < greenkazu; m++){
          if(greenshot[m].greenshotfin() ){
            greenshot[m].greenshotstart(boss.bosstox(), boss.bosstoy(), mainx + 24, mainy + 32,0);
            m++;
            break;
          }
        }
      }
      
    //敵//////////////////////////////////////////////
    
    
    status.openstatus();
    /////////////////////////////
    if(fairy.nomuteki() == false ){
      if(bome.can() == false){
        face.picface(4);
      }else if(faceswitch == 0){
        face4 = int(random(0,3) );
        face.picface( damegiface[face4] );
        faceswitch = 1;
      }else{
        face.picface( damegiface[face4] );
      }
    }else{
      face.picface(0);
      faceswitch = 0;
    }
    ////////////////////////////
    status.HPprint(faiHP);
    status.BOMEprint(faiBOME);
    status.SCOREprint();
    hitormiss();
    bomepowar();
    if(boss.bossHPcame() == 0 && t > 10 ){
      mode++;
      t = 0;
    }
    
    break;
    
    case 9:
    
    t++;
    
    if(t == 1){
      boss.bosscame(level);
    }
    
    if(fairy.nomuteki() && fairy.atari()){
      faiHP--;
    }
    
    background(0);
    fairy.bomemuteki(9);
    bome.move();
    if(status.bomeplus() && faiBOME < 5){
      faiBOME++;
    }
    if(status.HPplus() && faiHP < 5){
      faiHP++;
    }
//////アイテムはここより後ろ、あたり判定あるのは前に書く/////////////////////////////
    if(faiHP > 0){
      fairy.fairygame(mainx,mainy);
      faigo();
      
    }
    for(int i = 0; i < tamakazu; i++){
      shot[i].shotmove();
    }
    
    //敵//////////////////////////////////////////////
    
    
    for(int i = 0; i < MODkazu; i++){
      mod[i].modmove(mainx);
      if(mod[i].shottime(level) ){
      //  if(m < greenkazu){
        for(int m = 0; m < greenkazu; m++){
          if(greenshot[m].greenshotfin() ){
            greenshot[m].greenshotstart(mod[i].modtox(), mod[i].modtoy(), mainx + 24, mainy + 32,0);
            m++;
            break;
          }
     //   }else{
     //     m = 0;
      //    greenshot[m].greenshotstart(mod[i].modtox(), mod[i].modtoy(), mainx + 24, mainy + 32,0);
      //    m++;
        }
      }
    }
      for(int f = 0; f < MODkazu; f++){
        greenshot[f].greenshotmove();
      }
      
      
      
      
      
    //敵//////////////////////////////////////////////
    
    
    status.openstatus();
    /////////////////////////////
    
    face.picface(7);
    
    ////////////////////////////
    status.HPprint(faiHP);
    status.BOMEprint(faiBOME);
    status.SCOREprint();
    hitormiss();
    bomepowar();
    
    fill(255,t);
    rect(0,0,width,height);
    if(t == 255){
      mode++;
    }
    break;
    
    case 10:
    background(255);
    clear.clearmode();
    break;
  }//swith
  //速度観察機////////////////////////////
//      textSize(10);
//      fill(25,255,255);
//      text(t,0,height - 20);//速度観察機
  //速度観察機////////////////////////////
  
  //FPS/////////////////////////////////
//  fps.Update();
//  fps.Drawing(730,790);
  //FPS/////////////////////////////////
  onstop();
  
  
  
}//draw end/////////////////////////////////////////////////////////////////////////////////////////////////////

void keyPressed(){
  
  if(key == 'n'){
      allreset();
  }
  
  switch(mode){
    case 0://スタート//////////////////////////
    faimove();
    if(key == 's') {//スキップ
      skip();
    }
    break;//
    
    case 1://////////////////////////////////
    faimove();
    if(key == 's') {//スキップ
      skip();
    }
    break;//
    
    case 2://////////////////////////////////
    faimove();
  //選択　モード2
    if(key == CODED){
      if(keyCode == UP){
        if(level == 0){
          level = 2;
        }else{
          level--;
        }
      }else if(keyCode == DOWN){
        if(level == 2){
          level = 0;
        }else{
          level++;
        }
      }
    }
    break;
    
    case 3:////////////////////////////
    faimove();
    if(key == 's') {//スキップ
      skip();
    }
    break;//
    
    case 4:
    faimove();
    break;
    
    case 5://///////////////////////////
      faimove();
    break;//
    
    case 6:
    faimove();
    if(key == 'y') {
      mode = 5;
      faiHP = 5;
      faiBOME = 3;
      mainx = 300;
      mainy = 700;
      t = 0;
      status.SCOREreset();
      boss.bossreset();
    }else if(key == 'n') {
      allreset();
      boss.bossreset();
      for(int i = 0;i < tamakazu;i++){
        greenshot[i].greenshotRESET();
        mod[i].modreset();
      }
    }
    break;//
    
    case 7://///////////////////////////
      faimove();
    break;//
    
    case 8://///////////////////////////
      faimove();
    break;//
    
    case 9://///////////////////////////
      faimove();
    break;//
    
  }//swich
}//keyPressed

void keyReleased() {

  switch(mode){
      
    case 0:
      faistop();
    break;
    case 1:
      faistop();
    break;
    case 2:
      faistop();
    break;
    case 3:
      faistop();
    break;
    case 4:
      faistop();
    break;
    case 5:
      faistop();
    break;
    case 6:
      faistop();
    break;
    case 7:
      faistop();
    break;
    case 8:
      faistop();
    break;
    case 9:
      faistop();
    break;
  }
  

}
void skip(){//スキップ関数
  if(stop == 0){
    mode++;
    t = 0;
    t2 = 0;
    stop = 1;
    colors = 0;
    ballright = 0;//光の玉の大きさ
    
  }
}

void onstop(){
  if(keyPressed == false){
    stop = 0;
  }
}

void faimove(){
  //使用するキーが押されたら、対応する変数をtrueに
   switch(keyCode) {
    case UP:
      up = true;
      break;
    case DOWN:
      down = true;
      break;
    case LEFT:
      left = true;
      break;
    case RIGHT:
      right = true;
      break;
    case SHIFT:
      shift = true;
      break;
  }
  switch(key){
    case 'z':
      z = true;
      break;
      case 'y':
      y = true;
      break;
      case 'n':
      n = true;
      break;
      case 'x':
      x = true;
      break;
      case 'c':
      c = true;
      case 'C':
      c = true;
      case 'Z':
      z = true;
      break;
      case 'X':
      x = true;
      break;
      case 'Y':
      y = true;
      break;
      case 'N':
      n = true;
      break;
  }
}
    
void faistop(){
  //使用するキーが押されたら、対応する変数をtrueに
   switch(keyCode) {
    case UP:
      up = false;
      break;
    case DOWN:
      down = false;
      break;
    case LEFT:
      left = false;
      break;
    case RIGHT:
      right = false;
      break;
    case SHIFT:
      shift = false;
      break;
  }
  switch(key){
    case 'z':
      z = false;
      break;
      case 'y':
      y = false;
      break;
      case 'n':
      n = false;
      break;
      case 'x':
      x = false;
      case 'c':
      c = true;
      case 'C':
      c = true;
      break;
      case 'Z':
      z = false;
      break;
      case 'X':
      x = false;
      break;
      case 'Y':
      y = false;
      break;
      case 'N':
      n = false;
      break;
  }
}

void faigo(){
  
  
  
  if(shift){
    if(up && mainy > 2) {
      mainy -= 2;
    }
    if(down && mainy < height - 90) {
      mainy += 2;
    }
    if(left && mainx > 2) {
      mainx -= 2;
    }
    if(right && mainx < width - 50 - 200) {
      mainx += 2;
    }
    

  
  }else{
    if(up && mainy > 2) {
      mainy -= 5;
    }
    if(down && mainy < height - 90) {
      mainy += 5;
    }
    if(left && mainx > 2) {
      mainx -= 5;
    }
    if(right && mainx < width - 50 - 200) {
      mainx += 5;
    }
  }
  
  shotandbome();
    
  
}
  
void shotandbome(){
  if(z){//zでショット
  if(shotstop == 0){
    shotstop = 7;
    
    int GO = tamakazu;
      for(int i = 0; i < tamakazu; i++){
        if(shot[i].shotcheck()){
          GO = i;
          break;
        }
      }
      if(GO != tamakazu){
        shot[GO].fire(mainx + 8, mainy - 17);
      }
      
       GO = tamakazu;
      for(int i = 0; i < tamakazu; i++){
        if(shot[i].shotcheck()){
          GO = i;
          break;
        }
      }
      if(GO != tamakazu){
        shot[GO].fire(mainx + 25, mainy - 17);
      }
      
    }else{
      shotstop--;
    }
  }else{
    shotstop = 0;
  }
  

  if(x){
    if(faiBOME != 0 && bomestop == 0 && bome.can() ){
      bomestop = 1;
      bome.wearb(mainx + 32,mainy + 48);
      
      faiBOME--;
      hako = mode;
      mode = 7;
      t7 = 0;
    }
  }else{
    bomestop = 0;
  }
}
  
  
  
  
  
  
  void hitormiss(){
    /*
    int h = 0;
    int o = 0;
    int [] sh = new int[tamakazu];
    int [] mo = new int[MODkazu];
    for(int i = 0; i < tamakazu; i++){
      if(shot[i].shotlive() == 1){
        sh[h] = i;
        h++;
      }
    }
    
    for(int i = 0; i < MODkazu; i++){
      if(mod[i].modlive() == 1){
        sh[o] = i;
        o++;
      }
    }

    for(int i = 0; i < h; i++){
      for(int m = 0; m < o; m++){
        if( abs(shot[ sh[i] ].shottox() - mod[ mo[m] ].modtox() ) < 24 && 
        abs( shot[ sh[i] ].shottoy() - mod[ mo[m] ].modtoy() ) < 43 ){
          shot[ sh[i] ].shotbreak();
          mod[ mo[m] ].hitter();
          status.SCOREplus(10);
        }
      }
    }
    */
    for(int i = 0; i < tamakazu; i++){
      for(int m = 0; m < MODkazu; m++){
        if( abs(shot[ i ].shottox() - mod[ m ].modtox() ) < 24 && 
        abs( shot[ i ].shottoy() - mod[ m ].modtoy() ) < 43 &&
        shot[i].shotlive() == 1 && mod[m].modlive() == 1){
          shot[ i ].shotbreak();
          mod[ m ].hitter();
          status.SCOREplus(10);
        }
      }
    }
    if(boss.bossrady() == false){
      for(int i = 0; i < tamakazu; i++){
        if( abs(shot[i].shottox() - boss.bosstox() ) < 52 && 
          abs( shot[i].shottoy() - boss.bosstoy() ) < 70 &&
          boss.bosslive() == 1){
            shot[i].shotbreak();
            boss.bosshitter();
            status.SCOREplus(30);
        }
      }
    }
                      
  }
  
  void bomepowar(){
    if(bome.can() == false){
      for(int i = 0; i < tamakazu; i++){
        float sum = abs(dist(greenshot[i].greencheckx(),greenshot[i].greenchecky(),
        bome.bomecheckx(),bome.bomechecky() ) );
        if(greenshot[i].greenshotfin() == false && sum - (bome.bomecheckd() / 2) < 2){
          greenshot[i].greenshotend();
        }
      }
      
      if(bomet == 0){
        for(int i = 0; i < MODkazu; i++){
          float sum = abs(dist(mod[i].modtox(),mod[i].modtoy(),
          bome.bomecheckx(),bome.bomechecky() ) );
          if(mod[i].modlive() == 1 && sum - (bome.bomecheckd() / 2) < 2){
            mod[i].hitter();
            bomet = 3;
          }
        }
      }else{
        bomet -= 1;
      }
    }
  }
  
  void allreset(){
    faiHP = 5;
      mode = 0;
      t = 0;
      t2 = 0;
      stop = 1;
      colors = 0;
      mainx = 300;
      mainy = 700;
      fairy.RESET();
      start.RESET();
      status.SCOREreset();
      boss.bossreset();
      for(int i = 0;i < tamakazu;i++){
        shot[i].shotbreak();
      }
      for(int i = 0; i < greenkazu; i++){
        greenshot[i].greenshotRESET();
      }
      for(int i = 0; i < MODkazu; i++){
        mod[i].modreset();
      }
      ballright = 0;
  }
    
