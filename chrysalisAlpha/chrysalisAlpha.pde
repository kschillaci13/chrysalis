//Chrysalis proof of concept - March 2012 - Chris Chalmers 
//This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.
//http://creativecommons.org - http:fabripod.com/chrysalis
//incorporates content from the following sources:
//1) "saveData.pde" - Marius Watz - http://workshop.evolutionzone.com

//Description:
//this proof of concept reads a grasshopper 'ghx' file* and outputs a processing sketch with the same 
//associative functionality. For the moment, only supports sliders, points, panels, math functionsand 4point surfaces. *Much* more in the works!
//This has ben tested using Processing 1.5.1 and grasshopper build 0.8.0066 Jan 2012 on WindowsXP no guarantee of results with other systems 
//****IMPORTANT:
// 1) - First open the 'ghx'file in 'notepad' and save-as with ANSI encoding selected! Processing will not read default UTF8
// 2) - make sure there are no spaces or hyphens in ghx flename - also cannot begin with a number

////////////////////////////COMMENT FORMAT////////////////////////////////////

////////MAJOR HEADING////////
//++++++Minor heading+++++++
//----section divider---------
//comment

//import libraries
import proxml.*;

//initialize global variables
Data data;
String ghName = "ghTest.ghx";
String tempString, tempGUID, tempX, tempY, tempZ;
float tempValue;
proxml.XMLElement file = new proxml.XMLElement("root");
XMLInOut xmlIO; 

//////////////////////////SET THESE OPTIONS AS NEEDED/////////////////////////////////////
int W = 600; //sketch width
int H = 600; //sketch height
float sliderHeight = 10; //height of slider objects
boolean gridYN = true;
boolean pointsVisible = true;

void setup() {
  data=new Data();
  xmlIO = new XMLInOut(this);
  xmlIO.loadElement(ghName);
}

//PART ONE/////////////// PARSE XML INTO COMPONENTS ARRAY //////////////////////////
ArrayList<List> masterArray = new ArrayList();

//navigate to definition objects chunk of XML

