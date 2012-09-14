//pde translated from 'ghTest.ghx' using Chrysalis
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
float Vce99d837f9534d00bebddac0e5cf4165 = 46.0;

//control variable: type "Number Slider" , Nick name Height;
float V18ac801bf5a84bcb8a5c1424783466b2 = 48.0;

//control variable: type "Number Slider" , Nick name Length;
float Vd561ef7c572f4b3d97bd2641fdc52c75 = 70.0;

//control variable: type "Number Slider" , Nick name Leg width;
float V36e99b721e4d4c67acd16369743c0811 = 7.453;

//control variable: type "Number Slider" , Nick name Leg skew;
float V596247baa8224d75bc4d8f56b38dff47 = 10.0;

//control variable: type "Number Slider" , Nick name groin depth;
float V193e0721637f49e2b2db031dbfada5a7 = 6.0;

//Math Variable: type "Addition" , Nick name A+B;
float V9b1e9f825bed4921a21822813621d8dc;

//Math Variable: type "Addition" , Nick name A+B;
float V32f660ee5fa44f07a431e4aaea6ed252;

//Math Variable: type "Addition" , Nick name A+B;
float V77687dbac17e46019c75dd0da54b535d;

//Math Variable: type "Addition" , Nick name A+B;
float Vb7aad09a6d6c42d9a44f563ed50049b9;

//Math Variable: type "Subtraction" , Nick name A-B;
float Vd02f3a76a7c44daaaff98ad458970522;

//Math Variable: type "Subtraction" , Nick name A-B;
float Vcf564b0919ab40c7975164512065ad97;

//Math Variable: type "Subtraction" , Nick name A-B;
float V5271dd54202441918c04767018bf0777;

//Math Variable: type "Subtraction" , Nick name A-B;
float V2f04c77b2dd34c7cacd0ce5a24b6b7a8;

//Math Variable: type "Addition" , Nick name A+B;
float Vb4045d9102104006a637a422ec60d656;

//Math Variable: type "Multiplication" , Nick name AXB;
float V265c7ab21f114ddda9aaf8e09aff1cdc;

//Math Variable: type "Subtraction" , Nick name A-B;
float Vdb3e65cf48194f8b8f4d8432f76a58a2;

//Math Variable: type "Multiplication" , Nick name AXB;
float Vbc057b8f2bea4029a3de9e1af5d9aac2;

//Math Variable: type "Addition" , Nick name A+B;
float V1f482bff466f4069aaedd43b29fdeab2;

//Math Variable: type "Addition" , Nick name A+B;
float Vcce959971b494a34837e0d16e4539eee;

//Math Variable: type "Addition" , Nick name A+B;
float Vd75424b6696d498ba5da000696b90c4c;

//Math Variable: type "Subtraction" , Nick name A-B;
float V7056678f8e5946dca7cb88f0013de17a;

//Math Variable: type "Subtraction" , Nick name A-B;
float Vd0ebe5b02e77477da4c916c26e992fc6;

//Math Variable: type "Subtraction" , Nick name A-B;
float V2f6c0c1e3c3f4c64a34ac86da7296049;

//Math Variable: type "Subtraction" , Nick name A-B;
float Vc45453e84e2d4018adac03cec94f887b;

//Math Variable: type "Addition" , Nick name A+B;
float V5ddc0834179a4285b4cebf954f998c47;

//Math Variable: type "Multiplication" , Nick name AXB;
float V49fef2a0c5b84a12a0296a626942a885;

//Math Variable: type "Subtraction" , Nick name A-B;
float V2a1083a85cf640daa743f76960282e9a;

//Math Variable: type "Multiplication" , Nick name AXB;
float Va687517b12974f6aaf4a2557d36fc290;

//Math Variable: type "Subtraction" , Nick name A-B;
float V0b71e44254374416abb30f7a796382ce;

//Math Variable: type "Subtraction" , Nick name A-B;
float V9474bcdaa2574955964659309a18eaf9;

//Math Variable: type "Multiplication" , Nick name AXB;
float Vca8f1c2aaa7d4b0f87412e07a8b69c87;

//Math Variable: type "Subtraction" , Nick name A-B;
float Vadb018e7702e4e258e801e1f70f9e203;

//Math Variable: type "Subtraction" , Nick name A-B;
float Vc8b5982649174a81a0572265fd5d5643;

//Math Variable: type "Addition" , Nick name A+B;
float Vdb7e49f9f132457fa7698f468bcb516b;

//Math Variable: type "Subtraction" , Nick name A-B;
float V9660d82d941f4f9aae83f0360f4a754c;

//Math Variable: type "Subtraction" , Nick name A-B;
float Vd65faa9a5223447285d5e6cedaffb13b;

//Math Variable: type "Multiplication" , Nick name AXB;
float V28116e30ec414de69702f23867880596;

//Math Variable: type "Subtraction" , Nick name A-B;
float V31489b2e09eb4aae9af01d654738af4f;

//Math Variable: type "Subtraction" , Nick name A-B;
float Va4af5942eb9941489488f39f78f61385;

//Math Variable: type "Addition" , Nick name A+B;
float V99e04ddb402b4f769bddf3721427485c;

//Math Variable: type "Subtraction" , Nick name A-B;
float Vb8e237845614452e9373d0f04606d81d;

//Math Variable: type "Subtraction" , Nick name A-B;
float V1dc29031b9824fb6a15ac915c4158d92;

//Math Variable: type "Subtraction" , Nick name A-B;
float V838a2d46830c4925ac69a8f5907f296d;

//Math Variable: type "Subtraction" , Nick name A-B;
float Vab1d9c3a0d7e4186998f50e72479f09c;

//Static Variable: type "Panel" , Nick name origin;
float Vefa65b1cc3ef4e7288d695873bb45a4b = ( 0);

//Static Variable: type "Panel" , Nick name table thickness;
float Vd6eac35fd83941cfaba3d085fcd7a508 = ( .75);

//Static Variable: type "Panel" , Nick name inset;
float V4ba0b552261e482aa0a7769e91af7606 = ( 3);

//Static Variable: type "Panel" , Nick name factor;
float V84f55af3559c4ace846c7dafae6e6f53 = ( 2);

//Static Variable: type "Panel" , Nick name factor;
float Vc80e974523224acfa4b8e51789b2ff77 = ( 0.5);

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
Slider s5 = (Slider)controlP5.controller("V18ac801bf5a84bcb8a5c1424783466b2");
s5.setCaptionLabel("Height");
s5.setColorLabel(0);

//control object: type="Number Slider". name="Length"
controlP5.addSlider("Vd561ef7c572f4b3d97bd2641fdc52c75", 0 , 120, Vd561ef7c572f4b3d97bd2641fdc52c75, 0, int(height-60.0), int(width-75), int(10.0));
Slider s6 = (Slider)controlP5.controller("Vd561ef7c572f4b3d97bd2641fdc52c75");
s6.setCaptionLabel("Length");
s6.setColorLabel(0);

//control object: type="Number Slider". name="Leg width"
controlP5.addSlider("V36e99b721e4d4c67acd16369743c0811", 2 , 10, V36e99b721e4d4c67acd16369743c0811, 0, int(height-80.0), int(width-75), int(10.0));
Slider s33 = (Slider)controlP5.controller("V36e99b721e4d4c67acd16369743c0811");
s33.setCaptionLabel("Leg width");
s33.setColorLabel(0);

//control object: type="Number Slider". name="Leg skew"
controlP5.addSlider("V596247baa8224d75bc4d8f56b38dff47", 2 , 10, V596247baa8224d75bc4d8f56b38dff47, 0, int(height-100.0), int(width-75), int(10.0));
Slider s41 = (Slider)controlP5.controller("V596247baa8224d75bc4d8f56b38dff47");
s41.setCaptionLabel("Leg skew");
s41.setColorLabel(0);

//control object: type="Number Slider". name="groin depth"
controlP5.addSlider("V193e0721637f49e2b2db031dbfada5a7", 3 , 6, V193e0721637f49e2b2db031dbfada5a7, 0, int(height-120.0), int(width-75), int(10.0));
Slider s42 = (Slider)controlP5.controller("V193e0721637f49e2b2db031dbfada5a7");
s42.setCaptionLabel("groin depth");
s42.setColorLabel(0);

//set values for math objects
//Math Variable: type "Addition" , Nick name A+B;
V9b1e9f825bed4921a21822813621d8dc = ( Vd6eac35fd83941cfaba3d085fcd7a508 + V18ac801bf5a84bcb8a5c1424783466b2);

//Math Variable: type "Addition" , Nick name A+B;
V32f660ee5fa44f07a431e4aaea6ed252 = ( Vefa65b1cc3ef4e7288d695873bb45a4b + V4ba0b552261e482aa0a7769e91af7606);

//Math Variable: type "Addition" , Nick name A+B;
V77687dbac17e46019c75dd0da54b535d = ( Vd6eac35fd83941cfaba3d085fcd7a508 + V4ba0b552261e482aa0a7769e91af7606);

//Math Variable: type "Addition" , Nick name A+B;
Vb7aad09a6d6c42d9a44f563ed50049b9 = ( V36e99b721e4d4c67acd16369743c0811 + V4ba0b552261e482aa0a7769e91af7606);

//Math Variable: type "Subtraction" , Nick name A-B;
Vd02f3a76a7c44daaaff98ad458970522 = ( V77687dbac17e46019c75dd0da54b535d - V596247baa8224d75bc4d8f56b38dff47);

//Math Variable: type "Subtraction" , Nick name A-B;
Vcf564b0919ab40c7975164512065ad97 = ( Vb7aad09a6d6c42d9a44f563ed50049b9 - V596247baa8224d75bc4d8f56b38dff47);

//Math Variable: type "Subtraction" , Nick name A-B;
V5271dd54202441918c04767018bf0777 = ( V32f660ee5fa44f07a431e4aaea6ed252 - V596247baa8224d75bc4d8f56b38dff47);

//Math Variable: type "Subtraction" , Nick name A-B;
V2f04c77b2dd34c7cacd0ce5a24b6b7a8 = ( V18ac801bf5a84bcb8a5c1424783466b2 - V193e0721637f49e2b2db031dbfada5a7);

//Math Variable: type "Addition" , Nick name A+B;
Vb4045d9102104006a637a422ec60d656 = ( Vbc057b8f2bea4029a3de9e1af5d9aac2 + V36e99b721e4d4c67acd16369743c0811);

//Math Variable: type "Multiplication" , Nick name AXB;
V265c7ab21f114ddda9aaf8e09aff1cdc = ( Vb4045d9102104006a637a422ec60d656 * V84f55af3559c4ace846c7dafae6e6f53);

//Math Variable: type "Subtraction" , Nick name A-B;
Vdb3e65cf48194f8b8f4d8432f76a58a2 = ( V18ac801bf5a84bcb8a5c1424783466b2 - Vc80e974523224acfa4b8e51789b2ff77);

//Math Variable: type "Multiplication" , Nick name AXB;
Vbc057b8f2bea4029a3de9e1af5d9aac2 = ( V36e99b721e4d4c67acd16369743c0811 * V84f55af3559c4ace846c7dafae6e6f53);

//Math Variable: type "Addition" , Nick name A+B;
V1f482bff466f4069aaedd43b29fdeab2 = ( Vd6eac35fd83941cfaba3d085fcd7a508 + V18ac801bf5a84bcb8a5c1424783466b2);

//Math Variable: type "Addition" , Nick name A+B;
Vcce959971b494a34837e0d16e4539eee = ( Vefa65b1cc3ef4e7288d695873bb45a4b + V4ba0b552261e482aa0a7769e91af7606);

//Math Variable: type "Addition" , Nick name A+B;
Vd75424b6696d498ba5da000696b90c4c = ( V36e99b721e4d4c67acd16369743c0811 + V4ba0b552261e482aa0a7769e91af7606);

