void setup(){
  size(800,800,P3D);
}

float v1 = 0 ;
float v2 = 0 ;
float v3 = 0 ;
float v4 = 0 ;
float v5 = 0 ;
float v6 = 0 ;
float v7 = 0 ;
float v8 = 0 ;

void draw(){
  background(0);
  
  translate(width/2,height/2);
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));
  stroke(255);
  noFill();
  for(int r = 0; r <= 8; r++){
  ellipse(0,0,80*r,80*r);
  }
  
  sphere(20);
  noStroke(); //太陽
  
  pushMatrix();
  float u1 = PI/88 ;
  v1 += u1 ;
  float x1 = 80*cos(v1)/2 ;
  float y1 = 80*sin(v1)/2 ;
  translate(x1,y1);
  fill(24,235,249);
  sphere(3);
  noStroke();
  popMatrix(); //水星
  
  pushMatrix();
  float u2 = PI/225 ;
  v2 += u2 ;
  float x2 = 160*cos(v2)/2 ;
  float y2 = 160*sin(v2)/2 ;
  translate(x2,y2);
  fill(205,161,111);
  sphere(7);
  noStroke();
  popMatrix(); //金星
  
  pushMatrix();
  float u3 = PI/365 ;
  v3 += u3 ;
  float x3 = 240*cos(v3)/2 ;
  float y3 = 240*sin(v3)/2 ;
  translate(x3,y3);
  fill(30,54,199);
  sphere(7);
  noStroke();
  popMatrix(); //我らが地球
  
  pushMatrix();
  float u4 = PI/687 ;
  v4 += u4 ;
  float x4 = 320*cos(v4)/2 ;
  float y4 = 320*sin(v4)/2 ;
  translate(x4,y4);
  fill(255,0,0);
  sphere(4);
  noStroke();
  popMatrix(); //火星
  
  pushMatrix();
  float u5 = PI/4330 ;
  v5 += u5 ;
  float x5 = 400*cos(v5)/2 ;
  float y5 = 400*sin(v5)/2 ;
  translate(x5,y5);
  fill(254,220,189);
  sphere(18);
  noStroke();
  popMatrix(); //木星
  
  pushMatrix();
  float u6 = PI/10752 ;
  v6 += u6 ;
  float x6 = 480*cos(v6)/2 ;
  float y6 = 480*sin(v6)/2 ;
  translate(x6,y6);
  fill(255,190,87);
  sphere(14);
  noStroke();
  popMatrix(); //土星
  
  pushMatrix();
  float u7 = PI/30667 ;
  v7 += u7 ;
  float x7 = 560*cos(v7)/2 ;
  float y7 = 560*sin(v7)/2 ;
  translate(x7,y7);
  fill(222,252,254);
  sphere(10);
  noStroke();
  popMatrix(); //天王星
  
  pushMatrix();
  float u8 = PI/60141 ;
  v8 += u8 ;
  float x8 = 640*cos(v8)/2 ;
  float y8 = 640*sin(v8)/2 ;
  translate(x8,y8);
  fill(0,17,30);
  sphere(9);
  noStroke();
  popMatrix(); //海王星
  }
