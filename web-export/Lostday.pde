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
    
    
  
    

class Clear{
  
  Clear(){
  }
  
  void clearmode(){
    fill(25,255,255);
    textSize(40);
    //textAlign(CENTER);
    text("遊んでくれてありがとう!!!",150,300);
    text("続きは製品版を催促してね!!",140,500);
    textSize(15);
    text("nキーでタイトルにゆっくりもどってね!!",250,650);
  }
  
}
class Colball{
  float x;
  float y;
  float dy;//スピード
  float wid;//ロードバーの長さ
  float hig;//ロードバーの高さ
  float lodx;//ロードバーの基準x座標
  float lody;//ロードバーの基準y座標
  float DIA;//円の直径
  float colors;
  
  Colball(){
    wid = 400;
    hig = 50;
    lodx = 200;
    lody = 375;
    DIA = random(5,30);
    x = random(lodx, lodx + wid);
    y = random(lody, hig + lody);
    dy = random(1,3);
    colors = random(0,255);
  }
  //load時のボール
   void geji(){
     fill(colors,255,255);
     noStroke();
     ellipse(x,y,DIA,DIA);
     
     if(y + DIA / 2 < lody){
       x = random(lodx,lodx + wid);
       y = hig + lody;
       dy = random(1,3);
       DIA = random(5,30);
       colors = random(0,255);
     }else{
       y -= dy;
     }
   }
  
}
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
class Gameover{
  PImage owatapic = loadImage("owata.png");
  Gameover(){
  }
  void end(){
    fill(25,255,255);
    textSize(40);
    text("Continue? Y/N",250,380);
    image(owatapic,650,100,100,100);
  }
}

class Greenshot{
  //ショット用変数///////////////////////////////
  float greenx;//円のx座標
  float greeny;//円のy座標
  float greent;//円の進む角度
  float greenv;//円の速度
  float greensx;//円描写の基準となるx座標
  float greensy;//円描写の基準となるy座標
  float greenp;////円の中心からの距離
  float greenfin;//画面内にいるかどうかの変数
  //ショット用変数///////////////////////////////

  Greenshot(){
  }
  
  void greenshotRESET(){
    greenx = 0;
    greeny = 0;
    greensx = 0;
    greensy = 0;
    greenv = 0;
    greent = 0;
    greenp = 0;
    greenfin = 0;
  }
  
  void greenshotdraw(){
    ellipse( greenx, greeny, 20, 20);
  }

  void greenshotmove(){
    
    if( abs(greenx - width / 2) + abs(greeny - height / 2) 
    < (width + height) / 2 && greenfin == 1){
        fill(210,255,255 );
        ellipse( greenx, greeny, 20, 20);
      greenp += greenv;
      greenx = greenp * cos(greent) + greensx;
      greeny = greenp * sin(greent) + greensy;
    }else{
      greenfin = 0;
    }
  
  }
  
  void greenshotstart(float mx, float my, float fx, float fy, float plust){

    greenx = mx;
    greeny = my;
    greensx = mx;
    greensy = my;
    greenv = random(4,7);
//    greent = atan2(my - fy, mx - my);
    greent = atan2(fy - my, fx - mx) + radians(plust);
    greenp = 0;
    greenfin = 1;

  }
  
  boolean greenshotfin(){
    if(greenfin == 0){
    return true;
    }
    return false;
  }
  
  float greencheckx(){
   return greenx;
 }
 
 float greenchecky(){
   return greeny;
 }
 void greenshotend(){
   greenfin = 0;
 }
  
}

/*
画面上に光の球を浮かべるHikari
個数を設定しなければx座標に等間隔、y座標にランダムに配置
*/

class Hikari{
  float x;
  float y;
  float vx;
  float vy;
  float dx;//基準軸
  float ran;
  float ran2;
  
  Hikari(int m){
    ran = random(-30,30);
    ran2 = random(0, 60);
    x = m - ran;
    y = random(0,height);
    vx = 0;
    vy = 0.5;
    dx = m;
  }


 void ball(int i){
    noStroke();
    while(i > 0){
      fill(255,250 - (i * 25) );
      ellipse(x, y, i * 2, i * 2);
      i--;
    }
  }
  
  void move(){
    if(ran2 < 0){
      y += vy;
      x += vx;
      vx += 0.001 * (dx - x);
    }else{
      ran2 -= 1;
    }
    
    if(y >= height + 10){
      ran = random(-30,30);
      y = 0;
    }
  }
  
  
}

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
class Lost{
  
