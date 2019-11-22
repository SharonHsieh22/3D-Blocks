PImage tblock;
PImage map;
PImage sky;
float rotx, roty;
int blockSize = 20;
int ground = 800;
float lx = 1000, ly = ground - 60, lz = 1000;
float angleX = 0;
float angleY = 0;
float vy;
PVector directionX = new PVector(-1, 0);
PVector directionY = new PVector(0, -1);
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
  sky = loadImage("sky.jpg");
}

void draw() {
  background(255);
  pushMatrix();
  drawMap();
  drawGround();
  popMatrix();
  
  camera(lx, directionY.x + ly, lz, directionX.x + lx, directionY.y + ly, directionX.y + lz, 0, 1, 0);
  
  move(); 
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
  //if (key == ' ') jump = false;
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*.01;
 
}
