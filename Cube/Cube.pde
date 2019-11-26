import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;

PImage tblock;
PImage map;
PImage map1;
PImage map2;
PImage map3;
PImage sky;
float rotx, roty;
int blockSize = 20;
int ground = 1000;
int rainTimer;
float elevation = ground - blockSize*6;
float lx = 500, ly = elevation, lz = 500;
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
color red = #FF0000;
boolean up, down, left, right, jump;

ArrayList<Raindrops> raindrops;

void setup() {
  size(1500, 900, P3D);
  tblock = loadImage("Todoroki.jpg");
  map = loadImage("map.png");
  map1 = loadImage("map1.png");
  map2 = loadImage("map2.png");
  map3 = loadImage("jewel.png");
  textureMode(NORMAL);
  velocity.setMag(30);  
  sky = loadImage("sky.jpg");
  raindrops = new ArrayList<Raindrops>();
  minim = new Minim(this);

}

void draw() {
  background(0);
  pushMatrix();
  drawMap();
  drawGround();
  popMatrix();

  camera(lx, directionY.x + ly, lz, directionX.x + lx, directionY.y + ly, directionX.y + lz, 0, 1, 0);

  move(); 
  planet();
  println(velocity.y);

  int i = 0;
  while (i < raindrops.size()) {
    Raindrops drop = raindrops.get(i);
    drop.show();
    drop.act();
    if (drop.lives == 0) {
      raindrops.remove(i);
    } else {
      i++;
    }
  }

  rainTimer++;
  if (rainTimer >= 10) {
    raindrops.add(new Rain());
    raindrops.add(new Rain());
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain());
    raindrops.add(new Rain());
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain());
    raindrops.add(new Rain());
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain());
    raindrops.add(new Rain());
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    raindrops.add(new Rain()); 
    rainTimer = 0;
  }
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
