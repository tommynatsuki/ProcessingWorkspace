import oscP5.*;
import netP5.*;

OscP5 osc;

//宣言
float gain;
float speed;
float room;
String soundtype;

void setup() {
size(1000, 1000, P3D);
blendMode(ADD);
frameRate(60);
osc = new OscP5(this, 7000);
}

void draw() {
  //サウンドがcpの場合、画面をピカピカさせる
  if ("cp".equals(soundtype)){
    background(40,40,40,3);
  }else{
  background(0);
  }

  pushMatrix();
  translate(width/2,height/2,-50);
  
  //チョンへインの声の場合、ハートを出力する
  if ("honey".equals(soundtype)){
    noStroke();
    fill(200,0,0,130);
    strokeJoin(ROUND);
    drawHeart(1);
  }
  
  /* 球体の描画 */
  noFill();
  rotateY(frameCount * 0.02);
  strokeWeight(2);

  //roomの値を色に設定
  stroke(60 * room, 150 + sin(radians(180 * room)) * 30, 255 * room, 130);

  //speedを球の画数に設定
  int shape = 2 * int(speed);
  int shape2 = 3 + int(speed); //<>//
  sphereDetail(shape,shape2);
  
  //音量を球の直径に設定
  float radius = map(gain, 0, 1, 0, width/2); 
  sphere(radius);
  
  /* 点々の描画 */
  if(radius < 300){
    //球体の半径が300未満の場合、輪っか
    for (int i = 0; i < 360; i += 3){
      float sphereX = 300 * cos(radians(i));
      float sphereY = 300 * sin(radians(i));
      strokeWeight(2);
      stroke(255);
      point(sphereX, sphereY);
    }
  }else{
    //球体の半径が300以上の場合、ランダムに点々する
    for (int i = 0; i < 360; i += 3){
      rotateY(frameCount);
      float sphereX = 300 * cos(radians(i));
      float sphereY = 300 * sin(radians(i));
      stroke(255);
      point(sphereX, sphereY);
    }

  }
  popMatrix();
  
}

/* ハートの描画 */
void drawHeart(int size) {
  beginShape();
  for (int theta = 0; theta < 360; theta++) {
    float x = size * (16 * sin(radians(theta)) * sin(radians(theta)) * sin(radians(theta)));
    float y = (-1) * size * (13 * cos(radians(theta)) - 5 * cos(radians(2 * theta)) - 2 * cos(radians(3 * theta)) - cos(radians(4 * theta)));
    vertex(x, y);
  }
  endShape(CLOSE);
}

//電文受信イベント
void oscEvent(OscMessage m) {
  analyTidalMsg(m); //<>//
}

//電文を変数に設定してダンプを出力
void analyTidalMsg(OscMessage m) {
  //変数初期化
  gain = 0.5;
  speed = 3.0;
  room = 0.5;
  soundtype = null;

  for (int i = 0; i < m.typetag().length(); i++) {
    String type = m.typetag().substring(i, i+1);
    switch(type) {
      case "s":
        print(m.get(i).stringValue()); //<>//
        if("honey".equals(m.get(i).stringValue())){
          soundtype = "honey";
        }
        if("cp".equals(m.get(i).stringValue())){
          soundtype = "cp";
        }

        String name = m.get(i).stringValue();
        switch(name){
          case "gain":
            gain = m.get(i+1).floatValue();
          case "speed":
            speed = m.get(i+1).floatValue();
          case "room":
            room = m.get(i+1).floatValue();
        }      
        break;
      case "f":
        print(m.get(i).floatValue());
        break;
      case "i":
        print(m.get(i).intValue());
        break;
    }
    print(" ");
  }
  println();
}
