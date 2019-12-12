void drawGround() {
  stroke(#00BDEA);
  strokeWeight(1);
  int x = blockSize;
  while (x < 4000) {
    x = x + blockSize*2; 
    line(x, ground, 0, x, ground, 4000);
  }
  int z = 0 + blockSize;
  while (z < 4000) {
    z = z + blockSize*2; 
    line(0, ground, z, 4000, ground, z);
  }

  pushMatrix();
  noStroke();  
  beginShape(QUADS);
  texture(sky);
  scale(1000);
  vertex(0, 0, 2, 0, 1);
  vertex(0, 0, 0, 0, 0);
  vertex(2, 0, 0, 1, 0);
  vertex(2, 0, 2, 1, 1);

  vertex(4, 0, 2, 0, 1);
  vertex(4, 0, 0, 0, 0);
  vertex(2, 0, 0, 1, 0);
  vertex(2, 0, 2, 1, 1);

  vertex(0, 0, 2, 0, 1);
  vertex(0, 0, 4, 0, 0);
  vertex(2, 0, 4, 1, 0);
  vertex(2, 0, 2, 1, 1);

  vertex(4, 0, 2, 0, 1);
  vertex(4, 0, 4, 0, 0);
  vertex(2, 0, 4, 1, 0);
  vertex(2, 0, 2, 1, 1);
  // sides
  vertex(0, 0, 2, 0, 1); //front left
  vertex(0, 0, 0, 0, 0); //back left
  vertex(0, 1, 0, 1, 0); //back right
  vertex(0, 1, 2, 1, 1); //front right

  vertex(4, 0, 2, 0, 1);
  vertex(4, 0, 0, 0, 0);
  vertex(4, 1, 0, 1, 0);
  vertex(4, 1, 2, 1, 1);

  vertex(0, 0, 2, 0, 1);
  vertex(0, 0, 4, 0, 0);
  vertex(0, 1, 4, 1, 0);
  vertex(0, 1, 2, 1, 1);

  vertex(4, 0, 2, 0, 1);
  vertex(4, 0, 4, 0, 0);
  vertex(4, 1, 4, 1, 0);
  vertex(4, 1, 2, 1, 1);
  
  vertex(0, 1, 0, 0, 1); //front left
  vertex(0, 0, 0, 0, 0); //back left
  vertex(2, 0, 0, 1, 0); //back right
  vertex(2, 1, 0, 1, 1); //front right

  vertex(4, 1, 0, 0, 1);
  vertex(4, 0, 0, 0, 0);
  vertex(2, 0, 0, 1, 0);
  vertex(2, 1, 0, 1, 1);

  vertex(0, 1, 4, 0, 1);
  vertex(0, 0, 4, 0, 0);
  vertex(2, 0, 4, 1, 0);
  vertex(2, 1, 4, 1, 1);

  vertex(4, 1, 4, 0, 1);
  vertex(4, 0, 4, 0, 0);
  vertex(2, 0, 4, 1, 0);
  vertex(2, 1, 4, 1, 1);
  endShape();
  popMatrix();
}
