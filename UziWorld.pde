ArrayList<Uzi> uzies;


void setup() {
  size(displayWidth, displayHeight);
  int uziesSize = 100;

  uzies = new ArrayList<Uzi>();

  for (int i = 0; i < uziesSize; i++) {
    Uzi u = new Uzi();
    uzies.add(u);
  }

  background(199,22,111);
}

void draw() {
  fill(199,22,111, 10);
  rect(0, 0, width, height);

  for (Uzi u : uzies) {
    u.walk();
    u.render();
  }
  
  // saveFrame("frames/######.tif");
}