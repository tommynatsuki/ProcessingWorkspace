int num = 1000;
float[] x = new float[num];
float[] y = new float[num];

void setup() {
  size(800, 600, P2D);
  frameRate(60);
  background(0);
  
  for (int i = 0; i < num; i++){
    x[i] = width/2;
    y[i] = height/2;
  }  
}

void draw() {
  stroke(255);
  noFill();
  blendMode(ADD);
  
  for (int i = 0; i < num; i++){
    point(x[i], y[i]);
    x[i] = x[i] + random(-2.0, 2.0);
    y[i] = y[i] + random(-2.0, 2.0);
  }
  blendMode(BLEND);
  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);
}
