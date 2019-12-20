void planet() {
  pushMatrix();
  fill(#29DDFF);
  pointLight(200, 200, 200, 2000, 0, 0);
  ambientLight(70, 70, 70);
  specular(160, 180, 220);
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
  ellipse(0, 0, 400, 400);
  rotx = rotx + .01;
  roty = roty + .01;
  popMatrix();  
}