//Math Variable: type "Subtraction" , Nick name A-B;
V7056678f8e5946dca7cb88f0013de17a = ( Vab1d9c3a0d7e4186998f50e72479f09c - V596247baa8224d75bc4d8f56b38dff47);

//Math Variable: type "Subtraction" , Nick name A-B;
Vd0ebe5b02e77477da4c916c26e992fc6 = ( Vd75424b6696d498ba5da000696b90c4c - V596247baa8224d75bc4d8f56b38dff47);

//Math Variable: type "Subtraction" , Nick name A-B;
V2f6c0c1e3c3f4c64a34ac86da7296049 = ( Vcce959971b494a34837e0d16e4539eee - V596247baa8224d75bc4d8f56b38dff47);

//Math Variable: type "Subtraction" , Nick name A-B;
Vc45453e84e2d4018adac03cec94f887b = ( V18ac801bf5a84bcb8a5c1424783466b2 - V193e0721637f49e2b2db031dbfada5a7);

//Math Variable: type "Addition" , Nick name A+B;
V5ddc0834179a4285b4cebf954f998c47 = ( Va687517b12974f6aaf4a2557d36fc290 + V36e99b721e4d4c67acd16369743c0811);

//Math Variable: type "Multiplication" , Nick name AXB;
V49fef2a0c5b84a12a0296a626942a885 = ( V5ddc0834179a4285b4cebf954f998c47 * V84f55af3559c4ace846c7dafae6e6f53);

//Math Variable: type "Subtraction" , Nick name A-B;
V2a1083a85cf640daa743f76960282e9a = ( V18ac801bf5a84bcb8a5c1424783466b2 - Vc80e974523224acfa4b8e51789b2ff77);

//Math Variable: type "Multiplication" , Nick name AXB;
Va687517b12974f6aaf4a2557d36fc290 = ( V36e99b721e4d4c67acd16369743c0811 * V84f55af3559c4ace846c7dafae6e6f53);

//Math Variable: type "Subtraction" , Nick name A-B;
V0b71e44254374416abb30f7a796382ce = ( Vce99d837f9534d00bebddac0e5cf4165 - V4ba0b552261e482aa0a7769e91af7606);

//Math Variable: type "Subtraction" , Nick name A-B;
V9474bcdaa2574955964659309a18eaf9 = ( Vd561ef7c572f4b3d97bd2641fdc52c75 - V4ba0b552261e482aa0a7769e91af7606);

//Math Variable: type "Multiplication" , Nick name AXB;
Vca8f1c2aaa7d4b0f87412e07a8b69c87 = ( V36e99b721e4d4c67acd16369743c0811 * V84f55af3559c4ace846c7dafae6e6f53);

//Math Variable: type "Subtraction" , Nick name A-B;
Vadb018e7702e4e258e801e1f70f9e203 = ( V9474bcdaa2574955964659309a18eaf9 - Vca8f1c2aaa7d4b0f87412e07a8b69c87);

//Math Variable: type "Subtraction" , Nick name A-B;
Vc8b5982649174a81a0572265fd5d5643 = ( V9474bcdaa2574955964659309a18eaf9 - V36e99b721e4d4c67acd16369743c0811);

//Math Variable: type "Addition" , Nick name A+B;
Vdb7e49f9f132457fa7698f468bcb516b = ( V9474bcdaa2574955964659309a18eaf9 + V596247baa8224d75bc4d8f56b38dff47);

//Math Variable: type "Subtraction" , Nick name A-B;
V9660d82d941f4f9aae83f0360f4a754c = ( Vdb7e49f9f132457fa7698f468bcb516b - V36e99b721e4d4c67acd16369743c0811);

//Math Variable: type "Subtraction" , Nick name A-B;
Vd65faa9a5223447285d5e6cedaffb13b = ( Vd561ef7c572f4b3d97bd2641fdc52c75 - V4ba0b552261e482aa0a7769e91af7606);

//Math Variable: type "Multiplication" , Nick name AXB;
V28116e30ec414de69702f23867880596 = ( V36e99b721e4d4c67acd16369743c0811 * V84f55af3559c4ace846c7dafae6e6f53);

//Math Variable: type "Subtraction" , Nick name A-B;
V31489b2e09eb4aae9af01d654738af4f = ( Vd65faa9a5223447285d5e6cedaffb13b - V28116e30ec414de69702f23867880596);

//Math Variable: type "Subtraction" , Nick name A-B;
Va4af5942eb9941489488f39f78f61385 = ( Vd65faa9a5223447285d5e6cedaffb13b - V36e99b721e4d4c67acd16369743c0811);

//Math Variable: type "Addition" , Nick name A+B;
V99e04ddb402b4f769bddf3721427485c = ( Vd65faa9a5223447285d5e6cedaffb13b + V596247baa8224d75bc4d8f56b38dff47);

//Math Variable: type "Subtraction" , Nick name A-B;
Vb8e237845614452e9373d0f04606d81d = ( V99e04ddb402b4f769bddf3721427485c - V36e99b721e4d4c67acd16369743c0811);

//Math Variable: type "Subtraction" , Nick name A-B;
V1dc29031b9824fb6a15ac915c4158d92 = ( Vce99d837f9534d00bebddac0e5cf4165 - V4ba0b552261e482aa0a7769e91af7606);

//Math Variable: type "Subtraction" , Nick name A-B;
V838a2d46830c4925ac69a8f5907f296d = ( V1dc29031b9824fb6a15ac915c4158d92 - Vd6eac35fd83941cfaba3d085fcd7a508);

//Math Variable: type "Subtraction" , Nick name A-B;
Vab1d9c3a0d7e4186998f50e72479f09c = ( V0b71e44254374416abb30f7a796382ce - Vd6eac35fd83941cfaba3d085fcd7a508);

controlP5.setAutoDraw(false);
smooth();

//set grid variables
gridSize = width;
gridDiv = 10;

}//end setup

  //create point objects
