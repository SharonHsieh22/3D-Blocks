class Star extends Weather {
  int dustTimer;
  int alpha = 255;
  
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
    fill(#FF531A, alpha);
    noStroke();
    sphere(20);
    popMatrix();
  }

  void act() {
    location.add(velocity);
    velocity.add(acceleration);
    
    dustTimer++;
    if (dustTimer >= 10) {
      for (int j = 0; j < 10; j++) {
        weather.add(new Dust(location.x + random(-20, 20), location.y + random(-20, 20), location.z + random(-20, 20)));
      }
      dustTimer = 0;
    }
    
    if(location.x > 3500 || location.z > 3500 || location.y > ground) {
     alpha = alpha - 8;
     if(alpha == 0) {
      lives = 0; 
     }
    }
    
  }
}
