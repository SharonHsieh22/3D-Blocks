class Dust extends Weather {
  
float alpha;


  Dust(float x, float y, float z) {
    location = new PVector(x, y, z);
    velocity = new PVector(1, 0, 1);
    acceleration = new PVector(-1, 1);
    velocity.setMag(8);
    acceleration.setMag(.01);
    size = random(.5, 1.5);
    timer = 0;
    alpha = 255;
  }

  void show() {
    pushMatrix();
    translate(location.x, location.y, location.z);
    fill(#FFCC0F);
    noStroke();
    sphere(size);
    popMatrix();
  }

  void act() {
    location.add(velocity);
    velocity.add(acceleration);
    timer++;
    alpha = alpha  - 3;
    if(timer > 50 || alpha == 0) {
      lives = 0;
    }
   
    if(location.x > 3500 || location.z > 3500 || location.y > ground) {
      lives = 0; 
    }    

  }
}