Point Vc4e49b7f6d6e4840a7ef93ecdb05d7b1 = new Point("1",0, 0,48);
Point V196e267fe81f4442b37efe6b41e61703 = new Point("3",70, 0,48);
Point Vc60dc527b5514569bb88c610733f56b2 = new Point("2",0, 46,48);
Point V00e7b28fce3445ad95a19cb7b449e160 = new Point("4",70, 46,48);
Point V14652a726dc846b98be0823c58ed8ae2 = new Point("1a",0, 0,Vd6eac35fd83941cfaba3d085fcd7a508);
Point Va26e91b0d69f4b6aa8f4d4b5717cf1e6 = new Point("3a",70, 0,Vd6eac35fd83941cfaba3d085fcd7a508);
Point V6104be558cec459db79c02f32350d516 = new Point("2a",0, 46,Vd6eac35fd83941cfaba3d085fcd7a508);
Point Va8bf6ad02bd64afbb6a4dfd104ed514c = new Point("4a",70, 46,Vd6eac35fd83941cfaba3d085fcd7a508);
Point V11a57f5e65284e1f9db6f1fb00f430d7 = new Point("1",V32f660ee5fa44f07a431e4aaea6ed252, Vefa65b1cc3ef4e7288d695873bb45a4b,0);
Point V49bbc422369d437db4194f48b58216bb = new Point("1",Vb7aad09a6d6c42d9a44f563ed50049b9, Vefa65b1cc3ef4e7288d695873bb45a4b,0);
Point Va771eda590ca41ffa0ef021a88d213b3 = new Point("1",V32f660ee5fa44f07a431e4aaea6ed252, Vd6eac35fd83941cfaba3d085fcd7a508,0);
Point V125400430cb04c1d8aa9b3cce228345c = new Point("1",Vb7aad09a6d6c42d9a44f563ed50049b9, Vd6eac35fd83941cfaba3d085fcd7a508,0);
Point Vbdf3e247f35d43a5a06014e64d499d6f = new Point("1",Vefa65b1cc3ef4e7288d695873bb45a4b, Vefa65b1cc3ef4e7288d695873bb45a4b,48);
Point Ve32cd5e774054cc7a5180d9a09b96148 = new Point("1",V36e99b721e4d4c67acd16369743c0811, Vefa65b1cc3ef4e7288d695873bb45a4b,V18ac801bf5a84bcb8a5c1424783466b2);
Point Vf709c877c6894a16b10ecd508bb5bba7 = new Point("1",Vefa65b1cc3ef4e7288d695873bb45a4b, Vd6eac35fd83941cfaba3d085fcd7a508,48);
Point V270a4c58cb98496094883c2d47160c6a = new Point("1",V36e99b721e4d4c67acd16369743c0811, Vd6eac35fd83941cfaba3d085fcd7a508,V18ac801bf5a84bcb8a5c1424783466b2);
Point V85b5319a1a0b45d98d33b51a2756d3a9 = new Point("1",Vefa65b1cc3ef4e7288d695873bb45a4b, Vefa65b1cc3ef4e7288d695873bb45a4b,48);
Point V7355db863e744f82b234b28fa56ca25c = new Point("1",Vbc057b8f2bea4029a3de9e1af5d9aac2, Vefa65b1cc3ef4e7288d695873bb45a4b,48);
Point V3aab85bee08040f192dcad4307483116 = new Point("1",Vefa65b1cc3ef4e7288d695873bb45a4b, Vd6eac35fd83941cfaba3d085fcd7a508,48);
Point Ve07fcc41e4d74b01b419bb37daeabd8b = new Point("1",Vbc057b8f2bea4029a3de9e1af5d9aac2, Vd6eac35fd83941cfaba3d085fcd7a508,48);
Point Vbca10edbeb614b8fbca7c9c57e8cec53 = new Point("1",Vbc057b8f2bea4029a3de9e1af5d9aac2, Vefa65b1cc3ef4e7288d695873bb45a4b,V18ac801bf5a84bcb8a5c1424783466b2);
Point Vcbe37d3af26b4d7bbe6744ed7558a113 = new Point("1",Vbc057b8f2bea4029a3de9e1af5d9aac2, Vd6eac35fd83941cfaba3d085fcd7a508,V18ac801bf5a84bcb8a5c1424783466b2);
Point V6168df8397d64187b89426c80c9bf8f9 = new Point("1",Vcce959971b494a34837e0d16e4539eee, Vce99d837f9534d00bebddac0e5cf4165,0);
Point V684593ffc2e942159de5d7441f0b794b = new Point("1",Vd75424b6696d498ba5da000696b90c4c, Vce99d837f9534d00bebddac0e5cf4165,0);
Point Vf6b02809ae47409689bf6400a65596b9 = new Point("1",Vcce959971b494a34837e0d16e4539eee, V0b71e44254374416abb30f7a796382ce,0);
Point V9d29723ca24142d8abd61f3353d19ffd = new Point("1",Vd75424b6696d498ba5da000696b90c4c, V0b71e44254374416abb30f7a796382ce,0);
Point Va66ac922fae44a3ea8704dd2c16178a8 = new Point("1",Vefa65b1cc3ef4e7288d695873bb45a4b, Vce99d837f9534d00bebddac0e5cf4165,48);
Point Vff0991b2fced443b82a3bc13006cfd4d = new Point("1",V36e99b721e4d4c67acd16369743c0811, Vce99d837f9534d00bebddac0e5cf4165,V18ac801bf5a84bcb8a5c1424783466b2);
Point Vd3f2078a53e94278bd83b6d13790fe5d = new Point("1",Vefa65b1cc3ef4e7288d695873bb45a4b, V0b71e44254374416abb30f7a796382ce,48);
Point V6514c1b0e2604d03ad0279b5597c865a = new Point("1",V36e99b721e4d4c67acd16369743c0811, V0b71e44254374416abb30f7a796382ce,V18ac801bf5a84bcb8a5c1424783466b2);
Point Vb74369ae6d43459e8a47e330ea06a8ee = new Point("1",Vefa65b1cc3ef4e7288d695873bb45a4b, Vce99d837f9534d00bebddac0e5cf4165,48);
Point V2e281849c83741a5a0e2068c7bf974a4 = new Point("1",Va687517b12974f6aaf4a2557d36fc290, Vce99d837f9534d00bebddac0e5cf4165,48);
Point Ve2eacb04186348b1be300d43939bd526 = new Point("1",Vefa65b1cc3ef4e7288d695873bb45a4b, V0b71e44254374416abb30f7a796382ce,48);
Point V72c2f49dc5f1476397e2f43ee63859f9 = new Point("1",Va687517b12974f6aaf4a2557d36fc290, V0b71e44254374416abb30f7a796382ce,48);
Point V7a286a56f71a42d98be0dc1952516898 = new Point("1",Va687517b12974f6aaf4a2557d36fc290, Vce99d837f9534d00bebddac0e5cf4165,V18ac801bf5a84bcb8a5c1424783466b2);
Point Vd8198db11c494583b3c60082928ae545 = new Point("1",Va687517b12974f6aaf4a2557d36fc290, V0b71e44254374416abb30f7a796382ce,V18ac801bf5a84bcb8a5c1424783466b2);
Point V6cb65c617dee4ce8a5946b237feaabb5 = new Point("1",V9474bcdaa2574955964659309a18eaf9, Vefa65b1cc3ef4e7288d695873bb45a4b,0);
Point V9e09fd7af5104fb9bef5f763bdde6e6d = new Point("1",Vdb7e49f9f132457fa7698f468bcb516b, Vefa65b1cc3ef4e7288d695873bb45a4b,0);
Point V0ae547e55d7942aa8722db1969722ad1 = new Point("1",V9474bcdaa2574955964659309a18eaf9, Vd6eac35fd83941cfaba3d085fcd7a508,0);
Point Vcd01ec819711476b999a04e82f4969e5 = new Point("1",Vdb7e49f9f132457fa7698f468bcb516b, Vd6eac35fd83941cfaba3d085fcd7a508,0);
Point V085eb36104a1478b8655d7174691c768 = new Point("1",Vd561ef7c572f4b3d97bd2641fdc52c75, Vefa65b1cc3ef4e7288d695873bb45a4b,48);
Point V11362de55b5a4ae194258e5670ab6554 = new Point("1",V9474bcdaa2574955964659309a18eaf9, Vefa65b1cc3ef4e7288d695873bb45a4b,V18ac801bf5a84bcb8a5c1424783466b2);
Point V955a8856a7794698b4b61d8a535feaf9 = new Point("1",Vd561ef7c572f4b3d97bd2641fdc52c75, Vd6eac35fd83941cfaba3d085fcd7a508,48);
Point V5ca30c64f118485c9e5ff59d1e5e4c54 = new Point("1",V9474bcdaa2574955964659309a18eaf9, Vd6eac35fd83941cfaba3d085fcd7a508,V18ac801bf5a84bcb8a5c1424783466b2);
Point V0022b48b116540f2821b5e5da0abda1e = new Point("1",Vd561ef7c572f4b3d97bd2641fdc52c75, Vefa65b1cc3ef4e7288d695873bb45a4b,48);
Point V4564eac84a674780acf3400d72733405 = new Point("1",V9474bcdaa2574955964659309a18eaf9, Vefa65b1cc3ef4e7288d695873bb45a4b,48);
Point V5042ac61e78d4919a5fa46e24890156a = new Point("1",Vd561ef7c572f4b3d97bd2641fdc52c75, Vd6eac35fd83941cfaba3d085fcd7a508,48);
Point V9b25d4af54b04512b7518d102205fafd = new Point("1",V9474bcdaa2574955964659309a18eaf9, Vd6eac35fd83941cfaba3d085fcd7a508,48);
Point V399c39d5cf7b43a2a601969cbb2eaaac = new Point("1",V9474bcdaa2574955964659309a18eaf9, Vefa65b1cc3ef4e7288d695873bb45a4b,V18ac801bf5a84bcb8a5c1424783466b2);
Point V6dc9c2b3d8304d1ab5f5c698e600624e = new Point("1",V9474bcdaa2574955964659309a18eaf9, Vd6eac35fd83941cfaba3d085fcd7a508,V18ac801bf5a84bcb8a5c1424783466b2);
Point V075bb41dbd1d48648517425f727d0ae6 = new Point("1",Vd65faa9a5223447285d5e6cedaffb13b, Vce99d837f9534d00bebddac0e5cf4165,0);
Point V97a762a9e5ba45d19a937bb3f2ac5e0e = new Point("1",V99e04ddb402b4f769bddf3721427485c, Vce99d837f9534d00bebddac0e5cf4165,0);
Point Vedf1894f21a64f69b3dea0046ed88531 = new Point("1",Vd65faa9a5223447285d5e6cedaffb13b, V1dc29031b9824fb6a15ac915c4158d92,0);
Point V8ae5e4e29fd34f12826d963dc83f07eb = new Point("1",V99e04ddb402b4f769bddf3721427485c, V1dc29031b9824fb6a15ac915c4158d92,0);
Point V5b758f7cecb441e68bcdbadf28a9e68e = new Point("1",Vd561ef7c572f4b3d97bd2641fdc52c75, Vce99d837f9534d00bebddac0e5cf4165,48);
Point V194ec4c2fdb641ccae74c27e9b2c4c8e = new Point("1",Vd65faa9a5223447285d5e6cedaffb13b, Vce99d837f9534d00bebddac0e5cf4165,V18ac801bf5a84bcb8a5c1424783466b2);
Point V66e32272a0ce47c296dad4db6ec0df4d = new Point("1",Vd561ef7c572f4b3d97bd2641fdc52c75, V1dc29031b9824fb6a15ac915c4158d92,48);
Point Vec26df8c62044640b1724953eec87119 = new Point("1",Vd65faa9a5223447285d5e6cedaffb13b, V1dc29031b9824fb6a15ac915c4158d92,V18ac801bf5a84bcb8a5c1424783466b2);
Point Ved6d7556c6554606a3bc1afcdde4685f = new Point("1",Vd561ef7c572f4b3d97bd2641fdc52c75, Vce99d837f9534d00bebddac0e5cf4165,48);
Point Va26de8d5ee414334a22dad08fddea2f4 = new Point("1",Vd65faa9a5223447285d5e6cedaffb13b, Vce99d837f9534d00bebddac0e5cf4165,48);
Point Vc03ad6c2b346405bb9eb7f902941697c = new Point("1",Vd561ef7c572f4b3d97bd2641fdc52c75, V1dc29031b9824fb6a15ac915c4158d92,48);
Point V0a226085c4a245b392573a32b154d0db = new Point("1",Vd65faa9a5223447285d5e6cedaffb13b, V1dc29031b9824fb6a15ac915c4158d92,48);
Point Ve8e1a5b6178549cba3af1aeb56900ea6 = new Point("1",Vd65faa9a5223447285d5e6cedaffb13b, Vce99d837f9534d00bebddac0e5cf4165,V18ac801bf5a84bcb8a5c1424783466b2);
Point Ved6582829407478a93099ea2b36c661f = new Point("1",Vd65faa9a5223447285d5e6cedaffb13b, V1dc29031b9824fb6a15ac915c4158d92,V18ac801bf5a84bcb8a5c1424783466b2);

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
V9b1e9f825bed4921a21822813621d8dc = ( Vd6eac35fd83941cfaba3d085fcd7a508 + V18ac801bf5a84bcb8a5c1424783466b2);

//Update Math Object: type "Addition" , Nick name A+B;
V32f660ee5fa44f07a431e4aaea6ed252 = ( Vefa65b1cc3ef4e7288d695873bb45a4b + V4ba0b552261e482aa0a7769e91af7606);

//Update Math Object: type "Addition" , Nick name A+B;
V77687dbac17e46019c75dd0da54b535d = ( Vd6eac35fd83941cfaba3d085fcd7a508 + V4ba0b552261e482aa0a7769e91af7606);

//Update Math Object: type "Addition" , Nick name A+B;
Vb7aad09a6d6c42d9a44f563ed50049b9 = ( V36e99b721e4d4c67acd16369743c0811 + V4ba0b552261e482aa0a7769e91af7606);

//Math Variable: type "Subtraction" , Nick name A-B;
Vd02f3a76a7c44daaaff98ad458970522 = ( V77687dbac17e46019c75dd0da54b535d - V596247baa8224d75bc4d8f56b38dff47);

//Math Variable: type "Subtraction" , Nick name A-B;
Vcf564b0919ab40c7975164512065ad97 = ( Vb7aad09a6d6c42d9a44f563ed50049b9 - V596247baa8224d75bc4d8f56b38dff47);

//Math Variable: type "Subtraction" , Nick name A-B;
V5271dd54202441918c04767018bf0777 = ( V32f660ee5fa44f07a431e4aaea6ed252 - V596247baa8224d75bc4d8f56b38dff47);

//Math Variable: type "Subtraction" , Nick name A-B;
V2f04c77b2dd34c7cacd0ce5a24b6b7a8 = ( V18ac801bf5a84bcb8a5c1424783466b2 - V193e0721637f49e2b2db031dbfada5a7);

//Update Math Object: type "Addition" , Nick name A+B;
Vb4045d9102104006a637a422ec60d656 = ( Vbc057b8f2bea4029a3de9e1af5d9aac2 + V36e99b721e4d4c67acd16369743c0811);

//Update Math Object: type "Multiplication" , Nick name AXB;
V265c7ab21f114ddda9aaf8e09aff1cdc = ( Vb4045d9102104006a637a422ec60d656 * V84f55af3559c4ace846c7dafae6e6f53);

//Math Variable: type "Subtraction" , Nick name A-B;
Vdb3e65cf48194f8b8f4d8432f76a58a2 = ( V18ac801bf5a84bcb8a5c1424783466b2 - Vc80e974523224acfa4b8e51789b2ff77);

//Update Math Object: type "Multiplication" , Nick name AXB;
Vbc057b8f2bea4029a3de9e1af5d9aac2 = ( V36e99b721e4d4c67acd16369743c0811 * V84f55af3559c4ace846c7dafae6e6f53);

//Update Math Object: type "Addition" , Nick name A+B;
V1f482bff466f4069aaedd43b29fdeab2 = ( Vd6eac35fd83941cfaba3d085fcd7a508 + V18ac801bf5a84bcb8a5c1424783466b2);

//Update Math Object: type "Addition" , Nick name A+B;
Vcce959971b494a34837e0d16e4539eee = ( Vefa65b1cc3ef4e7288d695873bb45a4b + V4ba0b552261e482aa0a7769e91af7606);

//Update Math Object: type "Addition" , Nick name A+B;
Vd75424b6696d498ba5da000696b90c4c = ( V36e99b721e4d4c67acd16369743c0811 + V4ba0b552261e482aa0a7769e91af7606);

//Math Variable: type "Subtraction" , Nick name A-B;
V7056678f8e5946dca7cb88f0013de17a = ( Vab1d9c3a0d7e4186998f50e72479f09c - V596247baa8224d75bc4d8f56b38dff47);

//Math Variable: type "Subtraction" , Nick name A-B;
Vd0ebe5b02e77477da4c916c26e992fc6 = ( Vd75424b6696d498ba5da000696b90c4c - V596247baa8224d75bc4d8f56b38dff47);

//Math Variable: type "Subtraction" , Nick name A-B;
V2f6c0c1e3c3f4c64a34ac86da7296049 = ( Vcce959971b494a34837e0d16e4539eee - V596247baa8224d75bc4d8f56b38dff47);

//Math Variable: type "Subtraction" , Nick name A-B;
Vc45453e84e2d4018adac03cec94f887b = ( V18ac801bf5a84bcb8a5c1424783466b2 - V193e0721637f49e2b2db031dbfada5a7);

