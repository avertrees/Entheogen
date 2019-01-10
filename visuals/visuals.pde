//import controlP5.*;
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

float x, y, x2, y2, rad, rad2, dist, dist2;
float x3, y3, x4, y4, rad3, rad4, dist3, dist4;
float x5, y5, rad5, dist5;
float deg, incr, yIn, rotateBy, ang;
float d1, d2, d3, d4, d5;

void setup() {
  initOsc();
  fullScreen(P3D);
  colorMode(HSB, 360, 100, 100);
  background(255, 0, 0);
  incr = 1; // numVerts = 360/incr
  
  rad = -20;
  rad2 = -20;
  rad3 = -20;
  rad4 = -20;
  rad5 = -20;
  
  dist = 300;
  dist2 = 350;
  dist3 = 400;
  dist4 = 450;
  dist5 = 500;
  
}

void initOsc()
{
  oscP5 = new OscP5(this,8080);
  
  myRemoteLocation = new NetAddress("0.0.0.0", 8080);

  oscP5.plug(this, "dist", "/dist1");
  oscP5.plug(this, "dist2", "/dist2");
  oscP5.plug(this, "dist3", "/dist3");
  oscP5.plug(this, "dist4", "/dist4");
  oscP5.plug(this, "dist5", "/dist5");
  
  oscP5.plug(this, "d1", "/dist1");
  oscP5.plug(this, "d2", "/dist2");
  oscP5.plug(this, "d3", "/dist3");
  oscP5.plug(this, "d4", "/dist4");
  oscP5.plug(this, "d5", "/dist5");
  
  oscP5.plug(this, "rad", "/rad1");
  oscP5.plug(this, "rad2", "/rad2");
  oscP5.plug(this, "rad3", "/rad3");
  oscP5.plug(this, "rad4", "/rad4");
  oscP5.plug(this, "rad5", "/rad5");
}

void draw() {
  noStroke();
  fill(#02021A, 10);
  rect(0, 0, width, height);
  rotateBy += .003;
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotateBy);
  deg = 0;
  while (deg <= 360) {
    
    deg += incr;
    ang = radians(deg);
    fill(280, 100, 100);
    x = cos(ang) * (rad + (dist * noise(y/d1, yIn)));
    y = sin(ang) * (rad + (dist * noise(x/d1, yIn)));
    ellipse(x, y, 1.5, 1.5);
    
    fill(220, 100, 100);
    x2 = cos(ang) * (rad2 + (dist2 * noise(y2/d2, yIn)));
    y2 = sin(ang) * (rad2 + (dist2 * noise(y2/d2, yIn)));
    ellipse(x2, y2, 1.5, 1.5);
    
    fill(160, 100, 100);
    x3 = cos(ang) * (rad3 + (dist3 * noise(y3/d3, yIn)));
    y3 = sin(ang) * (rad3 + (dist3 * noise(x3/d3, yIn)));
    ellipse(x3, y3, 1.5, 1.5);
    
    fill(80, 100, 100);
    x4 = cos(ang) * (rad4 + (dist4 * noise(y4/d4, yIn)));
    y4 = sin(ang) * (rad4 + (dist4 * noise(y4/d4, yIn)));
    ellipse(x4, y4, 1.5, 1.5);
    
    fill(10, 100, 100);
    x5 = cos(ang) * (rad5 + (dist5 * noise(y5/d5, yIn)));
    y5 = sin(ang) * (rad5 + (dist5 * noise(y5/d5, yIn)));
    ellipse(x5, y5, 1.5, 1.5);
  }
  yIn += .005;
  popMatrix();
}

void oscEvent(OscMessage msg) {
  /* print the address path and the type string of the received OscMessage */
  //if (debug) {
  println("---OSC Message Received---");
  println(msg);

 if (msg.checkAddrPattern("/dist1")==true) {   
   d1 = msg.get(0).floatValue();
      println("dist1 = ", d1);
 }
 if (msg.checkAddrPattern("/dist2")==true) {   
   d2 = msg.get(0).floatValue();
      println("dist2 = ", d2);
 }
 if (msg.checkAddrPattern("/dist3")==true) { 
   d3 = msg.get(0).floatValue();
      println("dist3 = ", d3);
 }
 if (msg.checkAddrPattern("/dist4")==true) { 
      d4 = msg.get(0).floatValue();
      println("dist4 = ", d4);
 }
 if (msg.checkAddrPattern("/dist5")==true) {  
      d5 = msg.get(0).floatValue();
      println("dist5 = ", d5);
 }
 
 if (msg.checkAddrPattern("/rad1")==true) {     
   rad = msg.get(0).floatValue();
      println("rad1 = ", rad);
 }
 if (msg.checkAddrPattern("/rad2")==true) {     
   rad2 = msg.get(0).floatValue();
      println("rad2 = ", rad2);
 }
 if (msg.checkAddrPattern("/rad3")==true) {    
     rad3 = msg.get(0).floatValue();
     println("rad3 = ", rad3);
 }
 if (msg.checkAddrPattern("/rad4")==true) {    
      rad4 = msg.get(0).floatValue();
      println("rad4 = ", rad4);
 }
 if (msg.checkAddrPattern("/rad5")==true) { 
      rad5 = msg.get(0).floatValue();
      println("rad5 = ", rad5);
 }

}
