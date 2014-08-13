import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

PImage img1;
PImage img2;
PImage img3;
Minim minim;
AudioSample kick1;

float initialScale;
float baseIncrement;
int step;
float[] canvasMiddle;

void setup() {
  size(1280, 750);
  img1 = loadImage("1.jpg");
  img2 = loadImage("2-2.jpg");
  img3 = loadImage("3.jpg");  
  minim = new Minim(this);
  kick1 = minim.loadSample("strange.mp3", 512);


  
  initialScale = 0.9;
  baseIncrement = 0.01;
  //imageScale = initialScale;
  step = 0;
  
  canvasMiddle = new float[2];
  canvasMiddle[0] = width/2;
  canvasMiddle[1] = height/2;
  
  background(0);
}

void draw() {
  background(0);
  
  if (keyPressed == true) {
    step ++;
    
    // FIRST SHAPE
    stroke(255);
    fill(127);
    pushMatrix();
    
    float increment1 = 0.9994;
    float scale1 = (initialScale * ((float) Math.pow(increment1,step) ));
    
    float x1 = canvasMiddle[0];
    float y1 = canvasMiddle[1];
    translate(x1, y1);
    scale(scale1);
    image(img1, (img1.width/-2), (img1.height/-2));
    //rect(-50, -50, 100, 100);
    
    popMatrix();
    // END

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
       kick1.trigger();

    popMatrix();
    // END
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
  }
  else {
    step = 0;
    //imageScale = initialScale;
  }
}

void keyPressed() {
}