//Update Math Object: type "Addition" , Nick name A+B;
V5ddc0834179a4285b4cebf954f998c47 = ( Va687517b12974f6aaf4a2557d36fc290 + V36e99b721e4d4c67acd16369743c0811);

//Update Math Object: type "Multiplication" , Nick name AXB;
V49fef2a0c5b84a12a0296a626942a885 = ( V5ddc0834179a4285b4cebf954f998c47 * V84f55af3559c4ace846c7dafae6e6f53);

//Math Variable: type "Subtraction" , Nick name A-B;
V2a1083a85cf640daa743f76960282e9a = ( V18ac801bf5a84bcb8a5c1424783466b2 - Vc80e974523224acfa4b8e51789b2ff77);

//Update Math Object: type "Multiplication" , Nick name AXB;
Va687517b12974f6aaf4a2557d36fc290 = ( V36e99b721e4d4c67acd16369743c0811 * V84f55af3559c4ace846c7dafae6e6f53);

//Math Variable: type "Subtraction" , Nick name A-B;
V0b71e44254374416abb30f7a796382ce = ( Vce99d837f9534d00bebddac0e5cf4165 - V4ba0b552261e482aa0a7769e91af7606);

//Math Variable: type "Subtraction" , Nick name A-B;
V9474bcdaa2574955964659309a18eaf9 = ( Vd561ef7c572f4b3d97bd2641fdc52c75 - V4ba0b552261e482aa0a7769e91af7606);

//Update Math Object: type "Multiplication" , Nick name AXB;
Vca8f1c2aaa7d4b0f87412e07a8b69c87 = ( V36e99b721e4d4c67acd16369743c0811 * V84f55af3559c4ace846c7dafae6e6f53);

//Math Variable: type "Subtraction" , Nick name A-B;
Vadb018e7702e4e258e801e1f70f9e203 = ( V9474bcdaa2574955964659309a18eaf9 - Vca8f1c2aaa7d4b0f87412e07a8b69c87);

//Math Variable: type "Subtraction" , Nick name A-B;
Vc8b5982649174a81a0572265fd5d5643 = ( V9474bcdaa2574955964659309a18eaf9 - V36e99b721e4d4c67acd16369743c0811);

//Update Math Object: type "Addition" , Nick name A+B;
Vdb7e49f9f132457fa7698f468bcb516b = ( V9474bcdaa2574955964659309a18eaf9 + V596247baa8224d75bc4d8f56b38dff47);

//Math Variable: type "Subtraction" , Nick name A-B;
V9660d82d941f4f9aae83f0360f4a754c = ( Vdb7e49f9f132457fa7698f468bcb516b - V36e99b721e4d4c67acd16369743c0811);

//Math Variable: type "Subtraction" , Nick name A-B;
Vd65faa9a5223447285d5e6cedaffb13b = ( Vd561ef7c572f4b3d97bd2641fdc52c75 - V4ba0b552261e482aa0a7769e91af7606);

//Update Math Object: type "Multiplication" , Nick name AXB;
V28116e30ec414de69702f23867880596 = ( V36e99b721e4d4c67acd16369743c0811 * V84f55af3559c4ace846c7dafae6e6f53);

//Math Variable: type "Subtraction" , Nick name A-B;
V31489b2e09eb4aae9af01d654738af4f = ( Vd65faa9a5223447285d5e6cedaffb13b - V28116e30ec414de69702f23867880596);

//Math Variable: type "Subtraction" , Nick name A-B;
Va4af5942eb9941489488f39f78f61385 = ( Vd65faa9a5223447285d5e6cedaffb13b - V36e99b721e4d4c67acd16369743c0811);

//Update Math Object: type "Addition" , Nick name A+B;
V99e04ddb402b4f769bddf3721427485c = ( Vd65faa9a5223447285d5e6cedaffb13b + V596247baa8224d75bc4d8f56b38dff47);

//Math Variable: type "Subtraction" , Nick name A-B;
Vb8e237845614452e9373d0f04606d81d = ( V99e04ddb402b4f769bddf3721427485c - V36e99b721e4d4c67acd16369743c0811);

//Math Variable: type "Subtraction" , Nick name A-B;
V1dc29031b9824fb6a15ac915c4158d92 = ( Vce99d837f9534d00bebddac0e5cf4165 - V4ba0b552261e482aa0a7769e91af7606);

//Math Variable: type "Subtraction" , Nick name A-B;
V838a2d46830c4925ac69a8f5907f296d = ( V1dc29031b9824fb6a15ac915c4158d92 - Vd6eac35fd83941cfaba3d085fcd7a508);

//Math Variable: type "Subtraction" , Nick name A-B;
Vab1d9c3a0d7e4186998f50e72479f09c = ( V0b71e44254374416abb30f7a796382ce - Vd6eac35fd83941cfaba3d085fcd7a508);

//update point  objects
// 1
Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.x = Vefa65b1cc3ef4e7288d695873bb45a4b;
Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.y = Vefa65b1cc3ef4e7288d695873bb45a4b;
Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 3
V196e267fe81f4442b37efe6b41e61703.x = Vd561ef7c572f4b3d97bd2641fdc52c75;
V196e267fe81f4442b37efe6b41e61703.y = Vefa65b1cc3ef4e7288d695873bb45a4b;
V196e267fe81f4442b37efe6b41e61703.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 2
Vc60dc527b5514569bb88c610733f56b2.x = Vefa65b1cc3ef4e7288d695873bb45a4b;
Vc60dc527b5514569bb88c610733f56b2.y = Vce99d837f9534d00bebddac0e5cf4165;
Vc60dc527b5514569bb88c610733f56b2.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 4
V00e7b28fce3445ad95a19cb7b449e160.x = Vd561ef7c572f4b3d97bd2641fdc52c75;
V00e7b28fce3445ad95a19cb7b449e160.y = Vce99d837f9534d00bebddac0e5cf4165;
V00e7b28fce3445ad95a19cb7b449e160.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1a
V14652a726dc846b98be0823c58ed8ae2.x = Vefa65b1cc3ef4e7288d695873bb45a4b;
V14652a726dc846b98be0823c58ed8ae2.y = Vefa65b1cc3ef4e7288d695873bb45a4b;
V14652a726dc846b98be0823c58ed8ae2.z = V9b1e9f825bed4921a21822813621d8dc;

// 3a
Va26e91b0d69f4b6aa8f4d4b5717cf1e6.x = Vd561ef7c572f4b3d97bd2641fdc52c75;
Va26e91b0d69f4b6aa8f4d4b5717cf1e6.y = Vefa65b1cc3ef4e7288d695873bb45a4b;
Va26e91b0d69f4b6aa8f4d4b5717cf1e6.z = V9b1e9f825bed4921a21822813621d8dc;

// 2a
V6104be558cec459db79c02f32350d516.x = Vefa65b1cc3ef4e7288d695873bb45a4b;
V6104be558cec459db79c02f32350d516.y = Vce99d837f9534d00bebddac0e5cf4165;
V6104be558cec459db79c02f32350d516.z = V9b1e9f825bed4921a21822813621d8dc;

// 4a
Va8bf6ad02bd64afbb6a4dfd104ed514c.x = Vd561ef7c572f4b3d97bd2641fdc52c75;
Va8bf6ad02bd64afbb6a4dfd104ed514c.y = Vce99d837f9534d00bebddac0e5cf4165;
Va8bf6ad02bd64afbb6a4dfd104ed514c.z = V9b1e9f825bed4921a21822813621d8dc;

// 1
V11a57f5e65284e1f9db6f1fb00f430d7.x = V5271dd54202441918c04767018bf0777;
V11a57f5e65284e1f9db6f1fb00f430d7.y = V32f660ee5fa44f07a431e4aaea6ed252;
V11a57f5e65284e1f9db6f1fb00f430d7.z = Vefa65b1cc3ef4e7288d695873bb45a4b;

// 1
V49bbc422369d437db4194f48b58216bb.x = Vcf564b0919ab40c7975164512065ad97;
V49bbc422369d437db4194f48b58216bb.y = V32f660ee5fa44f07a431e4aaea6ed252;
V49bbc422369d437db4194f48b58216bb.z = Vefa65b1cc3ef4e7288d695873bb45a4b;

// 1
Va771eda590ca41ffa0ef021a88d213b3.x = V5271dd54202441918c04767018bf0777;
Va771eda590ca41ffa0ef021a88d213b3.y = V77687dbac17e46019c75dd0da54b535d;
Va771eda590ca41ffa0ef021a88d213b3.z = Vefa65b1cc3ef4e7288d695873bb45a4b;

// 1
V125400430cb04c1d8aa9b3cce228345c.x = Vcf564b0919ab40c7975164512065ad97;
V125400430cb04c1d8aa9b3cce228345c.y = V77687dbac17e46019c75dd0da54b535d;
V125400430cb04c1d8aa9b3cce228345c.z = Vefa65b1cc3ef4e7288d695873bb45a4b;

// 1
Vbdf3e247f35d43a5a06014e64d499d6f.x = V32f660ee5fa44f07a431e4aaea6ed252;
Vbdf3e247f35d43a5a06014e64d499d6f.y = V32f660ee5fa44f07a431e4aaea6ed252;
Vbdf3e247f35d43a5a06014e64d499d6f.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
Ve32cd5e774054cc7a5180d9a09b96148.x = Vb7aad09a6d6c42d9a44f563ed50049b9;
Ve32cd5e774054cc7a5180d9a09b96148.y = V32f660ee5fa44f07a431e4aaea6ed252;
Ve32cd5e774054cc7a5180d9a09b96148.z = V2f04c77b2dd34c7cacd0ce5a24b6b7a8;

// 1
Vf709c877c6894a16b10ecd508bb5bba7.x = V32f660ee5fa44f07a431e4aaea6ed252;
Vf709c877c6894a16b10ecd508bb5bba7.y = V77687dbac17e46019c75dd0da54b535d;
Vf709c877c6894a16b10ecd508bb5bba7.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
V270a4c58cb98496094883c2d47160c6a.x = Vb7aad09a6d6c42d9a44f563ed50049b9;
V270a4c58cb98496094883c2d47160c6a.y = V77687dbac17e46019c75dd0da54b535d;
V270a4c58cb98496094883c2d47160c6a.z = V2f04c77b2dd34c7cacd0ce5a24b6b7a8;

// 1
V85b5319a1a0b45d98d33b51a2756d3a9.x = V32f660ee5fa44f07a431e4aaea6ed252;
V85b5319a1a0b45d98d33b51a2756d3a9.y = V32f660ee5fa44f07a431e4aaea6ed252;
V85b5319a1a0b45d98d33b51a2756d3a9.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
V7355db863e744f82b234b28fa56ca25c.x = Vb4045d9102104006a637a422ec60d656;
V7355db863e744f82b234b28fa56ca25c.y = V32f660ee5fa44f07a431e4aaea6ed252;
V7355db863e744f82b234b28fa56ca25c.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
V3aab85bee08040f192dcad4307483116.x = V32f660ee5fa44f07a431e4aaea6ed252;
V3aab85bee08040f192dcad4307483116.y = V77687dbac17e46019c75dd0da54b535d;
V3aab85bee08040f192dcad4307483116.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
Ve07fcc41e4d74b01b419bb37daeabd8b.x = Vb4045d9102104006a637a422ec60d656;
Ve07fcc41e4d74b01b419bb37daeabd8b.y = V77687dbac17e46019c75dd0da54b535d;
Ve07fcc41e4d74b01b419bb37daeabd8b.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
Vbca10edbeb614b8fbca7c9c57e8cec53.x = Vb4045d9102104006a637a422ec60d656;
Vbca10edbeb614b8fbca7c9c57e8cec53.y = V32f660ee5fa44f07a431e4aaea6ed252;
Vbca10edbeb614b8fbca7c9c57e8cec53.z = Vdb3e65cf48194f8b8f4d8432f76a58a2;

