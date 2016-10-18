import controlP5.*;

ControlP5 cp5;

PImage img;
//Basado en codigo descargado de www.sojamo.de
//Gracias Javi Villarroel y Dani Pietrosemoli ;)
//Colaboradores estrella ;) para la construccion y programacion de la Bioimpresora

int numPaths = 0;

float canvasX0=100;
float canvasW=500;
float canvasY0=100;
float canvasH=500;
float diametro = 500;

float imgOffsetX = 0;
float imgOffsetY = 0;
float imgScale = 1;

ArrayList<PVector> points;

void setup() {
  size(700, 700);
  smooth();
  img = loadImage("MapaSigpacMAD2.png");
  cp5 = new ControlP5(this);

  cp5.addButton("compile")
    .setPosition(25, 410)
    .setSize(50, 40)
    .setCaptionLabel("GCode");
  ;

  cp5.addButton("clear")
    .setPosition(25, 50)
    .setSize(50, 20)
    .setCaptionLabel("Clear");
  ;

  cp5.addButton("exit")
    .setPosition(25, 600)
    .setSize(50, 20)
    .setCaptionLabel("exit");
  ;
  points = new ArrayList();
}

void clear() {
}

void draw() {
  background(50, 50, 50);
  fill(255, 90);
  stroke(200);
  strokeWeight(2);
  image(img, imgOffsetX, imgOffsetY);
  rect(canvasX0, canvasY0, canvasW, canvasH);
  noFill();
  ellipse(width/2, height/2, diametro, diametro );

  fill(255, 0, 0);
  noStroke();
  for (PVector p : points) {
    ellipse(p.x, p.y, 8, 8);
  }
}


void mousePressed() {
  points.add(new PVector(mouseX, mouseY));
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      imgOffsetY -= 1;
    } else if (keyCode == DOWN) {
      imgOffsetY += 1;
    } else if (keyCode == LEFT) {
      imgOffsetX -= 1;
    } else if (keyCode == RIGHT) {
      imgOffsetX += 1;
    }
  }

  if (key == '+') {
    img.resize(int(img.width*1.1), int(img.height*1.1));
  }
  if (key == '-') {
    img.resize(int(img.width*0.9), int(img.height*0.9));
  }
}

PVector convertCoord(PVector pixel) {
  float newX = 100.0*(pixel.x - canvasX0)/canvasW - 50.0;
  float newY = 100.0*(pixel.y - canvasY0)/canvasH - 50.0;
  return new PVector(newX, newY);
}

void compile() {
  String[] startGcodeLines = loadStrings("startgcode.txt");
  String[] endGcodeLines = loadStrings("endgcode.txt");

  StringList gCode = new StringList();
  //GCODE inicial
  for (int i = 0; i < startGcodeLines.length; i++) {
    gCode.append(startGcodeLines[i]);
  }

  //GCODE generado por este programa
  gCode.append("G1 X0 Y0 Z15 F3300.0 (move to waiting position)");

  float Zseguro = 15.0;
  float extrusion = 0.0;


  for (PVector p : points) {
    PVector q = convertCoord(p);
    //Ir al punto
    extrusion += 1;
    gCode.append("G1 X" + nf(q.x, 1, 2) + " Y" + nf(q.y, 1, 2) + " Z"+ nf(Zseguro));
    //Bajar
    gCode.append("G1 Z5");
    //Bajar y extruir
    gCode.append("G1 Z0 E" + nf(extrusion, 1, 1));
    //subir un poco
    gCode.append("G1 Z3");
    
  }

  //volver al sitio seguro
  gCode.append("G1 X0 Y0 Z15 F3300.0 (move to waiting position)");


  // GCode final
  for (int i = 0; i < endGcodeLines.length; i++) {
    gCode.append(endGcodeLines[i]);
  }

  String[] gcodeExport = new String[gCode.size()]; 
  for (int i = 0; i < gcodeExport.length; i++) {
    gcodeExport[i] = gCode.get(i);
  }

  String name = nf(year()) + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2) + ".gcode";
  saveStrings(name, gcodeExport);
}