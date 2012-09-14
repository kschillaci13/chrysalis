//pde translated from 'ghTest2.ghx' using Chrysalis
//licensed under Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.
//www.fabripod.com/chrysalis +++++++ www.creativecommons.org

//import libraries
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
import controlP5.*;
//import processing.opengl.*;

//initialize global variables
PeasyCam cam;
ControlP5 controlP5;
PMatrix3D currcamMatrix;
PGraphics3D g3;

//control variable: type "Number Slider" , Nick name Width;
float Vce99d837f9534d00bebddac0e5cf4165 = 57.0;

//control variable: type "Number Slider" , Nick name Height;
float V18ac801bf5a84bcb8a5c1424783466b2 = 31.44;

//control variable: type "Number Slider" , Nick name Length;
float Vd561ef7c572f4b3d97bd2641fdc52c75 = 81.0;

//Math Variable: type "Addition" , Nick name A+B;
float V32f660ee5fa44f07a431e4aaea6ed252;

//Math Variable: type "Subtraction" , Nick name A-B;
float V5271dd54202441918c04767018bf0777;

//Math Variable: type "Addition" , Nick name A+B;
float Vcd1abecdb0574a3bb7ed2509ae244760;

//Static Variable: type "Panel" , Nick name panel;
float Vefa65b1cc3ef4e7288d695873bb45a4b = ( 30);

//global variables
float gridSize;
float gridDiv;

void setup(){
size(600, 600, P3D);
g3 = (PGraphics3D)g;
cam = new PeasyCam(this,width);
controlP5 = new ControlP5(this);

//control object: type="Number Slider". name="Width"
controlP5.addSlider("Vce99d837f9534d00bebddac0e5cf4165", 0 , 120, Vce99d837f9534d00bebddac0e5cf4165, 0, int(height-20.0), int(width-75), int(10.0));
Slider s0 = (Slider)controlP5.controller("Vce99d837f9534d00bebddac0e5cf4165");
s0.setCaptionLabel("Width");
s0.setColorLabel(0);

//control object: type="Number Slider". name="Height"
controlP5.addSlider("V18ac801bf5a84bcb8a5c1424783466b2", 12 , 48, V18ac801bf5a84bcb8a5c1424783466b2, 0, int(height-40.0), int(width-75), int(10.0));
Slider s3 = (Slider)controlP5.controller("V18ac801bf5a84bcb8a5c1424783466b2");
s3.setCaptionLabel("Height");
s3.setColorLabel(0);

//control object: type="Number Slider". name="Length"
controlP5.addSlider("Vd561ef7c572f4b3d97bd2641fdc52c75", 0 , 120, Vd561ef7c572f4b3d97bd2641fdc52c75, 0, int(height-60.0), int(width-75), int(10.0));
Slider s4 = (Slider)controlP5.controller("Vd561ef7c572f4b3d97bd2641fdc52c75");
s4.setCaptionLabel("Length");
s4.setColorLabel(0);

//set values for math objects
//Math Variable: type "Addition" , Nick name A+B;
V32f660ee5fa44f07a431e4aaea6ed252 = ( Vd561ef7c572f4b3d97bd2641fdc52c75 + Vefa65b1cc3ef4e7288d695873bb45a4b);

//Math Variable: type "Subtraction" , Nick name A-B;
V5271dd54202441918c04767018bf0777 = ( Vd561ef7c572f4b3d97bd2641fdc52c75 - Vefa65b1cc3ef4e7288d695873bb45a4b);

//Math Variable: type "Addition" , Nick name A+B;
Vcd1abecdb0574a3bb7ed2509ae244760 = ( V18ac801bf5a84bcb8a5c1424783466b2 + Vefa65b1cc3ef4e7288d695873bb45a4b);

controlP5.setAutoDraw(false);
smooth();

//set grid variables
gridSize = width;
gridDiv = 10;

}//end setup

  //create point objects
Point Vc4e49b7f6d6e4840a7ef93ecdb05d7b1 = new Point("1",Vd561ef7c572f4b3d97bd2641fdc52c75, 0,31.44);
Point V755fcde727484170bc2d6392c574d401 = new Point("1",81, 57,31.44);
Point V816a0a654be8415ea24f59a9409270fa = new Point("1",0, 57,0);
Point Vc4c245455bc44cd9b24be430867f1dc1 = new Point("1",Vd561ef7c572f4b3d97bd2641fdc52c75, Vd561ef7c572f4b3d97bd2641fdc52c75,V18ac801bf5a84bcb8a5c1424783466b2);
Point V4d458066d059490c9ffaa4c519876da4 = new Point("1",0, 0,31.44);