void xmlEvent(proxml.XMLElement element) {
  proxml.XMLElement[] step1 = element.getChildren();
  //println(step1);
  proxml.XMLElement[] step2 = step1[1].getChildren();
  //println(step2);   
  proxml.XMLElement[] step3 = step2[0].getChildren();
  //println(step3);
  proxml.XMLElement[] step4 = step3[1].getChildren();
  //println(step4);
  proxml.XMLElement[] step5 = step4[2].getChildren();
  //println(step5);
  proxml.XMLElement[] step6 = step5[1].getChildren();
  //println(step6[0]);
  int DefinitionObjects = step5[1].countChildren();
  //println(n);

  //++++++++++++++++step through definition objects+++++++++++++++++

  for (int i = 0; i < DefinitionObjects; i = i+1) {
    println("DefinitionObjects_" + i);

    //navigate to 'identifiers' section of definition object 
    proxml.XMLElement[] step7 = step6[i].getChildren();
    //println(step7);
    proxml.XMLElement[] step8 = step7[0].getChildren();
    //println(step8);
    proxml.XMLElement[] step9 = step7[1].getChildren();
    //println(step9);
    proxml.XMLElement[] step10 = step9[0].getChildren();
    //println(step10);
    proxml.XMLElement[] step11a = step10[0].getChildren();
    //println(step11a);
    proxml.XMLElement type_name_s = step11a[0].firstChild();
    String type_name =type_name_s.toString();
    //println("type name = " + type_name);
    proxml.XMLElement nick_name_s = step11a[1].firstChild();
    String nick_name = nick_name_s.toString();
    //println("nick name = " + nick_name);
    proxml.XMLElement GUID_s = step11a[3].firstChild();
    String GUID = GUID_s.toString();
    GUID = fixGUID(GUID);//Process GUIDS to be recognized by processing 
    //println("GUID a= " + GUID );
    proxml.XMLElement[] step11 = step10[1].getChildren();
    //println(step11);

    //+++++++++++++++++++++store array data for each type of object+++++++++++++++++++++++++++++++++++

    //---------------------slider----------------------------------
    if (type_name.equals("Number Slider") ) {

      proxml.XMLElement[] step12 = step11[1].getChildren();
      //println(step12);

      proxml.XMLElement[] step13 = step12[0].getChildren();
      //println(step13);

      //create sliderArray( typename, nickname, GUID, value, _min, _max, _viz )
      ArrayList<String> sliderArray = new ArrayList();
      sliderArray.add(type_name);
      sliderArray.add(nick_name);
      sliderArray.add(GUID);

      //add slider variables
      proxml.XMLElement[] step14 = step13[0].getChildren();
      String value = step14[0].getText();
      sliderArray.add(value);
      //println("value = " + value);
      proxml.XMLElement[] step15 = step13[1].getChildren();
      String _min = step15[0].getText();
      sliderArray.add(_min);
      //println("min = " + _min);
      proxml.XMLElement[] step16 = step13[2].getChildren();
      String _max = step16[0].getText();
      sliderArray.add(_max);
      //println("max = " + _max);
      proxml.XMLElement[] step17 = step13[3].getChildren();
      String _int = step17[0].getText();
      sliderArray.add(_int);
      //println("interval = " + _int);

      //add slider array to master list
      println("slider "+sliderArray);
      println("");//blankline
      masterArray.add(sliderArray);
    }//end slider

    //---------------------pointXYZ-----------------------------------
    if (type_name.equals("Point XYZ") ) {

      //create point3DArray( typename, nickname, GUID, Xin, Yin, Zin )
      ArrayList<String> point3DArray = new ArrayList();
      point3DArray.add(type_name);
      point3DArray.add(nick_name);

      //special subroutine to get GUID string from output.
      //navigate to Output parameters
      proxml.XMLElement[] outputParameters = step11[5].getChildren();
      //println(outputParameters);
      proxml.XMLElement[] outItems = outputParameters[0].getChildren();
      proxml.XMLElement item = outItems[3].firstChild();
      GUID = item.toString();
      GUID = fixGUID(GUID);//Process GUIDS to be recognized by processing 
      //println(GUID);
      point3DArray.add(GUID);
      
      //visible?
      proxml.XMLElement[] step11b = step10[0].getChildren();
      String Viz="true";
      for (int j = 0; j < step10[0].countChildren(); j = j+1) {
        String name =(step11b[j].getAttribute("name"));
        if (name.equals("Hidden")) {
           Viz="false";
        }//end if(name)
      }//end(for j)

      //X input
      //navigate to X input parameters
      proxml.XMLElement[] XinputParameters = step11[1].getChildren();
      //println(inputParameters);
      proxml.XMLElement[] Xitems = XinputParameters[0].getChildren();
      //println (items);

      //set up boolean flag
      boolean ref = false;
      String Xin = "";

      for (int j = 0; j < XinputParameters[0].countChildren(); j = j+1) {
        String name =(Xitems[j].getAttribute("name"));
        if (name.equals("Source")) {
          proxml.XMLElement step12 = Xitems[j].firstChild();
          Xin = step12.toString();
          Xin = fixGUID(Xin);//Process GUIDS to be recognized by processing 
          //println ("fixed c "  + Xin);
          ref=true;
        }//end if(name)
      }//end(for j)

      if (!ref) {
        proxml.XMLElement[] step12 = XinputParameters[1].getChildren();
        //println (step12);
        proxml.XMLElement[] step13 = step12[1].getChildren();
        //println (step13);
        proxml.XMLElement step14 = step13[0].firstChild();
        //println (step14);
        proxml.XMLElement step15 = step14.firstChild();
        //println (step14);
        Xin = step15.toString();
        //println (Xin);
      }//end if(!ref)

      point3DArray.add(Xin);
      //end X input

      //Y input
      //navigate to Y input parameters
      proxml.XMLElement[] YinputParameters = step11[2].getChildren();
      //println(inputParameters);
      proxml.XMLElement[] Yitems = YinputParameters[0].getChildren();
      //println (Yitems);

      ref = false;
      String Yin = "";

      for (int j = 0; j < YinputParameters[0].countChildren(); j = j+1) {
        String name =(Yitems[j].getAttribute("name"));
        if (name.equals("Source")) {
          proxml.XMLElement step12 = Yitems[j].firstChild();
          Yin = step12.toString();
          Yin = fixGUID(Yin);//Process GUIDS to be recognized by processing
          //println ("fixed b "  + Yin);
          ref=true;
        }//end inf(name)
      }//end for (j)

      if (!ref) {
        proxml.XMLElement[] step18 = YinputParameters[1].getChildren();
        //println (step18);
        proxml.XMLElement[] step19 = step18[1].getChildren();
        //println (step19);
        proxml.XMLElement step20 = step19[0].firstChild();
        //println (step20);
        proxml.XMLElement step21 = step20.firstChild();
        //println (step21);
        Yin = step21.toString();
        //println (Yin);
      }//end if(!ref)

      point3DArray.add(Yin);
      //end Y input

      //Z input
      //navigate to Z input parameters
      proxml.XMLElement[] ZinputParameters = step11[3].getChildren();
      //println(ZinputParameters);
      proxml.XMLElement[] Zitems = ZinputParameters[0].getChildren();
      //println (Zitems);

      ref = false;
      String Zin = "";

      for (int j = 0; j < ZinputParameters[0].countChildren(); j = j+1) {
        String name =(Zitems[j].getAttribute("name"));
        if (name.equals("Source")) {
          proxml.XMLElement step12 = Zitems[j].firstChild();
          Zin = step12.toString();
          //println(type_name + " " + Zin);
          Zin = fixGUID(Zin);//Process GUIDS to be recognized by processing
          //println ("fixed a "  + Zin);
          ref=true;
        }//end if name
      }//end for(j)

      if (!ref) {
        proxml.XMLElement[] step22 = ZinputParameters[1].getChildren();
        //println (step22);
        proxml.XMLElement[] step23 = step22[1].getChildren();
        //println (step23);
        proxml.XMLElement step24 = step23[0].firstChild();
        //println (step24);
        proxml.XMLElement step25 = step24.firstChild();
        //println (step25);
        Zin = step25.toString();
        //println (Zin);
      }//end if(!ref)

      point3DArray.add(Zin);
      //end Z input
      point3DArray.add(Viz);
      //add point3DArray to master list
      println("point3D " + point3DArray);
      println("");//blankline
      masterArray.add(point3DArray);
    }//end if(PointXYZ)

    //-----------------------4Point Surface---------------------------------------------------

    if (type_name.equals("4Point Surface") ) {

      //create ptSurfaceArray(typename, nickname, GUID, 1stCorner, 2ndCorner, 3rdCorner, 4thCorner)
      ArrayList<String> ptSurfaceArray = new ArrayList();
      ptSurfaceArray.add(type_name);
      ptSurfaceArray.add(nick_name);
      ptSurfaceArray.add(GUID);

      //1st input
      //navigate to 1st input parameters
      proxml.XMLElement[] inputItems = step11[1].getChildren();
      //println(inputItems);
      proxml.XMLElement[] items = inputItems[0].getChildren();
      //println (items);

      //set up variables
      boolean ref = false;
      String firstCorner = "";
      proxml.XMLElement step12;
      proxml.XMLElement[] step22;
      proxml.XMLElement[] step23;
      proxml.XMLElement step24;
      proxml.XMLElement step25;

      for (int j = 0; j < inputItems[0].countChildren(); j = j+1) {
        String name =(items[j].getAttribute("name"));
        if (name.equals("Source")) {
          step12 = items[j].firstChild();
          firstCorner = step12.toString();
          //println(type_name + " " + Zin);
          firstCorner = fixGUID(firstCorner);//Process GUIDS to be recognized by processing
          //println ("fixed firstcforner "  + firstCorner);
          ref=true;
        }//end if name
      }//end for(j)

      if (!ref) {
        step22 = inputItems[1].getChildren();
        //println (step22);
        step23 = step22[1].getChildren();
        //println (step23);
        step24 = step23[0].firstChild();
        //println (step24);
        step25 = step24.firstChild();
        //println (step25);
        firstCorner = step25.toString();
      }//end 1st input
      ptSurfaceArray.add(firstCorner);
      //println ("firstCorner "+ firstCorner);
      //-----------------------------------------------------------------------------------------

      //Second input
      //navigate to 2nd input parameters
      inputItems = step11[2].getChildren();
      //println(inputItems);
      items = inputItems[0].getChildren();
      //println (items);

      //set up boolean flag
      ref = false;
      String secondCorner = "";

      for (int j = 0; j < inputItems[0].countChildren(); j = j+1) {
        String name =(items[j].getAttribute("name"));
        if (name.equals("Source")) {
          step12 = items[j].firstChild();
          secondCorner = step12.toString();
          //println(type_name + " " + Zin);
          secondCorner = fixGUID(secondCorner);//Process GUIDS to be recognized by processing
          //println ("fixed a "  + Zin);
          ref=true;
        }//end if name
      }//end for(j)

      if (!ref) {
        step22 = inputItems[1].getChildren();
        //println (step22);
        step23 = step22[1].getChildren();
        //println (step23);
        step24 = step23[0].firstChild();
        //println (step24);
        step25 = step24.firstChild();
        //println (step25);
        secondCorner = step25.toString();
      }//end Second Input
      ptSurfaceArray.add(secondCorner);
      //println ("secondCorner "+ secondCorner);

      //-----------------------------------------------------------------------------------------

      //Third input
      //navigate to 2nd input parameters
      inputItems = step11[3].getChildren();
      //println(inputItems);
      items = inputItems[0].getChildren();
      //println (items);

      //set up boolean flag
      ref = false;
      String thirdCorner = "";

      for (int j = 0; j < inputItems[0].countChildren(); j = j+1) {
        String name =(items[j].getAttribute("name"));
        if (name.equals("Source")) {
          step12 = items[j].firstChild();
          thirdCorner = step12.toString();
          //println(type_name + " " + Zin);
          thirdCorner = fixGUID(thirdCorner);//Process GUIDS to be recognized by processing
          //println ("fixed a "  + Zin);
          ref=true;
        }//end if name
      }//end for(j)

      if (!ref) {
        step22 = inputItems[1].getChildren();
        //println (step22);
        step23 = step22[1].getChildren();
        //println (step23);
        step24 = step23[0].firstChild();
        //println (step24);
        step25 = step24.firstChild();
        //println (step25);
        thirdCorner = step25.toString();
      }//end Second Input
      ptSurfaceArray.add(thirdCorner);
      //println ("thirdCorner "+ thirdCorner);

      //-----------------------------------------------------------------------------------------  

      //Fourth input
      //navigate to 2nd input parameters
      inputItems = step11[4].getChildren();
      //println(inputItems);
      items = inputItems[0].getChildren();
      //println (items);

      //set up boolean flag
      ref = false;
      String fourthCorner = "";

      for (int j = 0; j < inputItems[0].countChildren(); j = j+1) {
        String name =(items[j].getAttribute("name"));
        if (name.equals("Source")) {
          step12 = items[j].firstChild();
          fourthCorner = step12.toString();
          //println(type_name + " " + Zin);
          fourthCorner = fixGUID(fourthCorner);//Process GUIDS to be recognized by processing
          //println ("fixed a "  + Zin);
          ref=true;
        }//end if name
      }//end for(j)

      if (!ref) {
        step22 = inputItems[1].getChildren();
        //println (step22);
        step23 = step22[1].getChildren();
        //println (step23);
        step24 = step23[0].firstChild();
        //println (step24);
        step25 = step24.firstChild();
        //println (step25);
        fourthCorner = step25.toString();
      }//end Second Input
      ptSurfaceArray.add(fourthCorner);
      //println ("fourthCorner "+ fourthCorner);

      masterArray.add(ptSurfaceArray);
      println("4Point Surface " + ptSurfaceArray);
      println("");//blankline
    }//end 4ptSurface

    //----------------------------Panel----------------------------------------   

    if (type_name.equals("Panel") ) {

      //create panelArray( typename, nickname, GUID, userText)
      ArrayList<String> panelArray = new ArrayList();
      panelArray.add(type_name);
      panelArray.add(nick_name);
      panelArray.add(GUID);
      proxml.XMLElement userText_s = step11a[6].firstChild();
      String userText = userText_s.toString();
      panelArray.add(userText);

      masterArray.add(panelArray);
      println("Panel " + panelArray);
      println("");//blankline
    }//end Panel

    //---------------Multiplication / Addition ----------------------------------------   

    if ((type_name.equals("Multiplication")) || (type_name.equals("Addition"))|| (type_name.equals("Subtraction"))) {

      //create multiArray( typename, nickname, GUID, Ainput, Binput)
      ArrayList<String> multiArray = new ArrayList();
      multiArray.add(type_name);
      multiArray.add(nick_name);

      //special subroutine to get GUID string from output.
      //navigate to Output parameters
      proxml.XMLElement[] outputParameters = step11[3].getChildren();
      //println(outputParameters);
      proxml.XMLElement[] outItems = outputParameters[0].getChildren();
      proxml.XMLElement item = outItems[3].firstChild();
      GUID = item.toString();
      GUID = fixGUID(GUID);//Process GUIDS to be recognized by processing 
      //println(GUID);
      multiArray.add(GUID);

      //get input parameters
      //A input
      //navigate to A input parameters
      proxml.XMLElement[] AinputParameters = step11[1].getChildren();
      //println(inputParameters);
      proxml.XMLElement[] Aitems = AinputParameters[0].getChildren();
      //println (items);

      //set up boolean flag
      boolean ref = false;
      String Ain = "";

      for (int j = 0; j < AinputParameters[0].countChildren(); j = j+1) {
        String name =(Aitems[j].getAttribute("name"));
        if (name.equals("Source")) {
          proxml.XMLElement step12 = Aitems[j].firstChild();
          Ain = step12.toString();
          Ain = fixGUID(Ain);//Process GUIDS to be recognized by processing 
          //println ("fixed A "  + Ain);
          ref=true;
        }//end if(name)
      }//end(for j)

      if (!ref) {
        proxml.XMLElement[] step12 = AinputParameters[1].getChildren();
        //println (step12);
        proxml.XMLElement[] step13 = step12[1].getChildren();
        //println (step13);
        proxml.XMLElement step14 = step13[0].firstChild();
        //println (step14);
        proxml.XMLElement step15 = step14.firstChild();
        //println (step14);
        Ain = step15.toString();
        //println (Ain);
      }//end if(!ref)
      //println("Ainput " + Ain);
      multiArray.add(Ain);
      //end A input

      //-------------------------------------------------------------------

      //B input
      //navigate to A input parameters
      proxml.XMLElement[] BinputParameters = step11[2].getChildren();
      //println(inputParameters);
      proxml.XMLElement[] Bitems = BinputParameters[0].getChildren();
      //println (items);

      //set up boolean flag
      ref = false;
      String Bin = "";

      for (int j = 0; j < BinputParameters[0].countChildren(); j = j+1) {
        String name =(Bitems[j].getAttribute("name"));
        if (name.equals("Source")) {
          proxml.XMLElement step12 = Bitems[j].firstChild();
          Bin = step12.toString();
          Bin = fixGUID(Bin);//Process GUIDS to be recognized by processing 
          //println ("fixed B "  + Bin);
          ref=true;
        }//end if(name)
      }//end(for j)

      if (!ref) {
        proxml.XMLElement[] step12 = BinputParameters[1].getChildren();
        //println (step12);
        proxml.XMLElement[] step13 = step12[1].getChildren();
        //println (step13);
        proxml.XMLElement step14 = step13[0].firstChild();
        //println (step14);
        proxml.XMLElement step15 = step14.firstChild();
        //println (step14);
        Bin = step15.toString();
        //println (Bin);
      }//end if(!ref)
      multiArray.add(Bin);
      // println("Binput " + Bin);
      //end B input

      masterArray.add(multiArray);
      println("Math " + multiArray);
      println("");//blankline
    }//end Multiplication/Addition


    
  }//------------------end adding definition objects to masterArray-----------------------

  //println("master List " + masterArray);

  //PART 2///////////////////GENERATE PDE FILE FROM MASTERARRAY//////////////////

  //file header
  data.beginSave();
  data.add("//pde translated from '" + ghName + "' using Chrysalis");
  data.add("//licensed under Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.");
  data.add("//www.fabripod.com/chrysalis +++++++ www.creativecommons.org");
  data.add("");
  data.add("//import libraries");
  data.add("import peasy.org.apache.commons.math.*;");
  data.add("import peasy.*;");
  data.add("import peasy.org.apache.commons.math.geometry.*;");
  data.add("import controlP5.*;");
  data.add("import processing.opengl.*;");
  data.add("");
  data.add("//initialize global variables");
  data.add("PeasyCam cam;");
  data.add("ControlP5 controlP5;");
  data.add("PMatrix3D currcamMatrix;");
  data.add("PGraphics3D g3;");
  data.add("");//open line

  // add global variables for each slider object
  for (int k = 0; k < masterArray.size(); k ++) {
    if (masterArray.get(k).get(0).equals("Number Slider") ) {
      data.add("//control variable: type \"" + (String)masterArray.get(k).get(0) + "\" , Nick name " + (String)masterArray.get(k).get(1) + ";");
      data.add("float " + (String)masterArray.get(k).get(2) + " = " + float((String)masterArray.get(k).get(3)) + ";");
      data.add("");//open line
    }//end if
  }//end for

  // add global variables for each Math object
  for (int k = 0; k < masterArray.size(); k ++) {
    //println(masterArray.get(k).get(0));
    if ((masterArray.get(k).get(0).equals("Multiplication") || (masterArray.get(k).get(0).equals("Addition")) || (masterArray.get(k).get(0).equals("Subtraction")))) {
      data.add("//Math Variable: type \"" + (String)masterArray.get(k).get(0) + "\" , Nick name " + (String)masterArray.get(k).get(1) + ";");
      data.add("float " + (String)masterArray.get(k).get(2) + ";");
      data.add("");//open line
    }//end if
  }//end for

  // add global variables for each Panel object
  for (int k = 0; k < masterArray.size(); k ++) {
    //println(masterArray.get(k).get(0));
    if (masterArray.get(k).get(0).equals("Panel") ) {
      data.add("//Static Variable: type \"" + (String)masterArray.get(k).get(0) + "\" , Nick name " + (String)masterArray.get(k).get(1) + ";");
      data.add("float " + (String)masterArray.get(k).get(2) + " = ( " +( String)masterArray.get(k).get(3) + ");");
      data.add("");//open line
    }//end if
  }//end for

  //add global variables
  //data.add("ArrayList <Point> points = new ArrayList <Point> ();");
  //data.add("//ArrayList <Line> lines = new ArrayList <Line> ();");
  //data.add("");//open line

  data.add("//global variables");
  data.add("float gridSize;");
  data.add("float gridDiv;");
  data.add("");//open line

  //+++++++++++++++++++++++++++++'void setup' section+++++++++++++++++++++++++++++++++++++++++++++

  data.add("void setup(){");
  data.add("size(" + W + ", " + H + ", OPENGL);");
  data.add("g3 = (PGraphics3D)g;");
  data.add("cam = new PeasyCam(this,width);");
  data.add("controlP5 = new ControlP5(this);");
  data.add("");//open line

  //-----------------------------setup slider objects--------------------------------
  //*array reference*         sliderArray( typename, nickname, GUID, value, _min, _max, _int )
  //*constructor reference* controlP5.addSlider( String Name, float Min, float Max, float DefaultValue, int X, int Y, int Width, int Height )
  int n =0;
  for (int k = 0; k < masterArray.size(); k ++) {
    if (masterArray.get(k).get(0).equals("Number Slider") ) {
      n++;
      data.add("//control object: type=\"" + (String)masterArray.get(k).get(0) + "\". name=\"" + (String)masterArray.get(k).get(1) + "\"");
      data.add("controlP5.addSlider(\"" + (String)masterArray.get(k).get(2) + "\", " + (String)masterArray.get(k).get(4) + " , " + (String)masterArray.get(k).get(5) + ", " + (String)masterArray.get(k).get(2) + ", 0, int(height-" + 2*sliderHeight*n + "), int(width-75), int(" + sliderHeight + "));");
      data.add("Slider s" + k + " = (Slider)controlP5.controller(\"" + (String)masterArray.get(k).get(2) + "\");");
      data.add("s" + k + ".setCaptionLabel(\"" + (String)masterArray.get(k).get(1) + "\");");
      data.add("s" + k + ".setColorLabel(0);");
      data.add("");//open line
    }//end if "number slider"
  }//end masterArray loop
  
  //----------------------------setup Math objects-----------------------------------
  data.add("//set values for math objects");
  for (int k = 0; k < masterArray.size(); k ++) {
    //println(masterArray.get(k).get(0));
    if (masterArray.get(k).get(0).equals("Multiplication") ) {
      data.add("//Math Variable: type \"" + (String)masterArray.get(k).get(0) + "\" , Nick name " + (String)masterArray.get(k).get(1) + ";");
      data.add((String)masterArray.get(k).get(2) + " = ( " +( String)masterArray.get(k).get(3) + " * " + ( String)masterArray.get(k).get(4) + ");");
      data.add("");//open line
    }//end if
    if (masterArray.get(k).get(0).equals("Addition") ) {
      data.add("//Math Variable: type \"" + (String)masterArray.get(k).get(0) + "\" , Nick name " + (String)masterArray.get(k).get(1) + ";");
      data.add((String)masterArray.get(k).get(2) + " = ( " +( String)masterArray.get(k).get(3) + " + " + ( String)masterArray.get(k).get(4) + ");");
      data.add("");//open line
    }//end if
    if (masterArray.get(k).get(0).equals("Subtraction") ) {
      data.add("//Math Variable: type \"" + (String)masterArray.get(k).get(0) + "\" , Nick name " + (String)masterArray.get(k).get(1) + ";");
      data.add((String)masterArray.get(k).get(2) + " = ( " +( String)masterArray.get(k).get(3) + " - " + ( String)masterArray.get(k).get(4) + ");");
      data.add("");//open line
    }//end if
  }//end for

  //this is for proper slider rendering (?)
  data.add("controlP5.setAutoDraw(false);");
  data.add("smooth();");
  data.add("");//open line

  data.add("//set grid variables");//set grid variables
  data.add("gridSize = width;");
  data.add("gridDiv = 10;");
  data.add("");//open line

  data.add("}//end setup");
  data.add("");//open line

  //-------------------------------add Point objects (outside setup)-------------------------------
  //*array reference*    point3DArray(typename, nickname, GUID, Xin, Yin, Zin, Viz )
  //*array reference*     sliderArray( typename, nickname, GUID, value, _min, _max, _int )
  //*array reference*      panelArray( typename, nickname, GUID, userText)
  //*constructor reference* PointXYZ (String name, float xpos, float ypos, float zpos)

  data.add("  //create point objects"); 
  for (int k = 0; k < masterArray.size(); k ++) {
    if (masterArray.get(k).get(0).equals("Point XYZ") ) {
      //assign X
      String Xident = (String)masterArray.get(k).get(3);
      if (Xident.length()>5) {// this is a GUID ref
        //step through masterArray to find GUID reference
        for (int m = 0; m < masterArray.size(); m ++) {
          if (masterArray.get(m).get(2).equals(Xident)) {
            tempX =(String)masterArray.get(m).get(3); //tempX is the referenced slider's Value
          }//end if
        }//end for
      }//end GUID ref
      else {//it's not a reference, it's a static number
        tempX = Xident; //tempX is the current point's native X value
      }//end static #

      //assignY
      String Yident = (String)masterArray.get(k).get(4);
      if (Yident.length()>5) {// this is a GUID ref
        //step through masterArray to find GUID reference
        for (int m = 0; m < masterArray.size(); m ++) {
          if (masterArray.get(m).get(2).equals(Yident)) {
            tempY =(String)masterArray.get(m).get(3); //tempY is the referenced slider's Value
          }//end if
        }//end for
      }//end GUID ref
      else {//it's not a reference, it's a static number
        tempY = Yident; //tempY is the current point's native Y value
      }//end static #

      //assignZ
      String Zident = (String)masterArray.get(k).get(5);
      if (Zident.length()>5) {// this is a GUID ref
        //step through masterArray to find GUID reference
        for (int m = 0; m < masterArray.size(); m ++) {
          if (masterArray.get(m).get(2).equals(Zident)) {
            tempZ =(String)masterArray.get(m).get(3); //tempZ is the referenced slider's Value
          }//end if
        }//end for
      }//end GUID ref
      else {//it's not a reference, it's a static number
        tempZ = Zident; //tempZ is the current point's native Z value
      }//end static #
      data.add("Point " + masterArray.get(k).get(2) + " = new Point(\"" + masterArray.get(k).get(1) + "\"," + tempX + ", " + tempY + "," + tempZ + ");");//add the point using nckname and temp. values
    }//end if "Point XYZ"
  }//end masterArray loop

  data.add("");//open line


  //+++++++++++++++++++++++++++'void draw' section+++++++++++++++++++++++++++++++

  data.add("void draw() {");
  data.add("  background(255);");
  data.add("  //make sliders independent of camera");
  data.add("  if (controlP5.window(this).isMouseOver()) {");
  data.add("    cam.setActive(false);");
  data.add("  } else {");
  data.add("    cam.setActive(true);");
  data.add("  }//end mouseover");
  data.add("");//open line

  //if grid is required.....
  if (gridYN) {
    data.add("//add reference grid");
    data.add("   grid();");
    data.add("");//open line
  }
  //-----------------------------update math objects--------------------------

  for (int k = 0; k < masterArray.size(); k ++) {
    if (masterArray.get(k).get(0).equals("Multiplication") ) {
      data.add("//Update Math Object: type \"" + (String)masterArray.get(k).get(0) + "\" , Nick name " + (String)masterArray.get(k).get(1) + ";");
      data.add((String)masterArray.get(k).get(2) + " = ( " +( String)masterArray.get(k).get(3) + " * " + ( String)masterArray.get(k).get(4) + ");");
      data.add("");//open line
    }//end if
    if (masterArray.get(k).get(0).equals("Addition") ) {
      data.add("//Update Math Object: type \"" + (String)masterArray.get(k).get(0) + "\" , Nick name " + (String)masterArray.get(k).get(1) + ";");
      data.add((String)masterArray.get(k).get(2) + " = ( " +( String)masterArray.get(k).get(3) + " + " + ( String)masterArray.get(k).get(4) + ");");
      data.add("");//open line
    }//end if
    if (masterArray.get(k).get(0).equals("Subtraction") ) {
      data.add("//Math Variable: type \"" + (String)masterArray.get(k).get(0) + "\" , Nick name " + (String)masterArray.get(k).get(1) + ";");
      data.add((String)masterArray.get(k).get(2) + " = ( " +( String)masterArray.get(k).get(3) + " - " + ( String)masterArray.get(k).get(4) + ");");
      data.add("");//open line
    }//end if
  }//end for


  //-------------------------------update point objects-------------------------------
  //*array reference*    point3DArray(typename, nickname, GUID, Xin, Yin, Zin )
  //*constructor reference* PointXYZ (String name, float xpos, float ypos, float zpos)

  data.add("//update point  objects"); //update point objects with slider values
  n = 0;

  for (int k = 0; k < masterArray.size(); k ++) {
    //println(masterArray.get(k).get(0));
    if (masterArray.get(k).get(0).equals("Point XYZ") ) {
      data.add("// " + (String)masterArray.get(k).get(1)); 

      //X
      String Xident = (String)masterArray.get(k).get(3);
      if (Xident.length()>5) {//set point's X value to reference GUID string
        data.add((String)masterArray.get(k).get(2) + ".x = " + Xident + ";");
      }//end X GUID ref

      //Y
      String Yident = (String)masterArray.get(k).get(4);
      if (Yident.length()>5) {//set point's Y value to reference GUID string
        data.add((String)masterArray.get(k).get(2) + ".y = " + Yident + ";");
      }//end Y GUID ref

      //Z
      String Zident = (String)masterArray.get(k).get(5);
      if (Zident.length()>5) {//set point's Z value to reference GUID string
        data.add((String)masterArray.get(k).get(2) + ".z = " + Zident + ";");
      }//end Z GUID ref

      if (masterArray.get(k).get(6).equals("True")) {
        data.add((String)masterArray.get(k).get(2) + ".render();");
      }//end render
      data.add("");//open line
      n ++;//increase index count
    }//end if
  }//end masterArray loop

  //-------------------------------add surface objects-----------------------------   

  //*reference* ptSurfaceArray(typename, nickname, GUID, 1stCorner, 2ndCorner, 3rdCorner, 4thCorner)
  //*constructor reference* vertex (xyz)

  data.add("//add surface objects");
  for ( int k = 0; k < masterArray.size(); k ++) {
    if (masterArray.get(k).get(0).equals("4Point Surface") ) {
      data.add("// " + (String)masterArray.get(k).get(1)); 
      data.add("strokeWeight(.25);");
      data.add("beginShape();");
      data.add("vertex(" +(String)masterArray.get(k).get(3)+".x," +(String)masterArray.get(k).get(3)+ ".y,"  +(String)masterArray.get(k).get(3)+ ".z);");
      data.add("vertex(" +(String)masterArray.get(k).get(4)+".x," +(String)masterArray.get(k).get(4)+ ".y,"  +(String)masterArray.get(k).get(4)+ ".z);");
      data.add("vertex(" +(String)masterArray.get(k).get(5)+".x," +(String)masterArray.get(k).get(5)+ ".y,"  +(String)masterArray.get(k).get(5)+ ".z);");
      data.add("vertex(" +(String)masterArray.get(k).get(6)+".x," +(String)masterArray.get(k).get(6)+ ".y,"  +(String)masterArray.get(k).get(6)+ ".z);");
      data.add("endShape();");
      data.add("");//open line
    }//end if
  }//end masterArray loop

  data.add("");//open line
  data.add("cam.beginHUD();");
  data.add(" gui();");
  data.add("cam.endHUD();");

  data.add("}//end draw");
  data.add("");//open line

  ///////////////////////////////////////EXPORT CLASSES and functions///////////////////////////////////////////
  data.add("//FUNCTIONS AND CLASSES");
  data.add("");
  data.add("//Functions ");//Functions 
  data.add("void gui() {");
  data.add("  currcamMatrix = new PMatrix3D(g3.camera);");
  data.add("  camera();");
  data.add("  controlP5.draw();");
  data.add("  g3.camera = currcamMatrix;");
  data.add("}//end GUI");

  data.add("");//openline
  data.add("void grid(){");
  data.add("  strokeWeight(.25);");
  data.add("  stroke(169,169,169);");
  data.add("  for(float i=gridSize*-0.5; i<=gridSize*0.5; i += gridSize/gridDiv){");
  data.add("    line ((gridSize*-0.5),i,0,(gridSize*0.5),i,0);");
  data.add("    line (i,(gridSize*-0.5),0,i,(gridSize*0.5),0);");
  data.add("  }// end for");
  data.add("} //end grid");
  data.add("");//openline

  data.add("//Classes ");//Classes 
  data.add("");//openline
  data.add("//simple point class ");
  data.add("class Point{");
  data.add("  String name;");
  data.add("  float x, y, z;");
  data.add("  Point(String name,float x, float y, float z){");
  data.add("    this.name = name;");
  data.add("    this.x = x;");
  data.add("    this.y = y;");
  data.add("    this.z = z;");
  data.add("  }");
  data.add("    void render(){");
  data.add("    strokeWeight(5);");
  data.add("    stroke(255,0,0);");
  data.add("    point(x,y,z);");
  data.add("  }");
  data.add("}//end class Point");

  data.add("");

  //save data file! done!
  String[] shortName = split(ghName, '.');
  data.endSave(data.getIncrementalFilename(sketchPath("data" + java.io.File.separator +  shortName[0] + "####.pde")));
}

