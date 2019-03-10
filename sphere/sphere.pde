int sphereNum = 1;

void setup(){
  size(1000, 800, P3D);
  blendMode(ADD);
  frameRate(60);
  }

void draw(){
  translate(width/2,height/2,-100);

  background(0);
  rotateY(frameCount * 0.05);
 stroke(255, 255, 255, 130);
  noFill();
  sphereDetail(3,5);
  sphere(200);
}
