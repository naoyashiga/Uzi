class BaseUziWithVector implements BaseUziWithVectorInterface {
  PVector location;
  PVector velocity;

  PVector friction;
  PVector acceleration;

  float scalarAcceleration;
  float scalarVelocity;

  float angleAcceleration;
  float angleVelocity;

  float r;
  
  BaseUziWithVector() {
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    friction = new PVector(0.95, 0.95);
    
    scalarVelocity = 0;
    scalarAcceleration = 0;

    angleVelocity = 0;
    angleAcceleration = 0;

    r = 1;
  }

  void render() {
    fill(255);
    noStroke();
    
    ellipse(location.x,location.y,r,r);
  }

  void walk() {
    //override in subclass
  }
}

interface BaseUziWithVectorInterface {
  void walk();
}