  PImage pic;//画像
 
  Lost(){
    pic = loadImage("Fairy's lost day.png");
  }
  
  void lostpic(){
    image(pic,70,50,350,100);
  }
  
}
class Mod{
  
  int modt;//time
  float modx;//妖精座標
  float mody;//妖精座標
  float modvx;//妖精座標
  float modvy;//妖精座標
  int blockmodx = 0;//ブロックの座標x 0-2 3-5 6-8 9-12
  int blockmody = 0;//ブロックの座標y 0-4 5-8ソード
  final float blockmodvx = 24;//元となるブロックごとの座標
  final float blockmodvy = 32;//元となるブロックごとの座標256
  float sizemodx = 100;//妖精画像倍率
  float sizemody = 180;//妖精画像倍率
  final PImage modpic = loadImage("green.png");//妖精画像
  PImage modcut;//切り取った妖精画像格納庫
  int modnow = 0;//画面上にいるか
  int modcheck = 0;//初期動作のためのスイッチ
  int HP;//体力
  int tenmet;
  
  
  Mod(){
    modt = 0;
    modnow = 0;
  }
  
  void modreset(){
    modnow = 0;
  }
  
  boolean modrady(){
    if(modnow == 0){
      return true;
    }
    return false;
  }
  
  void modraw(){
    if(tenmet == 0){
      modcut = modpic.get(floor(blockmodx * blockmodvx), floor(blockmody * blockmodvy),
      floor(blockmodvx), floor(blockmodvy));
      image(modcut, modx, mody, 48, 64);
    }else{
      tenmet--;
    }
  }
  
  void came(float x, int f){
    HP = 5 + (3 * f);
    tenmet = 0;
    x += 25;
    modx = random(12,width - 224 );
    mody = -32;
    modnow = 1;
    blockmodx = 0;
    modcheck = 0;
    modvy = random(0.5,1);
    modt = 0;
    if(modx < x - 100){
      blockmody = 1;
    }else if(modx > x + 100) {
      blockmody = 3;
    }else{
      blockmody = 2;
    }
  }
  
  void modmove(float x){
    x += 25;
    if(modnow == 1){
      modt++;
      if(modt <= 180){
      
        if(modt % 10 == 0){
          if(blockmodx == 2){
            blockmodx = 0;
          }else{
            blockmodx++;
          }
        }
        if(modt <= 60){
          mody += modvy;
        }
        modraw();

      }else if(modx < -24 || modx > width - 200 || mody > height + 32){
        modnow = 0;
      }else{
        if(modcheck == 0){
          modcheck = 1;
          blockmodx = 4;
          if(modx < x - 100){
            blockmody = 1;
            modvx = random(1,3);
            modvy = random(1,3);
          }else if(modx > x + 100) {
            blockmody = 3;
            modvx  = random(-3,-1);
            modvy = random(1,3);
            
          }else{
            blockmody = 2;
            modvx  = 0; 
            modvy = random(1,3);
          }
        }
        if(modt % 10 == 0){
          if(blockmodx == 5){
            blockmodx = 3;
          }else{
            blockmodx++;
          }
        }
         modx += modvx;
         mody += modvy;
         modraw();
      }
    }
  }  
  
  void hitter(){
    HP--;
    if(HP == 0){
      modnow = 0;
      modx = 0;
      mody = 0;
      modvx = 0;
      modvy = 0;
    }else{
      tenmet = 2;
    }
  }
  
  boolean shottime(int lev){
    if(lev == 0){
      if(modt == 30 ||modt == 180){
        return true;
      }
    }else if(lev == 1){
      if(modt == 30 || modt == 180 || modt == 320){
        return true;
      }
    }else if(lev == 2){
      if(modt == 30 || modt == 180 || modt == 270 || modt == 320){
        return true;
      }
    }
    return false;
  }
      
  
  
  
  
  int modlive(){
    return modnow;
  }
  
  float modtox(){
    float sum = modx + 24;
    return sum;
  }
  
  float modtoy(){
    float sum = mody + 32;
    return sum;
  }
  
}
    
/*
弾幅16,長さ22
*/

class Shot{
  float shotx;//x座標
  float shoty;//y座標
  int shotnow;//画面上にあるか
  PImage shotpic = loadImage("tama.png");//
  float shotvx;//xスピード
  float shotvy;//yスピード
  
