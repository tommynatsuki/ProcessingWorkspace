void setup(){
  size(800, 600);
  frameRate(60);
  background(0);
  noStroke(); //線なし
}

void draw(){
  float x = random(0, width);
  float y = random(0, height);
  float dist = dist(x, y , width/2, height/2); //2点間の距離を求める（中心とランダムな点の2点間）
  
  if ( dist < height/2 ){
    noStroke();
    fill(63, 127,255);
  }
  else {
    noFill(); //塗りつぶさない
    stroke(31, 127, 255);
  }
  ellipse(x, y, 10 ,10);
}
