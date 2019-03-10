class MovingPoint {
  PVector location;
  PVector velocity;

  void setup(){
    location = new PVector(random(-200,200),random(-200,200),random(-200, 200));
    velocity = new PVector(random(-10, 10),random(-10, 10),random(-10, 10));
  }
  
  void draw(){
    stroke(255);
    noFill();
    point(location.x, location.y, location.z);
     
    if(location.x < -200 || location.x > 200){
      velocity.x = velocity.x * -1;
    }
    if(location.y < -200 || location.y > 200){
      velocity.y = velocity.y * -1;
    }
    
    if(location.z < -200 || location.z > 200){
      velocity.z = velocity.z * -1;
    }

    location.add(velocity);
  }
}
