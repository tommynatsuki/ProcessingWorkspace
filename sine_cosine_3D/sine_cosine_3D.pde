void setup(){
  size(800, 600, P3D);
  frameRate(60);
  background(0);
  noLoop();
}

void draw(){
  translate(width/2,height/2,-100);
  rotateY(frameCount * 0.1);
  stroke(255);
  noFill();
  blendMode(SCREEN);
  for (int i = 0; i < 360; i += 5){
  //  float sphereX = 200 * cos(radians(i));
  //  float sphereY = 200 * sin(radians(i));
    
  //  point(sphereX, sphereY);
    for (int j = 0; j < 360; j += 5){
      float sphereX = -200 * cos(radians(i)) * cos(radians(j));
      float sphereY = 200 * sin(radians(i));
      float sphereZ = 200 * cos(radians(i)) * sin(radians(j));
      
      point(sphereX, sphereY, sphereZ);
    }
  }
  blendMode(BLEND);
  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);  
}
