PImage tblock;
float rotx, roty;

void setup() {
  size(800, 600, P3D);
  tblock = loadImage("Todoroki.jpg");
  textureMode(NORMAL);
}

void draw() {
  background(255);
  for(int x = -1000; x < 2000; x+= 200) {
    for(int z = -1000; z < 0; z+= 200) {
  texturedBox(tblock, tblock, tblock, x, height/2+200, z, 100);
    }
  }
}

void texturedBox(PImage top, PImage side, PImage bottom, float x, float y, float z, float size) {
  pushMatrix();
  translate(x, y, z);
  rotateX(rotx);
  rotateY(roty);
  scale(size);
  noStroke(); 
  
  //front face
  beginShape(QUADS);
  texture(side); 
  vertex(-1, -1, 1, 0, 0);
  vertex( 1, -1, 1, 1, 0);
  vertex( 1,  1, 1, 1, 1);
  vertex(-1,  1, 1, 0, 1);
  //back face
  vertex(-1, -1, -1, 1, 0);
  vertex( 1, -1, -1, 0, 0);
  vertex( 1,  1, -1, 0, 1);
  vertex(-1,  1, -1, 1, 1);
  //right face
  vertex(1, -1,  1, 0, 0);
  vertex(1, -1, -1, 1, 0);
  vertex(1,  1, -1, 1, 1);
  vertex(1,  1,  1, 0, 1);
  //left face
  vertex(-1, -1,  1, 1, 0);
  vertex(-1, -1, -1, 0, 0);
  vertex(-1,  1, -1, 0, 1);
  vertex(-1,  1,  1, 1, 1);
  endShape();
  
  //top face 
  beginShape(QUADS);
  texture(top);
  vertex(-1, -1,  1, 0, 1);
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1,  1, 1, 1);
  endShape();
  
  //bottom face
  beginShape(QUADS);
  texture(bottom);
  vertex(-1, 1,  1, 0, 0);
  vertex( 1, 1,  1, 1, 0);
  vertex( 1, 1, -1, 1, 1);
  vertex(-1, 1, -1, 0, 1);
  endShape();
  popMatrix();  
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*.01;
  roty = roty + (pmouseX - mouseX)*.01;
}
