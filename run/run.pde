import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Parallax item1;

Minim minim;
AudioPlayer player;
boolean is_playing;

float initialScale;
float baseIncrement;
int step;
float[] canvasMiddle;

void setup() {
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

  PImage img1 = loadImage("A.jpg");
  item1 = new Parallax(img1, 1.0005); 

  initialScale = 0.9;
  baseIncrement = 0.01;
  step = 0;
}

void draw() {
  background(0);

  if (keyPressed == true) {
    if (is_playing == false) {
      player.play();
      is_playing = true;
    }

    step ++;

    item1.update(step);

    // FIRST SHAPE
//    pushMatrix();
//
//    //float increment1 = 0.9994;
//    float increment1 = 1.0005;
//    float scale1 = (initialScale * ((float) Math.pow(increment1, step) ));
//
//    float x1 = canvasMiddle[0];
//    float y1 = canvasMiddle[1];
//    translate(x1, y1);
//    scale(scale1);
//    image(img1, (img1.width/-2), (img1.height/-2));
//
//    popMatrix();
    // END

    /**
     // SECOND SHAPE
     stroke(255);
     fill(50);
     pushMatrix();
     
     //float increment2 = 0.9999;
     float increment2 = 1.0005;
     float scale2 = (0.8 * ((float) Math.pow(increment2,step) ));
     
     float x2 = canvasMiddle[0];
     float y2 = canvasMiddle[1];
     translate(x2, y2);
     scale(scale2);
     blendMode(SCREEN);
     image(img2, (img2.width/-2), (img2.height/-2));
     
     popMatrix();
     // END
     **/
    /** 
     // THIRD SHAPE
     stroke(255);
     fill(50);
     pushMatrix();
     
     float increment3 = 0.01 ;
     float scale3 = 0.2 + (increment3 * step);
     float tint3 = 255;
     
     float limit = 0.6;
     float gone = 0.1;
     if( scale3 >= limit && scale3 <= (limit + gone) ) {
     tint3 = 255 * ((scale3 - limit) / gone);
     //println(tint3);
     }
     
     float x3 = canvasMiddle[0];
     float y3 = canvasMiddle[1];
     translate(x3, y3);
     scale(scale3);
     blendMode(SCREEN);
     //tint(255, 5);
     //image(img3, (img3.width/-1.5), (img3.height/-1.5));
     //noTint();
     popMatrix();
     // END
     
     **/
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
    image(img, (img.width/-2), (img.height/-2));

    popMatrix();
  }
}