///////////////////////////classes and functions/////////////////////////

String fixGUID(String GUID) {
  GUID = trim(GUID);
  String[] arrTempString = split(GUID, "-");
  GUID = "V"+arrTempString[0];
  for (int q = 1 ; q <arrTempString.length ; q++) {
    GUID = GUID + arrTempString[q];
  }//end for 
  return GUID;
}//end fixGUID

// DATA CLASS

class Data {
  ArrayList datalist;
  String filename, data[];
  int datalineId;

  // begin data saving
  void beginSave() {
    datalist=new ArrayList();
  }
  void add(String s) {
    datalist.add(s);
  }
  void add(float val) {
    datalist.add(""+val);
  }
  void add(int val) {
    datalist.add(""+val);
  }
  void add(boolean val) {
    datalist.add(""+val);
  }
  void endSave(String _filename) {
    filename=_filename;
    data=new String[datalist.size()];
    data=(String [])datalist.toArray(data);
    saveStrings(filename, data);
    println("Saved data to '"+filename+
      "', "+data.length+" lines.");
  }

  void load(String _filename) {
    filename=_filename;

    datalineId=0;
    data=loadStrings(filename);
    println("Loaded data from '"+filename+
      "', "+data.length+" lines.");
  }

  float readFloat() {
    return float(data[datalineId++]);
  }

