import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Parallax item1;
Parallax item2;
Parallax item3;
Parallax item4;
Parallax item5;

ArrayList<Parallax> items;

Minim minim;
AudioPlayer player;
boolean is_playing;

float initialScale;
int step;
float[] canvasMiddle, canvasSize;
//float opacity1, opacity2, opacity3, opacity4;

void setup() {
  //size(1280, 750);
  size(displayWidth, displayHeight);
  background(0);
  canvasSize = new float[2];
  canvasSize[0] = width;
  canvasSize[1] = height;
  canvasMiddle = new float[2];
  canvasMiddle[0] = width/2;
  canvasMiddle[1] = height/2;

  // SOUND
  minim = new Minim(this);
  player = minim.loadFile("strange_cut2.mp3", 1024);
  is_playing = false;
  //

  PImage img1 = loadImage("D.jpg");
  PImage img2 = loadImage("C.jpg");
  PImage img3 = loadImage("E.jpg");
  PImage img4 = loadImage("B.jpg");
  PImage img5 = loadImage("A.jpg");
  
  items = new ArrayList<Parallax>();
  
  item1 = new Parallax(img1, 0.999955);
  item2 = new Parallax(img2, 0.999090);
  item3 = new Parallax(img3, 1.00095);
  item4 = new Parallax(img4, 1.000555);
  item5 = new Parallax(img5, 0.999885); 
  
  items.add(item1);
  items.add(item2);
  items.add(item3);
  items.add(item4);
  //items.add(item5);

  initialScale = 0.9;
  step = 0;
}

void draw() {
  background(0);

  if (keyPressed == true) {
    if (is_playing == false) {
      player.loop();
      is_playing = true;
    }

    step ++;

    for(int i = 0; i < items.size(); i++) {
      items.get(i).update(step);
    }
    
    // Give a flicker effect
    blendMode(NORMAL);
    for(int i=0; i<10; i++) {
      fill(0, random(0,30));
      ellipse(random(0, canvasSize[0]), random(0, canvasSize[1]), 15, 15);
    }
  
  } else {
    if (is_playing == true) {
      player.pause();
      player.rewind();
      is_playing = false;
    }
    step = 0;
  }
}

class Parallax {
  Float x, y, increment;
  PImage img;
  
  Parallax(PImage l_img, float l_increment) {
    img = l_img;
    x = canvasMiddle[0];
    y = canvasMiddle[1];
    increment = l_increment;
  }

  void update(int step) {
    pushMatrix();
    
    float scale = (initialScale * ((float) Math.pow(increment, step) ));

    translate(x, y);
    scale(scale);
    blendMode(SCREEN);
    image(img, (img.width/-2), (img.height/-2));

    popMatrix();
  }
}

