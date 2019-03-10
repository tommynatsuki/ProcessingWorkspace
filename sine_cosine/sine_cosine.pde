float circleX;
float circleY;
float waveX;
float waveY;

void setup() {
  size (800, 600, P3D);
  frameRate(60);
  noStroke();
  background(0);
}

void draw() {
  circleX = sin(frameCount * 0.1) * 200;
  circleY = cos(frameCount * 0.1) * 200;
  waveX = frameCount + 20;
  waveY = sin(frameCount * 0.1) * 200;
  
  stroke(255);
  noFill();
  blendMode(SCREEN);
  point(width/2 + circleX, height/2 + circleY);
  point(waveX, height/2 + waveY);
  
  if (waveX == width){
    frameCount = 0;
  }
  
  blendMode(BLEND);
  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);
}
