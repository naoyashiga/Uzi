class Uzi extends BaseUziWithVector {
  float angle;
  float maxspeed;
  float maxforce;
  
  Uzi() {
    angle = 0;
    r = 10;
    // location = new PVector(width / 2,height / 2);
    location = new PVector(random(width),random(height));


    scalarVelocity = 3;
    velocity.x = random(-scalarVelocity, scalarVelocity);
    velocity.y = random(-scalarVelocity, scalarVelocity);

    maxspeed = 2;
    maxforce = 0.03;
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

    velocity.add(align());
    velocity.add(cohesion());
    velocity.add(separate());

    velocity.limit(1);

    location.x += velocity.x;
    location.y += velocity.y;
    
    location.x = constrain(location.x, 0, width - 1);
    location.y = constrain(location.y, 0, height - 1);

  }

  PVector separate() {
    Float neighborDist = 10.0;
    PVector steer = new PVector(0, 0);
    int count = 0;

    for (int i = 0; i < uzies.size(); i++) {
        Uzi otherUzi = uzies.get(i);

        if(otherUzi != this) {
            float distance = PVector.dist(location, otherUzi.location);

            if(distance - r - otherUzi.r < neighborDist) {
                PVector diff = PVector.sub(location, otherUzi.location);
                diff.normalize();
                diff.div(distance);
                steer.add(diff);
                count++;
            }
        }
    }


    if(count > 0) {
        steer.div((float)count);
    }

    if(steer.mag() > 0) {
        steer.normalize();
        steer.mult(maxspeed);
        steer.sub(velocity);
        steer.limit(maxforce);
    }


    return steer;

  }

  PVector align() {
    Float neighborDist = 50.0;
    PVector sum = new PVector(0, 0);
    int count = 0;

    for (int i = 0; i < uzies.size(); i++) {
        Uzi otherUzi = uzies.get(i);

        if(otherUzi != this) {
            float distance = PVector.dist(location, otherUzi.location);

            if(distance - r - otherUzi.r < neighborDist) {
                sum.add(otherUzi.velocity);
                count++;
            }
        }
    }

    if (count > 0) {
        sum.div((float)count);
        sum.normalize();
        sum.mult(maxspeed);

        PVector steer = PVector.sub(sum, velocity);
        steer.limit(maxforce);

        return steer;
    } else {
        return new PVector(0, 0);
    }
  }

  PVector cohesion() {
    Float neighborDist = 200.0;
    PVector sum = new PVector(0, 0);
    int count = 0;

    for (int i = 0; i < uzies.size(); i++) {
        Uzi otherUzi = uzies.get(i);

        if(otherUzi != this) {
            float distance = PVector.dist(location, otherUzi.location);

            if(distance - r - otherUzi.r < neighborDist) {
                sum.add(otherUzi.velocity);
                count++;
            }
        }
    }

    if (count > 0) {
        sum.div((float)count);
        sum.normalize();
        sum.mult(maxspeed);

        PVector steer = PVector.sub(sum, velocity);
        steer.limit(maxforce);

        return steer;
    } else {
        return new PVector(0, 0);
    }

  }
}