// 1
Vcbe37d3af26b4d7bbe6744ed7558a113.x = Vb4045d9102104006a637a422ec60d656;
Vcbe37d3af26b4d7bbe6744ed7558a113.y = V77687dbac17e46019c75dd0da54b535d;
Vcbe37d3af26b4d7bbe6744ed7558a113.z = Vdb3e65cf48194f8b8f4d8432f76a58a2;

// 1
V6168df8397d64187b89426c80c9bf8f9.x = V2f6c0c1e3c3f4c64a34ac86da7296049;
V6168df8397d64187b89426c80c9bf8f9.y = V0b71e44254374416abb30f7a796382ce;
V6168df8397d64187b89426c80c9bf8f9.z = Vefa65b1cc3ef4e7288d695873bb45a4b;

// 1
V684593ffc2e942159de5d7441f0b794b.x = Vd0ebe5b02e77477da4c916c26e992fc6;
V684593ffc2e942159de5d7441f0b794b.y = V0b71e44254374416abb30f7a796382ce;
V684593ffc2e942159de5d7441f0b794b.z = Vefa65b1cc3ef4e7288d695873bb45a4b;

// 1
Vf6b02809ae47409689bf6400a65596b9.x = V2f6c0c1e3c3f4c64a34ac86da7296049;
Vf6b02809ae47409689bf6400a65596b9.y = Vab1d9c3a0d7e4186998f50e72479f09c;
Vf6b02809ae47409689bf6400a65596b9.z = Vefa65b1cc3ef4e7288d695873bb45a4b;

// 1
V9d29723ca24142d8abd61f3353d19ffd.x = Vd0ebe5b02e77477da4c916c26e992fc6;
V9d29723ca24142d8abd61f3353d19ffd.y = Vab1d9c3a0d7e4186998f50e72479f09c;
V9d29723ca24142d8abd61f3353d19ffd.z = Vefa65b1cc3ef4e7288d695873bb45a4b;

// 1
Va66ac922fae44a3ea8704dd2c16178a8.x = Vcce959971b494a34837e0d16e4539eee;
Va66ac922fae44a3ea8704dd2c16178a8.y = V0b71e44254374416abb30f7a796382ce;
Va66ac922fae44a3ea8704dd2c16178a8.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
Vff0991b2fced443b82a3bc13006cfd4d.x = Vd75424b6696d498ba5da000696b90c4c;
Vff0991b2fced443b82a3bc13006cfd4d.y = V0b71e44254374416abb30f7a796382ce;
Vff0991b2fced443b82a3bc13006cfd4d.z = Vc45453e84e2d4018adac03cec94f887b;

// 1
Vd3f2078a53e94278bd83b6d13790fe5d.x = Vcce959971b494a34837e0d16e4539eee;
Vd3f2078a53e94278bd83b6d13790fe5d.y = Vab1d9c3a0d7e4186998f50e72479f09c;
Vd3f2078a53e94278bd83b6d13790fe5d.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
V6514c1b0e2604d03ad0279b5597c865a.x = Vd75424b6696d498ba5da000696b90c4c;
V6514c1b0e2604d03ad0279b5597c865a.y = Vab1d9c3a0d7e4186998f50e72479f09c;
V6514c1b0e2604d03ad0279b5597c865a.z = Vc45453e84e2d4018adac03cec94f887b;

// 1
Vb74369ae6d43459e8a47e330ea06a8ee.x = Vcce959971b494a34837e0d16e4539eee;
Vb74369ae6d43459e8a47e330ea06a8ee.y = V0b71e44254374416abb30f7a796382ce;
Vb74369ae6d43459e8a47e330ea06a8ee.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
V2e281849c83741a5a0e2068c7bf974a4.x = V5ddc0834179a4285b4cebf954f998c47;
V2e281849c83741a5a0e2068c7bf974a4.y = V0b71e44254374416abb30f7a796382ce;
V2e281849c83741a5a0e2068c7bf974a4.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
Ve2eacb04186348b1be300d43939bd526.x = Vcce959971b494a34837e0d16e4539eee;
Ve2eacb04186348b1be300d43939bd526.y = Vab1d9c3a0d7e4186998f50e72479f09c;
Ve2eacb04186348b1be300d43939bd526.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
V72c2f49dc5f1476397e2f43ee63859f9.x = V5ddc0834179a4285b4cebf954f998c47;
V72c2f49dc5f1476397e2f43ee63859f9.y = Vab1d9c3a0d7e4186998f50e72479f09c;
V72c2f49dc5f1476397e2f43ee63859f9.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
V7a286a56f71a42d98be0dc1952516898.x = V5ddc0834179a4285b4cebf954f998c47;
V7a286a56f71a42d98be0dc1952516898.y = V0b71e44254374416abb30f7a796382ce;
V7a286a56f71a42d98be0dc1952516898.z = V2a1083a85cf640daa743f76960282e9a;

// 1
Vd8198db11c494583b3c60082928ae545.x = V5ddc0834179a4285b4cebf954f998c47;
Vd8198db11c494583b3c60082928ae545.y = Vab1d9c3a0d7e4186998f50e72479f09c;
Vd8198db11c494583b3c60082928ae545.z = V2a1083a85cf640daa743f76960282e9a;

// 1
V6cb65c617dee4ce8a5946b237feaabb5.x = Vdb7e49f9f132457fa7698f468bcb516b;
V6cb65c617dee4ce8a5946b237feaabb5.y = V32f660ee5fa44f07a431e4aaea6ed252;
V6cb65c617dee4ce8a5946b237feaabb5.z = Vefa65b1cc3ef4e7288d695873bb45a4b;

// 1
V9e09fd7af5104fb9bef5f763bdde6e6d.x = V9660d82d941f4f9aae83f0360f4a754c;
V9e09fd7af5104fb9bef5f763bdde6e6d.y = V32f660ee5fa44f07a431e4aaea6ed252;
V9e09fd7af5104fb9bef5f763bdde6e6d.z = Vefa65b1cc3ef4e7288d695873bb45a4b;

// 1
V0ae547e55d7942aa8722db1969722ad1.x = Vdb7e49f9f132457fa7698f468bcb516b;
V0ae547e55d7942aa8722db1969722ad1.y = V77687dbac17e46019c75dd0da54b535d;
V0ae547e55d7942aa8722db1969722ad1.z = Vefa65b1cc3ef4e7288d695873bb45a4b;

// 1
Vcd01ec819711476b999a04e82f4969e5.x = V9660d82d941f4f9aae83f0360f4a754c;
Vcd01ec819711476b999a04e82f4969e5.y = V77687dbac17e46019c75dd0da54b535d;
Vcd01ec819711476b999a04e82f4969e5.z = Vefa65b1cc3ef4e7288d695873bb45a4b;

// 1
V085eb36104a1478b8655d7174691c768.x = V9474bcdaa2574955964659309a18eaf9;
V085eb36104a1478b8655d7174691c768.y = V32f660ee5fa44f07a431e4aaea6ed252;
V085eb36104a1478b8655d7174691c768.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
V11362de55b5a4ae194258e5670ab6554.x = Vc8b5982649174a81a0572265fd5d5643;
V11362de55b5a4ae194258e5670ab6554.y = V32f660ee5fa44f07a431e4aaea6ed252;
V11362de55b5a4ae194258e5670ab6554.z = V2f04c77b2dd34c7cacd0ce5a24b6b7a8;

// 1
V955a8856a7794698b4b61d8a535feaf9.x = V9474bcdaa2574955964659309a18eaf9;
V955a8856a7794698b4b61d8a535feaf9.y = V77687dbac17e46019c75dd0da54b535d;
V955a8856a7794698b4b61d8a535feaf9.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
V5ca30c64f118485c9e5ff59d1e5e4c54.x = Vc8b5982649174a81a0572265fd5d5643;
V5ca30c64f118485c9e5ff59d1e5e4c54.y = V77687dbac17e46019c75dd0da54b535d;
V5ca30c64f118485c9e5ff59d1e5e4c54.z = V2f04c77b2dd34c7cacd0ce5a24b6b7a8;

// 1
V0022b48b116540f2821b5e5da0abda1e.x = V9474bcdaa2574955964659309a18eaf9;
V0022b48b116540f2821b5e5da0abda1e.y = V32f660ee5fa44f07a431e4aaea6ed252;
V0022b48b116540f2821b5e5da0abda1e.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
V4564eac84a674780acf3400d72733405.x = Vadb018e7702e4e258e801e1f70f9e203;
V4564eac84a674780acf3400d72733405.y = V32f660ee5fa44f07a431e4aaea6ed252;
V4564eac84a674780acf3400d72733405.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
V5042ac61e78d4919a5fa46e24890156a.x = V9474bcdaa2574955964659309a18eaf9;
V5042ac61e78d4919a5fa46e24890156a.y = V77687dbac17e46019c75dd0da54b535d;
V5042ac61e78d4919a5fa46e24890156a.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
V9b25d4af54b04512b7518d102205fafd.x = Vadb018e7702e4e258e801e1f70f9e203;
V9b25d4af54b04512b7518d102205fafd.y = V77687dbac17e46019c75dd0da54b535d;
V9b25d4af54b04512b7518d102205fafd.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
V399c39d5cf7b43a2a601969cbb2eaaac.x = Vadb018e7702e4e258e801e1f70f9e203;
V399c39d5cf7b43a2a601969cbb2eaaac.y = V32f660ee5fa44f07a431e4aaea6ed252;
V399c39d5cf7b43a2a601969cbb2eaaac.z = Vdb3e65cf48194f8b8f4d8432f76a58a2;

// 1
V6dc9c2b3d8304d1ab5f5c698e600624e.x = Vadb018e7702e4e258e801e1f70f9e203;
V6dc9c2b3d8304d1ab5f5c698e600624e.y = V77687dbac17e46019c75dd0da54b535d;
V6dc9c2b3d8304d1ab5f5c698e600624e.z = Vdb3e65cf48194f8b8f4d8432f76a58a2;

// 1
V075bb41dbd1d48648517425f727d0ae6.x = V99e04ddb402b4f769bddf3721427485c;
V075bb41dbd1d48648517425f727d0ae6.y = V1dc29031b9824fb6a15ac915c4158d92;
V075bb41dbd1d48648517425f727d0ae6.z = Vefa65b1cc3ef4e7288d695873bb45a4b;

// 1
V97a762a9e5ba45d19a937bb3f2ac5e0e.x = Vb8e237845614452e9373d0f04606d81d;
V97a762a9e5ba45d19a937bb3f2ac5e0e.y = V1dc29031b9824fb6a15ac915c4158d92;
V97a762a9e5ba45d19a937bb3f2ac5e0e.z = Vefa65b1cc3ef4e7288d695873bb45a4b;

// 1
Vedf1894f21a64f69b3dea0046ed88531.x = V99e04ddb402b4f769bddf3721427485c;
Vedf1894f21a64f69b3dea0046ed88531.y = V838a2d46830c4925ac69a8f5907f296d;
Vedf1894f21a64f69b3dea0046ed88531.z = Vefa65b1cc3ef4e7288d695873bb45a4b;

// 1
V8ae5e4e29fd34f12826d963dc83f07eb.x = Vb8e237845614452e9373d0f04606d81d;
V8ae5e4e29fd34f12826d963dc83f07eb.y = V838a2d46830c4925ac69a8f5907f296d;
V8ae5e4e29fd34f12826d963dc83f07eb.z = Vefa65b1cc3ef4e7288d695873bb45a4b;

