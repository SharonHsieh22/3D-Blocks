class Rain extends Raindrops{

  Rain() {
    location = new PVector(random(0, 4000), random(0, 4000));
    velocity = new PVector(0, 1);
    acceleration = new PVector(0, 1);
    y = -10;
    velocity.setMag(30);
  }

  void show() {
    stroke(255);
    strokeWeight(1);
    if(location.x > 1100 && location.x < 2900 && location.y > 1100 && location.y < 2900) {
     location.x = random(0, 4000); 
     location.y = random(0, 4000); 
    }
    
    line(location.x, y, location.y, location.x, y - 50, location.y);
  }

  void act() {
    y = y + velocity.y;
    velocity.y = velocity.y + acceleration.y;
    if(y >= ground) {
      lives = 0;
      raindrops.add(new Ripple(location.x, location.y));
    }
  }
}
