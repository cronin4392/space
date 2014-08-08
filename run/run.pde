PImage img;  // Declare variable "a" of type PImage

float initialScale;
float imageScale;

void setup() {
  size(1280, 720);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("n6085_1400.jpg");  // Load the image into the program  
  
  initialScale = 0.9;
  println(initialScale);
  imageScale= initialScale;
  
  background(0);
}

void draw() {
  background(0);
  pushMatrix();
  // Displays the image at its actual size at point (0,0)
  if (keyPressed == true) {
    imageScale = imageScale + 0.001;
//    float x = mouseX;
//    float y = mouseY;
  
    float x = width/2;
    float y = height/2;
    translate(x, y);
    scale(imageScale);
    image(img, (img.width/-2), (img.height/-2));
  }
  else {
    imageScale = initialScale;
  }
  popMatrix();
}

void keyPressed() {
  
}

