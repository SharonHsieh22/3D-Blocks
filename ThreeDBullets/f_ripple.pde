class Ripple extends Raindrops {
  
float alpha;

  Ripple(float x, float z) {
    location = new PVector(x, z);
    size = 10;
    timer = 0;
    alpha = 255;
  }

  void show() {
    pushMatrix();
    translate(location.x, ground, location.y);
    rotateX(PI/2);
    stroke(255, alpha);
    noFill();
    strokeWeight(2);
    ellipse(0, 0, size, size);
    popMatrix();
  }

  void act() {
    timer++;
    size = size + .5;
    alpha = alpha  - 2;
    if(timer > 100) {
      lives = 0;
    }
  }
}
