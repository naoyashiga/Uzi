Uzi[] uzies;

int uziesSize = 1000;

void setup() {
  size(displayWidth, displayHeight);

  uzies = new Uzi[uziesSize];

  for (int i = 0; i < uziesSize; i++) {
    Uzi p = new Uzi();
    uzies[i] = p;
  }

  background(199,22,111);
}

void draw() {
  fill(199,22,111, 10);
  rect(0, 0, width, height);

  for (int i = 0; i < uziesSize; i++) {
    Uzi p = uzies[i];

    p.walk();
    p.render();

  }
  
  // saveFrame("frames/######.tif");
}