import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.spi.*; 
import ddf.minim.signals.*; 
import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.ugens.*; 
import ddf.minim.effects.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class run extends PApplet {








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
float[] canvasMiddle;

public void setup() {
  //size(1280, 750);
  size(displayWidth, displayHeight);
  background(0);
  canvasMiddle = new float[2];
  canvasMiddle[0] = width/2;
  canvasMiddle[1] = height/2;

  // SOUND
  minim = new Minim(this);
  player = minim.loadFile("strange_cut.mp3", 1024);
  is_playing = false;
  //

  PImage img1 = loadImage("D.jpg");
  PImage img2 = loadImage("C.jpg");
  PImage img3 = loadImage("E.jpg");
  PImage img4 = loadImage("B.jpg");
  PImage img5 = loadImage("A.jpg");
  
  items = new ArrayList<Parallax>();
  
  item1 = new Parallax(img1, 0.999955f);
  item2 = new Parallax(img2, 0.999090f);
  item3 = new Parallax(img3, 1.00095f);
  item4 = new Parallax(img4, 1.000555f);
  item5 = new Parallax(img5, 0.999885f); 
  
  items.add(item1);
  items.add(item2);
  items.add(item3);
  items.add(item4);
  //items.add(item5);

  initialScale = 0.9f;
  step = 0;
}

public void draw() {
  background(0);

  if (keyPressed == true) {
    if (is_playing == false) {
      player.play();
      is_playing = true;
    }

    step ++;

    for(int i = 0; i < items.size(); i++) {
      items.get(i).update(step);
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

  public void update(int step) {
    pushMatrix();
    
    float scale = (initialScale * ((float) Math.pow(increment, step) ));

    translate(x, y);
    scale(scale);
    blendMode(SCREEN);
    image(img, (img.width/-2), (img.height/-2));

    popMatrix();
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#000000", "--hide-stop", "run" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
