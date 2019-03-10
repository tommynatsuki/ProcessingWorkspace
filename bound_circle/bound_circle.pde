int locationX;
int locationY;
int directionX;
int directionY;

void setup(){
  size(800, 600);
  frameRate(60);
  fill(0, 127, 255);
  noStroke();
  
  locationX = 0;
  locationY = 0;
  directionX = -1;
  directionY = -1;
}

void draw(){
  background(0);
  ellipse(locationX, locationY, 20, 20);
  
  locationX = locationX + 10 * directionX;
  locationY = locationY + 10 * directionY;
  
  if (locationX < 0 || locationX > width){
    directionX = directionX * -1;
  }
  if (locationY < 0 || locationY > height){
    directionY = directionY * -1;
  }
}
