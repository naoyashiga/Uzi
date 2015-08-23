class Uzi extends BaseUziWithVector {
  float angle;
  
  Uzi() {
    angle = 0;
    r = 10;
    // location = new PVector(width / 2,height / 2);
    location = new PVector(random(width),random(height));


    scalarVelocity = 1;
    velocity.x = random(-scalarVelocity, scalarVelocity);
    velocity.y = random(-scalarVelocity, scalarVelocity);
  }

  void render() {
    fill(210,252,254,255);
    noStroke();

    ellipse(location.x,location.y,r,r);
  }

  void walk() {

    // scalarVelocity = 3;

    // angleVelocity += random(-PI / 6, PI / 6);

    // angle += angleVelocity;
    // angle *= 0.7;

    // velocity.x = (float)Math.cos(angle) * scalarVelocity;
    // velocity.y = (float)Math.sin(angle) * scalarVelocity;

    

    // velocity.x *= 0.9;
    // velocity.y *= 0.9;

    // velocity.mult(align(this));

    velocity.add(align(this));

    velocity.limit(1);

    location.x += velocity.x;
    location.y += velocity.y;
    
    location.x = constrain(location.x, 0, width - 1);
    location.y = constrain(location.y, 0, height - 1);

  }

  PVector align(Uzi currentUzi) {
    Float neighborDist = 5.0;
    PVector sum = new PVector(0, 0);

    for (int i = 0; i < uzies.size(); i++) {
        Uzi otherUzi = uzies.get(i);

        if(otherUzi != this) {
            float distance = dist(currentUzi.location.x, currentUzi.location.y, otherUzi.location.x, otherUzi.location.y);

            if(distance - currentUzi.r - otherUzi.r < neighborDist) {
                sum.add(otherUzi.velocity);
                break;
            }
        }
    }

    sum.normalize();
    return sum;
  }
}