  Shot(){
    shotx = 0;
    shoty = 0;
    shotnow = 0;
    shotvy = -10;
  }
  
  void printshot(){
    image(shotpic,shotx,shoty);
  }
  
  void fire(float x, float y){
    shotnow = 1;
    shotx = x;
    shoty = y + shotvy;
    image(shotpic,shotx,shoty);
  }
  
  void shotmove(){
    if(shotnow == 1){
      shoty += shotvy;
      if(shoty < -74){
        shotnow = 0;
        shotx = 0;
        shoty = 0;
      }else{
      image(shotpic,shotx,shoty);
      }
    }
  }
  
  boolean shotcheck(){
    if(shotnow == 0){
      return true;
    }
    return false;
  }
  
  void shotbreak(){
    shotnow = 0;
    shotx = 0;
    shoty = 0;
    /*
    shotx = 0;
    shoty = 0;
    shotvx = 0;
    shotvy = 0;
    */
  }
  
  int shotlive(){
    return shotnow;
  }
  
  float shottox(){
    float sum = shotx + 8;
    return sum;
  }
  
  float shottoy(){
    float sum = shoty + 11;
    return sum;
  }
  
}
  
/*
スタート時にロゴを表示させる
*/

class Start{
  
  float rx;
  float ry;
  PImage fairy;
  PImage rogo;
  PImage rogocut;
  int s ;//文字の幅
  int t = 0;
  int next;
  int colors;
  
  Start(){
    rogo = loadImage("REREX.png");
    t = -40;
    next = 0;
    colors = 0;
  }
  
  void RESET(){
    t = -40;
  }
  
  void draw(){
    t += 3;//タイムを進める
   // txt(t / 50);//ロゴ表示
   if(t < 0){
     s = 0;
   }else{
     s = t;
   }
   rogocut = rogo.get(0, 0, s, rogo.height);
    image(rogocut, (width-rogo.width)/2, (height-rogo.height)/2);
  }
  
  void nextplus(){
    next++;
  }
  
  
  
}
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

class Tree{
   PImage pic;//画像
 
  Tree(){
    pic = loadImage("tree.jpg");
  }
  
  void treepic(){
    image(pic,0,0,width,height);
  }
  
}
  
  
class Fairy{
  int t;//time
  float faix;//妖精座標
  float faiy;//妖精座標
  float kakux;//当たり判定用
  float kakuy;//当たり判定用
  int H_POINT;//判定回数
  color H_COLOR;//判定用カラー
  int blockx;//ブロックの座標x 0〜3動き
  int blocky;//ブロックの座標y 0〜3向き 0前 1左 2右 3後
  final float blockvx = 32;//元となるブロックごとの座標
  final float blockvy = 48;//元となるブロックごとの座標
  float sizex = 100;//妖精画像倍率
  float sizey = 180;//妖精画像倍率
  final PImage faipic = loadImage("fairy.png");//妖精画像
  PImage fai;//切り取った妖精画像格納庫
  float muteki;//無敵時間
  float mswitch;//点滅用スイッチ
Fairy(){
    faix = 0;     //妖精用座標x
    faiy = (height-faipic.height)/2; //妖精用座標y
    t = 0;
    H_POINT = 120;
    muteki = 0;
    mswitch = 0;
  }
  
    void RESET(){
    faix = 0;     //妖精用座標x
    faiy = (height-faipic.height)/2; //妖精用座標y
    t = 0;
    H_POINT = 120;
    muteki = 0;
    mswitch = 0;
    sizey = 180;//妖精画像倍率
    sizex = 100;//妖精画像倍率
    }
  
    void startmove(){

    

    faix += 3;//左から右へ
    blocky = 2;//右向き
    t++;//タイムを動かす
    if(t == 10){//妖精に時間ごとに動きを入れる
      blockx = (blockx + 1) % 4;
      //println(blockx);//てすと
      t = 0;
    }
    fai = faipic.get(floor(blockx * blockvx), floor(blocky * blockvy),
    floor(blockvx), floor(blockvy));
    fairy.draw(faix, faiy);
    }
  
  void draw(float x,float y){
    if(muteki == 0){
      image(fai, x, y,sizex,sizey);
    }else{
      if(mswitch == 0 || mswitch == 1 || mswitch == 2){
        image(fai, x, y,sizex,sizey);
        if(mswitch == 0){
          muteki--;
          mswitch = 5;
        }else{
          mswitch--;
        }
      }else{
        mswitch--;
      }
    }
  }
  
