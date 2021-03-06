class Uzi extends BaseUziWithVector {
  float angle;
  
  Uzi() {
    angle = 0;
    r = 2;
    location = new PVector(width / 2,height / 2);
  }

  void render() {
    fill(210,252,254,255);
    noStroke();

    ellipse(location.x,location.y,r,r);
  }

  void walk() {

    scalarVelocity = 1;

    angleVelocity += random(-PI / 6, PI / 6);

    angle += angleVelocity;
    angle *= 0.7;

    velocity.x = (float)Math.cos(angle) * scalarVelocity;
    velocity.y = (float)Math.sin(angle) * scalarVelocity;

    location.x += velocity.x;
    location.y += velocity.y;
    
    location.x = constrain(location.x, 0, width - 1);
    location.y = constrain(location.y, 0, height - 1);
  }
}