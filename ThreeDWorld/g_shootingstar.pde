class Star extends Weather {
  Star(float x, float z) {
    location = new PVector(x, 300, z);
    velocity = new PVector(1, 0, 1);
    acceleration = new PVector(-1, 1);
    velocity.setMag(10);
    acceleration.setMag(.01);
    y = 300;
    lives = 1;
  }
  
  void show() {
    pushMatrix();
    translate(location.x, location.y, location.z);
    fill(#FF1803);
    noStroke();
    sphere(30);
    popMatrix();
  }
  
  void act() {
    location.add(velocity);
    velocity.add(acceleration);
  }
}