  void standby(int level){
    t++;
    faix = 50;
    faiy = 530;
    blocky = 0;//前向き
    sizex = 50;
    sizey = 90;
    if(t == 10){//妖精に時間ごとに動きを入れる
      blockx = (blockx + 1) % 4;
      //println(blockx);//てすと
      t = 0;
    }
    fai = faipic.get(floor(blockx * blockvx), floor(blocky * blockvy),
    floor(blockvx), floor(blockvy));
    fairy.draw(faix, faiy + level * 70);
  }
  
  void fairygame(float x, float y){
    t++;
    faix = x;
    faiy = y;
    blocky = 3;//後ろ向き
    sizex = 50;
    sizey = 90;
    if(t == 10){//妖精に時間ごとに動きを入れる
      blockx = (blockx + 1) % 4;
      //println(blockx);//てすと
      t = 0;
    }
    fai = faipic.get(floor(blockx * blockvx), floor(blocky * blockvy),
    floor(blockvx), floor(blockvy));
    fairy.draw(faix, faiy);
//    ellipse(faix + sizex / 2,faiy + sizey / 2,10,10);
    noStroke();
    fill(127,255,255,255 );
    ellipse(faix + sizex / 2, faiy + sizey / 2 - 5, 17, 17);
    /*
    for(float i = 10; i > 0; i--){
      if(i > 5.5){
        fill(127,255,255,255 );
        ellipse(faix + sizex / 2, faiy + sizey / 2 - 5, 16, 16);
      }else{
        fill(170 - (43 / 10) * i,255,255,70 );
        ellipse(faix + sizex / 2, faiy + sizey / 2 - 5, i * 2, i * 2);
      }
    }
    */
 //   for(float i = 10; i > 0; i--){
 //     fill(170 - (43 / 7) * i,255,255,75 );
 //     ellipse(faix + sizex / 2, faiy + sizey / 2 - 5, i * 2, i * 2);
 //   }
    /*
    for (int i = 0; i < H_POINT; i++) {
      fill(170,255,255,70 );
      float kaku = i * TWO_PI / H_POINT;   // t の範囲 0〜TWO_PI
      kakux = 8 * cos(kaku);
      kakuy = 8 * sin(kaku);
      ellipse(kakux + faix + sizex / 2,kakuy + faiy + sizey / 2 - 5,1,1);
    }
    */
  }
  boolean atari(){
    for (int i = 0; i < H_POINT; i++) { // 繰り返し回数 H_POINT
      float kaku = i * TWO_PI / H_POINT;   // t の範囲 0〜TWO_PI
      kakux = 7 * cos(kaku);
      kakuy = 7 * sin(kaku);
      //line(int((faiy + sizey / 2 - 5) + kakuy + 30, int((faix + sizex / 2) + kakux) + 30 ,int((faiy + sizey / 2 - 5) + kakuy) + 30, int((faix + sizex / 2) + kakux) + 30 );
      H_COLOR = get( int(kakux + faix + sizex / 2), int(kakuy + faiy + sizey / 2 - 5) );
      noStroke();
      stroke(0,255,255);
     // strokeWeight(1);
      fill(0,255,255);
   //   ellipse(int((faix + sizex / 2) + kakux), int((faiy + sizey / 2 -5)) , 1, 1);
  //    ellipse(int(kakux + faix + sizex / 2),int(kakuy + faiy + sizey / 2 - 5),1,1);
    //  ellipse(kakux,kakuy,1,1);
      if(H_COLOR != -16711685 && H_COLOR != -16711684 ){
    //    println(H_COLOR);
        muteki = 10;
        return true;
      }
      
 //     loadPixels();
 //     H_COLOR = pixels[ int( ( (faiy + sizey / 2 - 5) + kakuy ) * width + (faix + sizex / 2) + kakux )];
 //     if(fill(H_COLOR) != fill(127,255,255,70 )){
 //       return false;
 //     }
    }
  return false;
  }
  
  boolean nomuteki(){
    if(muteki != 0){
      return false;
    }
    return true;
  }
  
  void bomemuteki(int i){
    muteki = i;
  }
  
}
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
class Manu{
  
  int x;
  int y;
  
  Manu(){
    
  }
  
  void starttext(){
    x = 100;
    y = 580;
    fill(#F78819);
    textSize(40);
    text("easy",x,y);
    text("normal",x,y+70);
    text("hard",x,y+140);
    
  }
  
}

