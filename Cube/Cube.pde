PImage tblock;
PImage map;
float rotx, roty;
int blockSize = 20;
float lx = 0, ly = -10, lz = 1000;
color black = #000000;
color white = #FFFFFF;
boolean up, down, left, right;


void setup() {
  size(800, 600, P3D);
  tblock = loadImage("Todoroki.jpg");
  map = loadImage("map.png");
  textureMode(NORMAL);
}

void draw() {
  background(255);
  pushMatrix();
  //rotateX(rotx);
  //rotateY(roty);
  drawMap();
  drawGround();
  popMatrix();
  camera(lx, ly, lz, lx, ly, lz-1, 0, 1, 0);
  if (up) lz = lz - 10;
  if (down) lz = lz + 10;
  if (left) lx = lx - 10;
  if (right) lx = lx + 10;
}

void drawGround() {
  //pushMatrix();
  //rotateX(rotx);
  //rotateY(roty);
  stroke(0);
  strokeWeight(1);
  int x = -1000 + blockSize;
  while (x < 2000) {
    x = x + blockSize*2; 
    line(x, height/2 + blockSize, -1000, x, height/2 + blockSize, 2000);
  }
  int z = -1000 + blockSize;
  while (z < 2000) {
    z = z + blockSize*2; 
    line(-1000, height/2 + blockSize, z, 2000, height/2 + blockSize, z);
  }
  //popMatrix();
}

void drawMap() {
  //pushMatrix();
  //rotateX(rotx);
  //rotateY(roty);

  int mapX = 0, mapY = 0;
  int worldX = 0, worldY = height/2, worldZ = 0;
  while (mapY < map.height) {
    color pixel = map.get(mapX, mapY);
    if (pixel == black) {
      worldX = mapX*blockSize*2;
      worldZ = mapY*blockSize*2;
      texturedBox(tblock, tblock, tblock, worldX, worldY, worldZ, blockSize);
    }
    mapX++;
    if (mapX > map.width) {
      mapX = 0;
      mapY++;
    }
  }
  //popMatrix();
}

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

void keyPressed() {
  if (keyCode == UP) up = true;
  if (keyCode == DOWN) down = true;
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true;
}

void keyReleased() {
  if (keyCode == UP) up = false;
  if (keyCode == DOWN) down = false;
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*.01;
  roty = roty - (pmouseX - mouseX)*.01;
}
