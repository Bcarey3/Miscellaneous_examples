//declare an array
Particle[] p = new Particle[500];

void setup() {
  colorMode(HSB, 360, 100, 100, 100);
  size(400, 600);
  //go through the array and create a new Particle for each spot in the array
  for (int i = 0; i < p.length; i++) {
    p[i] = new Particle(width/2, 120);
  }
}

void draw() {
  background(0);
  //go through the array, and use the display and update methods on each Particle in the array
  for (int i = 0; i < p.length; i++) {
    p[i].display();
    p[i].update();
  }
}

class Particle {
  PVector loc, vel, acc;
  int size;
  float hue;

  Particle(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(random(-1, 1), random(-2, 0));
    acc = new PVector(0, .01);
    size = 20;
    hue = random(360);
  }

  void display() {
    fill(hue, 100, 100);
    stroke(hue, 100, 50);
    strokeWeight(2);
    ellipse(loc.x, loc.y, size, size);
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
  }
}

