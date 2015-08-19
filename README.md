# Uzi
![](https://raw.githubusercontent.com/naoyashiga/Uzi/master/capture.png)
I created this at Interactive Coding Workshop in Tokyo.  

# How to move  
```processing
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
```
