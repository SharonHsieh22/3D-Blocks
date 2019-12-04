class Bullet {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float size;
  int timer;
  int lives = 1;
  
  Bullet(float _x, float _y, float _z, float _vx, float _vz) {
  location = new PVector(_x, _y, _z);
  velocity = new PVector(_vx, 0, _vz);
  
  }
  
  void show() {
    pushMatrix();
    translate(location.x, location.y, location.z);
    fill(#1CDFFF);
    sphere(5);
    popMatrix();
  }
  
  void act() {
    location.add(velocity);
    velocity.setMag(20);
  }
  
}
