PImage tblock;
PImage map;
float rotx, roty;
int blockSize = 20;
int ground = 800;
float lx = 1000, ly = ground - 60, lz = 1000;
float angle = 0;
PVector direction = new PVector(0, -1);
PVector strafeDir = new PVector(0, 0);
PVector velocity = new PVector(0, -1);
PVector acceleration = new PVector(0, 1);
color black = #000000;
color white = #FFFFFF;
boolean up, down, left, right, jump;


void setup() {
  size(800, 600, P3D);
  tblock = loadImage("Todoroki.jpg");
  map = loadImage("map.png");
  textureMode(NORMAL);
  velocity.setMag(30);
  
}

void draw() {
  background(255);
  pushMatrix();
  drawMap();
  drawGround();
  popMatrix();
  camera(lx, ly, lz, direction.x + lx, ly, direction.y + lz, 0, 1, 0);
  direction.rotate(angle);
  angle = (pmouseX - mouseX)*.005;
  strafeDir = direction.copy();
  strafeDir.rotate(PI/2);
  if (up) {
    lz = lz + direction.y;
    lx = lx + direction.x;
  }
  if (down) {
    lz = lz - direction.y;
    lx = lx - direction.x;
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
                        
  if (ly >= ground - 60) {
   ly = ground - 60; 
  }
  
  println(velocity.y);
  direction.setMag(10);
  
}

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
}

void drawMap() {
  //pushMatrix();
  //rotateX(rotx);
  //rotateY(roty);

  int mapX = 0, mapY = 0;
  int worldX = 0, worldY = ground - blockSize, worldZ = 0;
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
  if (keyCode == UP || key == 'w') up = true;
  if (keyCode == DOWN || key == 's') down = true;
  if (keyCode == LEFT || key == 'a') left = true;
  if (keyCode == RIGHT || key == 'd') right = true;
  if (key == ' ') jump = true;
}

void keyReleased() {
  if (keyCode == UP || key == 'w') up = false;
  if (keyCode == DOWN || key == 's') down = false;
  if (keyCode == LEFT || key == 'a') left = false;
  if (keyCode == RIGHT || key == 'd') right = false;
  if (key == ' ') jump = false;
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*.01;
 
}