// 1
V5b758f7cecb441e68bcdbadf28a9e68e.x = Vd65faa9a5223447285d5e6cedaffb13b;
V5b758f7cecb441e68bcdbadf28a9e68e.y = V1dc29031b9824fb6a15ac915c4158d92;
V5b758f7cecb441e68bcdbadf28a9e68e.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
V194ec4c2fdb641ccae74c27e9b2c4c8e.x = Va4af5942eb9941489488f39f78f61385;
V194ec4c2fdb641ccae74c27e9b2c4c8e.y = V1dc29031b9824fb6a15ac915c4158d92;
V194ec4c2fdb641ccae74c27e9b2c4c8e.z = V2f04c77b2dd34c7cacd0ce5a24b6b7a8;

// 1
V66e32272a0ce47c296dad4db6ec0df4d.x = Vd65faa9a5223447285d5e6cedaffb13b;
V66e32272a0ce47c296dad4db6ec0df4d.y = V838a2d46830c4925ac69a8f5907f296d;
V66e32272a0ce47c296dad4db6ec0df4d.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
Vec26df8c62044640b1724953eec87119.x = Va4af5942eb9941489488f39f78f61385;
Vec26df8c62044640b1724953eec87119.y = V838a2d46830c4925ac69a8f5907f296d;
Vec26df8c62044640b1724953eec87119.z = V2f04c77b2dd34c7cacd0ce5a24b6b7a8;

// 1
Ved6d7556c6554606a3bc1afcdde4685f.x = Vd65faa9a5223447285d5e6cedaffb13b;
Ved6d7556c6554606a3bc1afcdde4685f.y = V1dc29031b9824fb6a15ac915c4158d92;
Ved6d7556c6554606a3bc1afcdde4685f.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
Va26de8d5ee414334a22dad08fddea2f4.x = V31489b2e09eb4aae9af01d654738af4f;
Va26de8d5ee414334a22dad08fddea2f4.y = V1dc29031b9824fb6a15ac915c4158d92;
Va26de8d5ee414334a22dad08fddea2f4.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
Vc03ad6c2b346405bb9eb7f902941697c.x = Vd65faa9a5223447285d5e6cedaffb13b;
Vc03ad6c2b346405bb9eb7f902941697c.y = V838a2d46830c4925ac69a8f5907f296d;
Vc03ad6c2b346405bb9eb7f902941697c.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
V0a226085c4a245b392573a32b154d0db.x = V31489b2e09eb4aae9af01d654738af4f;
V0a226085c4a245b392573a32b154d0db.y = V838a2d46830c4925ac69a8f5907f296d;
V0a226085c4a245b392573a32b154d0db.z = V18ac801bf5a84bcb8a5c1424783466b2;

// 1
Ve8e1a5b6178549cba3af1aeb56900ea6.x = V31489b2e09eb4aae9af01d654738af4f;
Ve8e1a5b6178549cba3af1aeb56900ea6.y = V1dc29031b9824fb6a15ac915c4158d92;
Ve8e1a5b6178549cba3af1aeb56900ea6.z = Vdb3e65cf48194f8b8f4d8432f76a58a2;

// 1
Ved6582829407478a93099ea2b36c661f.x = V31489b2e09eb4aae9af01d654738af4f;
Ved6582829407478a93099ea2b36c661f.y = V838a2d46830c4925ac69a8f5907f296d;
Ved6582829407478a93099ea2b36c661f.z = Vdb3e65cf48194f8b8f4d8432f76a58a2;

