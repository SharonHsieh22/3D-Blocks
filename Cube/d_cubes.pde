void texturedBox(PImage top, PImage side, PImage bottom, float x, float y, float z, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  noStroke(); 

  //front face
  beginShape(QUADS);
  texture(side); 
  vertex(-1, -1, 1, 0, 0);
  vertex( 1, -1, 1, 1, 0);
  vertex( 1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);
  //back face
  vertex(-1, -1, -1, 1, 0);
  vertex( 1, -1, -1, 0, 0);
  vertex( 1, 1, -1, 0, 1);
  vertex(-1, 1, -1, 1, 1);
  //right face
  vertex(1, -1, 1, 0, 0);
  vertex(1, -1, -1, 1, 0);
  vertex(1, 1, -1, 1, 1);
  vertex(1, 1, 1, 0, 1);
  //left face
  vertex(-1, -1, 1, 1, 0);
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, 1, -1, 0, 1);
  vertex(-1, 1, 1, 1, 1);
  endShape();

  //top face 
  beginShape(QUADS);
  texture(top);
  vertex(-1, -1, 1, 0, 1);
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1, 1, 1, 1);
  endShape();

  //bottom face
  beginShape(QUADS);
  texture(bottom);
  vertex(-1, 1, 1, 0, 0);
  vertex( 1, 1, 1, 1, 0);
  vertex( 1, 1, -1, 1, 1);
  vertex(-1, 1, -1, 0, 1);
  endShape();
  popMatrix();
}
