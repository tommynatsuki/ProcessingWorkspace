import oscP5.*;
import netP5.*;

OscP5 osc;

//宣言
float gain;
float speed;
float strength = 0.0;
float noiseScale = 0.0;
int step = 20;

void setup(){
  size(800, 1000, P2D);
  frameRate(120);
  blendMode(BLEND); 
  osc = new OscP5(this, 7000);
}
void draw(){
  background(0);
  strength = 1500 * gain;
  noiseScale = 0.001 * speed;
  for(int j = - height; j < height * 2; j += step){
    beginShape();
    for(int i = -20; i < width * 1.5; i += step){
      float noise = noise(i * noiseScale, j * noiseScale) * strength;
      stroke(200);
      noFill();
      curveVertex(i, j + noise);
    }
    endShape();
  }
}

//電文受信イベント
void oscEvent(OscMessage m) {
  analyTidalMsg(m);
}

//電文を変数に設定してダンプを出力
void analyTidalMsg(OscMessage m) {
  //変数初期化
  gain = 0.5;
  speed = 3.0;

  for (int i = 0; i < m.typetag().length(); i++) {
    String type = m.typetag().substring(i, i+1);
    switch(type) {
      case "s":
        print(m.get(i).stringValue());
        String name = m.get(i).stringValue();
        switch(name){
          case "gain":
            gain = m.get(i+1).floatValue();
          case "speed":
            speed = m.get(i+1).floatValue();
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
