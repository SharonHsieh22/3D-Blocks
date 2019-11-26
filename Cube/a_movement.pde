void move() {
  directionX.rotate(angleX);
  angleX = (pmouseX - mouseX)*-.004;

  directionY.rotate(angleY);
  angleY = (pmouseY - mouseY)*.005;

  strafeDir = directionX.copy();
  strafeDir.rotate(PI/2);
  if (up) {
    lz = lz + directionX.y;
    lx = lx + directionX.x;
  }
  if (down) {
    lz = lz - directionX.y;
    lx = lx - directionX.x;
  }
  if (left) {
    lx = lx - strafeDir.x;
    lz = lz - strafeDir.y;
  }
  if (right) {
    lx = lx + strafeDir.x;
    lz = lz + strafeDir.y;
  }
  if (jump) {
    ly = ly + velocity.y;
    velocity.y = velocity.y + acceleration.y;
  } 
  if (velocity.y > 29) {
    ly = elevation;
    jump = false;
    velocity.y = -30;
  }
  if (ly >= elevation) {
    ly = elevation;
  }

  directionX.setMag(10);
  directionY.setMag(6);
}
