void texturedBox(color pixel, float x, float y, float z, float size) {
  if (dist(lx, lz, x, z) <= blockSize*5 && velocity.y > 27) {
    ly = y - blockSize*8;
    velocity.y = -30;
    jump = false;
  } else if (ly > elevation - blockSize*3 && dist(lx, lz, x, z) <= blockSize*5) {     
    lx = lx + directionX.x*blockSize*-.4;
    lz = lz + directionX.y*blockSize*-.4;  
  }
    
  pushMatrix();
  translate(x, y, z);
  scale(size);
  noStroke(); 

  //front face
  beginShape(QUADS);
  fill(0); 
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
  fill(pixel);
  vertex(-1, -1, 1, 0, 1);
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1, 1, 1, 1);
  endShape();

  //bottom face
  beginShape(QUADS);
  fill(pixel);
  vertex(-1, 1, 1, 0, 0);
  vertex( 1, 1, 1, 1, 0);
  vertex( 1, 1, -1, 1, 1);
  vertex(-1, 1, -1, 0, 1);
  endShape();
  popMatrix();
}