  int readInt() {
    return int(data[datalineId++]);
  }

  boolean readBoolean() {
    return boolean(data[datalineId++]);
  }

  String readString() {
    return data[datalineId++];
  }

  // Utility function to auto-increment filenames
  // based on filename templates like "name-###.txt" 

  public String getIncrementalFilename(String templ) {
    String s="", prefix, suffix, padstr, numstr;
    int index=0, first, last, count;
    File f;
    boolean ok;

    first=templ.indexOf('#');
    last=templ.lastIndexOf('#');
    count=last-first+1;

    if ( (first!=-1)&& (last-first>0)) {
      prefix=templ.substring(0, first);
      suffix=templ.substring(last+1);

      // Comment out if you want to use absolute paths
      // or if you're not using this inside PApplet
      if (sketchPath!=null) prefix=savePath(prefix);

      index=0;
      ok=false;

      do {
        padstr="";
        numstr=""+index;
        for (int i=0; i< count-numstr.length(); i++) padstr+="0";
        s=prefix+padstr+numstr+suffix;

        f=new File(s);
        ok=!f.exists();
        index++;

        // Provide a panic button. If index > 10000 chances are it's an
        // invalid filename.
        if (index>10000) ok=true;
      }
      while (!ok);

      // Panic button - comment out if you know what you're doing
      if (index> 10000) {
        println("getIncrementalFilename thinks there is a problem - "+
          "Is there  more than 10000 files already in the sequence "+
          " or is the filename invalid?");
        println("Returning "+prefix+"ERR"+suffix);
        return prefix+"ERR"+suffix;
      }
    }

    return s;
  }
}//end DATA class

