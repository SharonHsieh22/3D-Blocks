void drawGround() {
  stroke(0);
  strokeWeight(1);
  int x = -1000 + blockSize;
  while (x < 1600) {
    x = x + blockSize*2; 
    line(x, ground, -1000, x, ground, 1650);
  }
  int z = -1000 + blockSize;
  while (z < 1600) {
    z = z + blockSize*2; 
    line(-1000, ground, z, 1650, ground, z);
  }
  
  //pushMatrix();
  //noStroke();  
  //beginShape(QUADS);
  //texture(sky);
  //scale(1000);
  //vertex(0, 0, 2, 0, 1);
  //vertex(0, 0, 0, 0, 0);
  //vertex(2, 0, 0, 1, 0);
  //vertex(2, 0, 2, 1, 1);
  //endShape();
  //popMatrix();
}
