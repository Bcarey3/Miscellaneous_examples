//declare an ArrayList
ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  colorMode(HSB, 360, 100, 100, 100);
  size(400, 600);
  //add one new particle to the particles ArrayList
  particles.add(new Particle(width/2, 120));
}

void draw() {
  println(particles.size());
  //  if (mousePressed) {
  particles.add(new Particle(mouseX, mouseY));
  //  }
  background(0);
  //Go through the ArrayList backwards to prevent flickering
  for (int i = particles.size()-1; i >=0; i--) {
  //Declare a new Particle called p and assign it the current object in the ArrayList
    Particle p = particles.get(i);
    p.display();
    p.update();
    //if the particle's life is less than or equal to 0, remove the particle
    if (p.life <= 0) {
      particles.remove(i);
    }
  }
}

class Particle {
  PVector loc, vel, acc;
  int size;
  float hue;
  int life;

  Particle(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(random(-1, 1), random(-2, 0));
    acc = new PVector(0, .01);
    size = 20;
    hue = random(360);
    life = 100;
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
    life--;
  }
}