//add surface objects
// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.x,Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.y,Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.z);
vertex(Vc60dc527b5514569bb88c610733f56b2.x,Vc60dc527b5514569bb88c610733f56b2.y,Vc60dc527b5514569bb88c610733f56b2.z);
vertex(V00e7b28fce3445ad95a19cb7b449e160.x,V00e7b28fce3445ad95a19cb7b449e160.y,V00e7b28fce3445ad95a19cb7b449e160.z);
vertex(V196e267fe81f4442b37efe6b41e61703.x,V196e267fe81f4442b37efe6b41e61703.y,V196e267fe81f4442b37efe6b41e61703.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V14652a726dc846b98be0823c58ed8ae2.x,V14652a726dc846b98be0823c58ed8ae2.y,V14652a726dc846b98be0823c58ed8ae2.z);
vertex(V6104be558cec459db79c02f32350d516.x,V6104be558cec459db79c02f32350d516.y,V6104be558cec459db79c02f32350d516.z);
vertex(Va8bf6ad02bd64afbb6a4dfd104ed514c.x,Va8bf6ad02bd64afbb6a4dfd104ed514c.y,Va8bf6ad02bd64afbb6a4dfd104ed514c.z);
vertex(Va26e91b0d69f4b6aa8f4d4b5717cf1e6.x,Va26e91b0d69f4b6aa8f4d4b5717cf1e6.y,Va26e91b0d69f4b6aa8f4d4b5717cf1e6.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.x,Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.y,Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.z);
vertex(Vc60dc527b5514569bb88c610733f56b2.x,Vc60dc527b5514569bb88c610733f56b2.y,Vc60dc527b5514569bb88c610733f56b2.z);
vertex(V6104be558cec459db79c02f32350d516.x,V6104be558cec459db79c02f32350d516.y,V6104be558cec459db79c02f32350d516.z);
vertex(V14652a726dc846b98be0823c58ed8ae2.x,V14652a726dc846b98be0823c58ed8ae2.y,V14652a726dc846b98be0823c58ed8ae2.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V00e7b28fce3445ad95a19cb7b449e160.x,V00e7b28fce3445ad95a19cb7b449e160.y,V00e7b28fce3445ad95a19cb7b449e160.z);
vertex(V196e267fe81f4442b37efe6b41e61703.x,V196e267fe81f4442b37efe6b41e61703.y,V196e267fe81f4442b37efe6b41e61703.z);
vertex(Va26e91b0d69f4b6aa8f4d4b5717cf1e6.x,Va26e91b0d69f4b6aa8f4d4b5717cf1e6.y,Va26e91b0d69f4b6aa8f4d4b5717cf1e6.z);
vertex(Va8bf6ad02bd64afbb6a4dfd104ed514c.x,Va8bf6ad02bd64afbb6a4dfd104ed514c.y,Va8bf6ad02bd64afbb6a4dfd104ed514c.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(Vc60dc527b5514569bb88c610733f56b2.x,Vc60dc527b5514569bb88c610733f56b2.y,Vc60dc527b5514569bb88c610733f56b2.z);
vertex(V00e7b28fce3445ad95a19cb7b449e160.x,V00e7b28fce3445ad95a19cb7b449e160.y,V00e7b28fce3445ad95a19cb7b449e160.z);
vertex(Va8bf6ad02bd64afbb6a4dfd104ed514c.x,Va8bf6ad02bd64afbb6a4dfd104ed514c.y,Va8bf6ad02bd64afbb6a4dfd104ed514c.z);
vertex(V6104be558cec459db79c02f32350d516.x,V6104be558cec459db79c02f32350d516.y,V6104be558cec459db79c02f32350d516.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.x,Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.y,Vc4e49b7f6d6e4840a7ef93ecdb05d7b1.z);
vertex(V196e267fe81f4442b37efe6b41e61703.x,V196e267fe81f4442b37efe6b41e61703.y,V196e267fe81f4442b37efe6b41e61703.z);
vertex(Va26e91b0d69f4b6aa8f4d4b5717cf1e6.x,Va26e91b0d69f4b6aa8f4d4b5717cf1e6.y,Va26e91b0d69f4b6aa8f4d4b5717cf1e6.z);
vertex(V14652a726dc846b98be0823c58ed8ae2.x,V14652a726dc846b98be0823c58ed8ae2.y,V14652a726dc846b98be0823c58ed8ae2.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V11a57f5e65284e1f9db6f1fb00f430d7.x,V11a57f5e65284e1f9db6f1fb00f430d7.y,V11a57f5e65284e1f9db6f1fb00f430d7.z);
vertex(V49bbc422369d437db4194f48b58216bb.x,V49bbc422369d437db4194f48b58216bb.y,V49bbc422369d437db4194f48b58216bb.z);
vertex(V125400430cb04c1d8aa9b3cce228345c.x,V125400430cb04c1d8aa9b3cce228345c.y,V125400430cb04c1d8aa9b3cce228345c.z);
vertex(Va771eda590ca41ffa0ef021a88d213b3.x,Va771eda590ca41ffa0ef021a88d213b3.y,Va771eda590ca41ffa0ef021a88d213b3.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V11a57f5e65284e1f9db6f1fb00f430d7.x,V11a57f5e65284e1f9db6f1fb00f430d7.y,V11a57f5e65284e1f9db6f1fb00f430d7.z);
vertex(V49bbc422369d437db4194f48b58216bb.x,V49bbc422369d437db4194f48b58216bb.y,V49bbc422369d437db4194f48b58216bb.z);
vertex(Ve32cd5e774054cc7a5180d9a09b96148.x,Ve32cd5e774054cc7a5180d9a09b96148.y,Ve32cd5e774054cc7a5180d9a09b96148.z);
vertex(Vbdf3e247f35d43a5a06014e64d499d6f.x,Vbdf3e247f35d43a5a06014e64d499d6f.y,Vbdf3e247f35d43a5a06014e64d499d6f.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V125400430cb04c1d8aa9b3cce228345c.x,V125400430cb04c1d8aa9b3cce228345c.y,V125400430cb04c1d8aa9b3cce228345c.z);
vertex(Va771eda590ca41ffa0ef021a88d213b3.x,Va771eda590ca41ffa0ef021a88d213b3.y,Va771eda590ca41ffa0ef021a88d213b3.z);
vertex(Vf709c877c6894a16b10ecd508bb5bba7.x,Vf709c877c6894a16b10ecd508bb5bba7.y,Vf709c877c6894a16b10ecd508bb5bba7.z);
vertex(V270a4c58cb98496094883c2d47160c6a.x,V270a4c58cb98496094883c2d47160c6a.y,V270a4c58cb98496094883c2d47160c6a.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V49bbc422369d437db4194f48b58216bb.x,V49bbc422369d437db4194f48b58216bb.y,V49bbc422369d437db4194f48b58216bb.z);
vertex(V125400430cb04c1d8aa9b3cce228345c.x,V125400430cb04c1d8aa9b3cce228345c.y,V125400430cb04c1d8aa9b3cce228345c.z);
vertex(V270a4c58cb98496094883c2d47160c6a.x,V270a4c58cb98496094883c2d47160c6a.y,V270a4c58cb98496094883c2d47160c6a.z);
vertex(Ve32cd5e774054cc7a5180d9a09b96148.x,Ve32cd5e774054cc7a5180d9a09b96148.y,Ve32cd5e774054cc7a5180d9a09b96148.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V11a57f5e65284e1f9db6f1fb00f430d7.x,V11a57f5e65284e1f9db6f1fb00f430d7.y,V11a57f5e65284e1f9db6f1fb00f430d7.z);
vertex(Va771eda590ca41ffa0ef021a88d213b3.x,Va771eda590ca41ffa0ef021a88d213b3.y,Va771eda590ca41ffa0ef021a88d213b3.z);
vertex(Vf709c877c6894a16b10ecd508bb5bba7.x,Vf709c877c6894a16b10ecd508bb5bba7.y,Vf709c877c6894a16b10ecd508bb5bba7.z);
vertex(Vbdf3e247f35d43a5a06014e64d499d6f.x,Vbdf3e247f35d43a5a06014e64d499d6f.y,Vbdf3e247f35d43a5a06014e64d499d6f.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V85b5319a1a0b45d98d33b51a2756d3a9.x,V85b5319a1a0b45d98d33b51a2756d3a9.y,V85b5319a1a0b45d98d33b51a2756d3a9.z);
vertex(V7355db863e744f82b234b28fa56ca25c.x,V7355db863e744f82b234b28fa56ca25c.y,V7355db863e744f82b234b28fa56ca25c.z);
vertex(Vbca10edbeb614b8fbca7c9c57e8cec53.x,Vbca10edbeb614b8fbca7c9c57e8cec53.y,Vbca10edbeb614b8fbca7c9c57e8cec53.z);
vertex(Ve32cd5e774054cc7a5180d9a09b96148.x,Ve32cd5e774054cc7a5180d9a09b96148.y,Ve32cd5e774054cc7a5180d9a09b96148.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(Ve07fcc41e4d74b01b419bb37daeabd8b.x,Ve07fcc41e4d74b01b419bb37daeabd8b.y,Ve07fcc41e4d74b01b419bb37daeabd8b.z);
vertex(V3aab85bee08040f192dcad4307483116.x,V3aab85bee08040f192dcad4307483116.y,V3aab85bee08040f192dcad4307483116.z);
vertex(V270a4c58cb98496094883c2d47160c6a.x,V270a4c58cb98496094883c2d47160c6a.y,V270a4c58cb98496094883c2d47160c6a.z);
vertex(Vcbe37d3af26b4d7bbe6744ed7558a113.x,Vcbe37d3af26b4d7bbe6744ed7558a113.y,Vcbe37d3af26b4d7bbe6744ed7558a113.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(Vcbe37d3af26b4d7bbe6744ed7558a113.x,Vcbe37d3af26b4d7bbe6744ed7558a113.y,Vcbe37d3af26b4d7bbe6744ed7558a113.z);
vertex(Vbca10edbeb614b8fbca7c9c57e8cec53.x,Vbca10edbeb614b8fbca7c9c57e8cec53.y,Vbca10edbeb614b8fbca7c9c57e8cec53.z);
vertex(Ve32cd5e774054cc7a5180d9a09b96148.x,Ve32cd5e774054cc7a5180d9a09b96148.y,Ve32cd5e774054cc7a5180d9a09b96148.z);
vertex(V270a4c58cb98496094883c2d47160c6a.x,V270a4c58cb98496094883c2d47160c6a.y,V270a4c58cb98496094883c2d47160c6a.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(Vcbe37d3af26b4d7bbe6744ed7558a113.x,Vcbe37d3af26b4d7bbe6744ed7558a113.y,Vcbe37d3af26b4d7bbe6744ed7558a113.z);
vertex(Vbca10edbeb614b8fbca7c9c57e8cec53.x,Vbca10edbeb614b8fbca7c9c57e8cec53.y,Vbca10edbeb614b8fbca7c9c57e8cec53.z);
vertex(V7355db863e744f82b234b28fa56ca25c.x,V7355db863e744f82b234b28fa56ca25c.y,V7355db863e744f82b234b28fa56ca25c.z);
vertex(Ve07fcc41e4d74b01b419bb37daeabd8b.x,Ve07fcc41e4d74b01b419bb37daeabd8b.y,Ve07fcc41e4d74b01b419bb37daeabd8b.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V6168df8397d64187b89426c80c9bf8f9.x,V6168df8397d64187b89426c80c9bf8f9.y,V6168df8397d64187b89426c80c9bf8f9.z);
vertex(V684593ffc2e942159de5d7441f0b794b.x,V684593ffc2e942159de5d7441f0b794b.y,V684593ffc2e942159de5d7441f0b794b.z);
vertex(V9d29723ca24142d8abd61f3353d19ffd.x,V9d29723ca24142d8abd61f3353d19ffd.y,V9d29723ca24142d8abd61f3353d19ffd.z);
vertex(Vf6b02809ae47409689bf6400a65596b9.x,Vf6b02809ae47409689bf6400a65596b9.y,Vf6b02809ae47409689bf6400a65596b9.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V6168df8397d64187b89426c80c9bf8f9.x,V6168df8397d64187b89426c80c9bf8f9.y,V6168df8397d64187b89426c80c9bf8f9.z);
vertex(V684593ffc2e942159de5d7441f0b794b.x,V684593ffc2e942159de5d7441f0b794b.y,V684593ffc2e942159de5d7441f0b794b.z);
vertex(Vff0991b2fced443b82a3bc13006cfd4d.x,Vff0991b2fced443b82a3bc13006cfd4d.y,Vff0991b2fced443b82a3bc13006cfd4d.z);
vertex(Va66ac922fae44a3ea8704dd2c16178a8.x,Va66ac922fae44a3ea8704dd2c16178a8.y,Va66ac922fae44a3ea8704dd2c16178a8.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V9d29723ca24142d8abd61f3353d19ffd.x,V9d29723ca24142d8abd61f3353d19ffd.y,V9d29723ca24142d8abd61f3353d19ffd.z);
vertex(Vf6b02809ae47409689bf6400a65596b9.x,Vf6b02809ae47409689bf6400a65596b9.y,Vf6b02809ae47409689bf6400a65596b9.z);
vertex(Vd3f2078a53e94278bd83b6d13790fe5d.x,Vd3f2078a53e94278bd83b6d13790fe5d.y,Vd3f2078a53e94278bd83b6d13790fe5d.z);
vertex(V6514c1b0e2604d03ad0279b5597c865a.x,V6514c1b0e2604d03ad0279b5597c865a.y,V6514c1b0e2604d03ad0279b5597c865a.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V684593ffc2e942159de5d7441f0b794b.x,V684593ffc2e942159de5d7441f0b794b.y,V684593ffc2e942159de5d7441f0b794b.z);
vertex(V9d29723ca24142d8abd61f3353d19ffd.x,V9d29723ca24142d8abd61f3353d19ffd.y,V9d29723ca24142d8abd61f3353d19ffd.z);
vertex(V6514c1b0e2604d03ad0279b5597c865a.x,V6514c1b0e2604d03ad0279b5597c865a.y,V6514c1b0e2604d03ad0279b5597c865a.z);
vertex(Vff0991b2fced443b82a3bc13006cfd4d.x,Vff0991b2fced443b82a3bc13006cfd4d.y,Vff0991b2fced443b82a3bc13006cfd4d.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V6168df8397d64187b89426c80c9bf8f9.x,V6168df8397d64187b89426c80c9bf8f9.y,V6168df8397d64187b89426c80c9bf8f9.z);
vertex(Vf6b02809ae47409689bf6400a65596b9.x,Vf6b02809ae47409689bf6400a65596b9.y,Vf6b02809ae47409689bf6400a65596b9.z);
vertex(Vd3f2078a53e94278bd83b6d13790fe5d.x,Vd3f2078a53e94278bd83b6d13790fe5d.y,Vd3f2078a53e94278bd83b6d13790fe5d.z);
vertex(Va66ac922fae44a3ea8704dd2c16178a8.x,Va66ac922fae44a3ea8704dd2c16178a8.y,Va66ac922fae44a3ea8704dd2c16178a8.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(Vb74369ae6d43459e8a47e330ea06a8ee.x,Vb74369ae6d43459e8a47e330ea06a8ee.y,Vb74369ae6d43459e8a47e330ea06a8ee.z);
vertex(V2e281849c83741a5a0e2068c7bf974a4.x,V2e281849c83741a5a0e2068c7bf974a4.y,V2e281849c83741a5a0e2068c7bf974a4.z);
vertex(V7a286a56f71a42d98be0dc1952516898.x,V7a286a56f71a42d98be0dc1952516898.y,V7a286a56f71a42d98be0dc1952516898.z);
vertex(Vff0991b2fced443b82a3bc13006cfd4d.x,Vff0991b2fced443b82a3bc13006cfd4d.y,Vff0991b2fced443b82a3bc13006cfd4d.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V72c2f49dc5f1476397e2f43ee63859f9.x,V72c2f49dc5f1476397e2f43ee63859f9.y,V72c2f49dc5f1476397e2f43ee63859f9.z);
vertex(Ve2eacb04186348b1be300d43939bd526.x,Ve2eacb04186348b1be300d43939bd526.y,Ve2eacb04186348b1be300d43939bd526.z);
vertex(V6514c1b0e2604d03ad0279b5597c865a.x,V6514c1b0e2604d03ad0279b5597c865a.y,V6514c1b0e2604d03ad0279b5597c865a.z);
vertex(Vd8198db11c494583b3c60082928ae545.x,Vd8198db11c494583b3c60082928ae545.y,Vd8198db11c494583b3c60082928ae545.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(Vd8198db11c494583b3c60082928ae545.x,Vd8198db11c494583b3c60082928ae545.y,Vd8198db11c494583b3c60082928ae545.z);
vertex(V7a286a56f71a42d98be0dc1952516898.x,V7a286a56f71a42d98be0dc1952516898.y,V7a286a56f71a42d98be0dc1952516898.z);
vertex(Vff0991b2fced443b82a3bc13006cfd4d.x,Vff0991b2fced443b82a3bc13006cfd4d.y,Vff0991b2fced443b82a3bc13006cfd4d.z);
vertex(V6514c1b0e2604d03ad0279b5597c865a.x,V6514c1b0e2604d03ad0279b5597c865a.y,V6514c1b0e2604d03ad0279b5597c865a.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(Vd8198db11c494583b3c60082928ae545.x,Vd8198db11c494583b3c60082928ae545.y,Vd8198db11c494583b3c60082928ae545.z);
vertex(V7a286a56f71a42d98be0dc1952516898.x,V7a286a56f71a42d98be0dc1952516898.y,V7a286a56f71a42d98be0dc1952516898.z);
vertex(V2e281849c83741a5a0e2068c7bf974a4.x,V2e281849c83741a5a0e2068c7bf974a4.y,V2e281849c83741a5a0e2068c7bf974a4.z);
vertex(V72c2f49dc5f1476397e2f43ee63859f9.x,V72c2f49dc5f1476397e2f43ee63859f9.y,V72c2f49dc5f1476397e2f43ee63859f9.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V6cb65c617dee4ce8a5946b237feaabb5.x,V6cb65c617dee4ce8a5946b237feaabb5.y,V6cb65c617dee4ce8a5946b237feaabb5.z);
vertex(V9e09fd7af5104fb9bef5f763bdde6e6d.x,V9e09fd7af5104fb9bef5f763bdde6e6d.y,V9e09fd7af5104fb9bef5f763bdde6e6d.z);
vertex(Vcd01ec819711476b999a04e82f4969e5.x,Vcd01ec819711476b999a04e82f4969e5.y,Vcd01ec819711476b999a04e82f4969e5.z);
vertex(V0ae547e55d7942aa8722db1969722ad1.x,V0ae547e55d7942aa8722db1969722ad1.y,V0ae547e55d7942aa8722db1969722ad1.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V6cb65c617dee4ce8a5946b237feaabb5.x,V6cb65c617dee4ce8a5946b237feaabb5.y,V6cb65c617dee4ce8a5946b237feaabb5.z);
vertex(V9e09fd7af5104fb9bef5f763bdde6e6d.x,V9e09fd7af5104fb9bef5f763bdde6e6d.y,V9e09fd7af5104fb9bef5f763bdde6e6d.z);
vertex(V11362de55b5a4ae194258e5670ab6554.x,V11362de55b5a4ae194258e5670ab6554.y,V11362de55b5a4ae194258e5670ab6554.z);
vertex(V085eb36104a1478b8655d7174691c768.x,V085eb36104a1478b8655d7174691c768.y,V085eb36104a1478b8655d7174691c768.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(Vcd01ec819711476b999a04e82f4969e5.x,Vcd01ec819711476b999a04e82f4969e5.y,Vcd01ec819711476b999a04e82f4969e5.z);
vertex(V0ae547e55d7942aa8722db1969722ad1.x,V0ae547e55d7942aa8722db1969722ad1.y,V0ae547e55d7942aa8722db1969722ad1.z);
vertex(V955a8856a7794698b4b61d8a535feaf9.x,V955a8856a7794698b4b61d8a535feaf9.y,V955a8856a7794698b4b61d8a535feaf9.z);
vertex(V5ca30c64f118485c9e5ff59d1e5e4c54.x,V5ca30c64f118485c9e5ff59d1e5e4c54.y,V5ca30c64f118485c9e5ff59d1e5e4c54.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V9e09fd7af5104fb9bef5f763bdde6e6d.x,V9e09fd7af5104fb9bef5f763bdde6e6d.y,V9e09fd7af5104fb9bef5f763bdde6e6d.z);
vertex(Vcd01ec819711476b999a04e82f4969e5.x,Vcd01ec819711476b999a04e82f4969e5.y,Vcd01ec819711476b999a04e82f4969e5.z);
vertex(V5ca30c64f118485c9e5ff59d1e5e4c54.x,V5ca30c64f118485c9e5ff59d1e5e4c54.y,V5ca30c64f118485c9e5ff59d1e5e4c54.z);
vertex(V11362de55b5a4ae194258e5670ab6554.x,V11362de55b5a4ae194258e5670ab6554.y,V11362de55b5a4ae194258e5670ab6554.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V6cb65c617dee4ce8a5946b237feaabb5.x,V6cb65c617dee4ce8a5946b237feaabb5.y,V6cb65c617dee4ce8a5946b237feaabb5.z);
vertex(V0ae547e55d7942aa8722db1969722ad1.x,V0ae547e55d7942aa8722db1969722ad1.y,V0ae547e55d7942aa8722db1969722ad1.z);
vertex(V955a8856a7794698b4b61d8a535feaf9.x,V955a8856a7794698b4b61d8a535feaf9.y,V955a8856a7794698b4b61d8a535feaf9.z);
vertex(V085eb36104a1478b8655d7174691c768.x,V085eb36104a1478b8655d7174691c768.y,V085eb36104a1478b8655d7174691c768.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V0022b48b116540f2821b5e5da0abda1e.x,V0022b48b116540f2821b5e5da0abda1e.y,V0022b48b116540f2821b5e5da0abda1e.z);
vertex(V4564eac84a674780acf3400d72733405.x,V4564eac84a674780acf3400d72733405.y,V4564eac84a674780acf3400d72733405.z);
vertex(V399c39d5cf7b43a2a601969cbb2eaaac.x,V399c39d5cf7b43a2a601969cbb2eaaac.y,V399c39d5cf7b43a2a601969cbb2eaaac.z);
vertex(V11362de55b5a4ae194258e5670ab6554.x,V11362de55b5a4ae194258e5670ab6554.y,V11362de55b5a4ae194258e5670ab6554.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V9b25d4af54b04512b7518d102205fafd.x,V9b25d4af54b04512b7518d102205fafd.y,V9b25d4af54b04512b7518d102205fafd.z);
vertex(V5042ac61e78d4919a5fa46e24890156a.x,V5042ac61e78d4919a5fa46e24890156a.y,V5042ac61e78d4919a5fa46e24890156a.z);
vertex(V5ca30c64f118485c9e5ff59d1e5e4c54.x,V5ca30c64f118485c9e5ff59d1e5e4c54.y,V5ca30c64f118485c9e5ff59d1e5e4c54.z);
vertex(V6dc9c2b3d8304d1ab5f5c698e600624e.x,V6dc9c2b3d8304d1ab5f5c698e600624e.y,V6dc9c2b3d8304d1ab5f5c698e600624e.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V6dc9c2b3d8304d1ab5f5c698e600624e.x,V6dc9c2b3d8304d1ab5f5c698e600624e.y,V6dc9c2b3d8304d1ab5f5c698e600624e.z);
vertex(V399c39d5cf7b43a2a601969cbb2eaaac.x,V399c39d5cf7b43a2a601969cbb2eaaac.y,V399c39d5cf7b43a2a601969cbb2eaaac.z);
vertex(V11362de55b5a4ae194258e5670ab6554.x,V11362de55b5a4ae194258e5670ab6554.y,V11362de55b5a4ae194258e5670ab6554.z);
vertex(V5ca30c64f118485c9e5ff59d1e5e4c54.x,V5ca30c64f118485c9e5ff59d1e5e4c54.y,V5ca30c64f118485c9e5ff59d1e5e4c54.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V6dc9c2b3d8304d1ab5f5c698e600624e.x,V6dc9c2b3d8304d1ab5f5c698e600624e.y,V6dc9c2b3d8304d1ab5f5c698e600624e.z);
vertex(V399c39d5cf7b43a2a601969cbb2eaaac.x,V399c39d5cf7b43a2a601969cbb2eaaac.y,V399c39d5cf7b43a2a601969cbb2eaaac.z);
vertex(V4564eac84a674780acf3400d72733405.x,V4564eac84a674780acf3400d72733405.y,V4564eac84a674780acf3400d72733405.z);
vertex(V9b25d4af54b04512b7518d102205fafd.x,V9b25d4af54b04512b7518d102205fafd.y,V9b25d4af54b04512b7518d102205fafd.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V075bb41dbd1d48648517425f727d0ae6.x,V075bb41dbd1d48648517425f727d0ae6.y,V075bb41dbd1d48648517425f727d0ae6.z);
vertex(V97a762a9e5ba45d19a937bb3f2ac5e0e.x,V97a762a9e5ba45d19a937bb3f2ac5e0e.y,V97a762a9e5ba45d19a937bb3f2ac5e0e.z);
vertex(V8ae5e4e29fd34f12826d963dc83f07eb.x,V8ae5e4e29fd34f12826d963dc83f07eb.y,V8ae5e4e29fd34f12826d963dc83f07eb.z);
vertex(Vedf1894f21a64f69b3dea0046ed88531.x,Vedf1894f21a64f69b3dea0046ed88531.y,Vedf1894f21a64f69b3dea0046ed88531.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V075bb41dbd1d48648517425f727d0ae6.x,V075bb41dbd1d48648517425f727d0ae6.y,V075bb41dbd1d48648517425f727d0ae6.z);
vertex(V97a762a9e5ba45d19a937bb3f2ac5e0e.x,V97a762a9e5ba45d19a937bb3f2ac5e0e.y,V97a762a9e5ba45d19a937bb3f2ac5e0e.z);
vertex(V194ec4c2fdb641ccae74c27e9b2c4c8e.x,V194ec4c2fdb641ccae74c27e9b2c4c8e.y,V194ec4c2fdb641ccae74c27e9b2c4c8e.z);
vertex(V5b758f7cecb441e68bcdbadf28a9e68e.x,V5b758f7cecb441e68bcdbadf28a9e68e.y,V5b758f7cecb441e68bcdbadf28a9e68e.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V8ae5e4e29fd34f12826d963dc83f07eb.x,V8ae5e4e29fd34f12826d963dc83f07eb.y,V8ae5e4e29fd34f12826d963dc83f07eb.z);
vertex(Vedf1894f21a64f69b3dea0046ed88531.x,Vedf1894f21a64f69b3dea0046ed88531.y,Vedf1894f21a64f69b3dea0046ed88531.z);
vertex(V66e32272a0ce47c296dad4db6ec0df4d.x,V66e32272a0ce47c296dad4db6ec0df4d.y,V66e32272a0ce47c296dad4db6ec0df4d.z);
vertex(Vec26df8c62044640b1724953eec87119.x,Vec26df8c62044640b1724953eec87119.y,Vec26df8c62044640b1724953eec87119.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V97a762a9e5ba45d19a937bb3f2ac5e0e.x,V97a762a9e5ba45d19a937bb3f2ac5e0e.y,V97a762a9e5ba45d19a937bb3f2ac5e0e.z);
vertex(V8ae5e4e29fd34f12826d963dc83f07eb.x,V8ae5e4e29fd34f12826d963dc83f07eb.y,V8ae5e4e29fd34f12826d963dc83f07eb.z);
vertex(Vec26df8c62044640b1724953eec87119.x,Vec26df8c62044640b1724953eec87119.y,Vec26df8c62044640b1724953eec87119.z);
vertex(V194ec4c2fdb641ccae74c27e9b2c4c8e.x,V194ec4c2fdb641ccae74c27e9b2c4c8e.y,V194ec4c2fdb641ccae74c27e9b2c4c8e.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V075bb41dbd1d48648517425f727d0ae6.x,V075bb41dbd1d48648517425f727d0ae6.y,V075bb41dbd1d48648517425f727d0ae6.z);
vertex(Vedf1894f21a64f69b3dea0046ed88531.x,Vedf1894f21a64f69b3dea0046ed88531.y,Vedf1894f21a64f69b3dea0046ed88531.z);
vertex(V66e32272a0ce47c296dad4db6ec0df4d.x,V66e32272a0ce47c296dad4db6ec0df4d.y,V66e32272a0ce47c296dad4db6ec0df4d.z);
vertex(V5b758f7cecb441e68bcdbadf28a9e68e.x,V5b758f7cecb441e68bcdbadf28a9e68e.y,V5b758f7cecb441e68bcdbadf28a9e68e.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(Ved6d7556c6554606a3bc1afcdde4685f.x,Ved6d7556c6554606a3bc1afcdde4685f.y,Ved6d7556c6554606a3bc1afcdde4685f.z);
vertex(Va26de8d5ee414334a22dad08fddea2f4.x,Va26de8d5ee414334a22dad08fddea2f4.y,Va26de8d5ee414334a22dad08fddea2f4.z);
vertex(Ve8e1a5b6178549cba3af1aeb56900ea6.x,Ve8e1a5b6178549cba3af1aeb56900ea6.y,Ve8e1a5b6178549cba3af1aeb56900ea6.z);
vertex(V194ec4c2fdb641ccae74c27e9b2c4c8e.x,V194ec4c2fdb641ccae74c27e9b2c4c8e.y,V194ec4c2fdb641ccae74c27e9b2c4c8e.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(V0a226085c4a245b392573a32b154d0db.x,V0a226085c4a245b392573a32b154d0db.y,V0a226085c4a245b392573a32b154d0db.z);
vertex(Vc03ad6c2b346405bb9eb7f902941697c.x,Vc03ad6c2b346405bb9eb7f902941697c.y,Vc03ad6c2b346405bb9eb7f902941697c.z);
vertex(Vec26df8c62044640b1724953eec87119.x,Vec26df8c62044640b1724953eec87119.y,Vec26df8c62044640b1724953eec87119.z);
vertex(Ved6582829407478a93099ea2b36c661f.x,Ved6582829407478a93099ea2b36c661f.y,Ved6582829407478a93099ea2b36c661f.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(Ved6582829407478a93099ea2b36c661f.x,Ved6582829407478a93099ea2b36c661f.y,Ved6582829407478a93099ea2b36c661f.z);
vertex(Ve8e1a5b6178549cba3af1aeb56900ea6.x,Ve8e1a5b6178549cba3af1aeb56900ea6.y,Ve8e1a5b6178549cba3af1aeb56900ea6.z);
vertex(V194ec4c2fdb641ccae74c27e9b2c4c8e.x,V194ec4c2fdb641ccae74c27e9b2c4c8e.y,V194ec4c2fdb641ccae74c27e9b2c4c8e.z);
vertex(Vec26df8c62044640b1724953eec87119.x,Vec26df8c62044640b1724953eec87119.y,Vec26df8c62044640b1724953eec87119.z);
endShape();

// Srf4Pt
strokeWeight(.25);
beginShape();
vertex(Ved6582829407478a93099ea2b36c661f.x,Ved6582829407478a93099ea2b36c661f.y,Ved6582829407478a93099ea2b36c661f.z);
vertex(Ve8e1a5b6178549cba3af1aeb56900ea6.x,Ve8e1a5b6178549cba3af1aeb56900ea6.y,Ve8e1a5b6178549cba3af1aeb56900ea6.z);
vertex(Va26de8d5ee414334a22dad08fddea2f4.x,Va26de8d5ee414334a22dad08fddea2f4.y,Va26de8d5ee414334a22dad08fddea2f4.z);
vertex(V0a226085c4a245b392573a32b154d0db.x,V0a226085c4a245b392573a32b154d0db.y,V0a226085c4a245b392573a32b154d0db.z);
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