void draw() {
  background(255);
  //make sliders independent of camera
  if (controlP5.window(this).isMouseOver()) {
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }//end mouseover

//add reference grid
   grid();

//Update Math Object: type "Addition" , Nick name A+B;
V32f660ee5fa44f07a431e4aaea6ed252 = ( Vd561ef7c572f4b3d97bd2641fdc52c75 + Vefa65b1cc3ef4e7288d695873bb45a4b);

//Math Variable: type "Subtraction" , Nick name A-B;
V5271dd54202441918c04767018bf0777 = ( Vd561ef7c572f4b3d97bd2641fdc52c75 - Vefa65b1cc3ef4e7288d695873bb45a4b);

//Update Math Object: type "Addition" , Nick name A+B;
Vcd1abecdb0574a3bb7ed2509ae244760 = ( V18ac801bf5a84bcb8a5c1424783466b2 + Vefa65b1cc3ef4e7288d695873bb45a4b);

//update point  objects
// 1
Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.x = V32f660ee5fa44f07a431e4aaea6ed252;
Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
V755fcde727484170bc2d6392c574d401.x = Vd561ef7c572f4b3d97bd2641fdc52c75;
V755fcde727484170bc2d6392c574d401.y = Vce99d837f9534d00bebddac0e5cf4165;
V755fcde727484170bc2d6392c574d401.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
V816a0a654be8415ea24f59a9409270fa.y = Vce99d837f9534d00bebddac0e5cf4165;

// 1
Vc4c245455bc44cd9b24be430867f1dc1.x = V5271dd54202441918c04767018bf0777;
Vc4c245455bc44cd9b24be430867f1dc1.y = V5271dd54202441918c04767018bf0777;
Vc4c245455bc44cd9b24be430867f1dc1.z = Vcd1abecdb0574a3bb7ed2509ae244760;

// 1
V4d458066d059490c9ffaa4c519876da4.z = V18ac801bf5a84bcb8a5c1424783466b2;

//add surface objects
// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.x,Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.y,Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.z);
vertex(Vc4c245455bc44cd9b24be430867f1dc1.x,Vc4c245455bc44cd9b24be430867f1dc1.y,Vc4c245455bc44cd9b24be430867f1dc1.z);
vertex(V755fcde727484170bc2d6392c574d401.x,V755fcde727484170bc2d6392c574d401.y,V755fcde727484170bc2d6392c574d401.z);
vertex(V755fcde727484170bc2d6392c574d401.x,V755fcde727484170bc2d6392c574d401.y,V755fcde727484170bc2d6392c574d401.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.x,Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.y,Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.z);
vertex(Vc4c245455bc44cd9b24be430867f1dc1.x,Vc4c245455bc44cd9b24be430867f1dc1.y,Vc4c245455bc44cd9b24be430867f1dc1.z);
vertex(V816a0a654be8415ea24f59a9409270fa.x,V816a0a654be8415ea24f59a9409270fa.y,V816a0a654be8415ea24f59a9409270fa.z);
vertex(V816a0a654be8415ea24f59a9409270fa.x,V816a0a654be8415ea24f59a9409270fa.y,V816a0a654be8415ea24f59a9409270fa.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(Vc4c245455bc44cd9b24be430867f1dc1.x,Vc4c245455bc44cd9b24be430867f1dc1.y,Vc4c245455bc44cd9b24be430867f1dc1.z);
vertex(V816a0a654be8415ea24f59a9409270fa.x,V816a0a654be8415ea24f59a9409270fa.y,V816a0a654be8415ea24f59a9409270fa.z);
vertex(V755fcde727484170bc2d6392c574d401.x,V755fcde727484170bc2d6392c574d401.y,V755fcde727484170bc2d6392c574d401.z);
vertex(V755fcde727484170bc2d6392c574d401.x,V755fcde727484170bc2d6392c574d401.y,V755fcde727484170bc2d6392c574d401.z);
endShape();


cam.beginHUD();
 gui();
cam.endHUD();
}//end draw

//FUNCTIONS AND CLASSES

//Functions 
void gui() {
  currcamMatrix = new PMatrix3D(g3.camera);
  camera();
  controlP5.draw();
  g3.camera = currcamMatrix;
}//end GUI

void grid(){
  strokeWeight(.25);
  stroke(169,169,169);
  for(float i=gridSize*-0.5; i<=gridSize*0.5; i += gridSize/gridDiv){
    line ((gridSize*-0.5),i,0,(gridSize*0.5),i,0);
    line (i,(gridSize*-0.5),0,i,(gridSize*0.5),0);
  }// end for
} //end grid

//Classes 

//simple point class 
class Point{
  String name;
  float x, y, z;
  Point(String name,float x, float y, float z){
    this.name = name;
    this.x = x;
    this.y = y;
    this.z = z;
  }
    void render(){
    strokeWeight(5);
    stroke(255,0,0);
    point(x,y,z);
  }
}//end class Point

