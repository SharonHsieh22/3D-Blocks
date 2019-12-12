void planet() {
  pushMatrix();
  fill(#29DDFF);
  lightSpecular(255, 255, 255);
  pointLight(200, 200, 200, 2000, 0, 200);
  spotLight(51, 102, 126, 80, 20, 40, 0, 0, -1, PI/2, 2);
  specular(230, 180, 120);
  translate(2000, 500, 2100);
  
  noStroke();
  sphere(100);
  noFill();
  stroke(#F5CC28);
  strokeWeight(2);
  rotateX(rotx);
  rotateY(roty);
  ellipse(0, 0, 300, 300);
  strokeWeight(4);
  rotateX(rotx - PI*.2);
  rotateY(roty - PI);
  ellipse(0, 0, 500, 500);
  rotx = rotx + .01;
  roty = roty + .01;
  popMatrix();  
}
