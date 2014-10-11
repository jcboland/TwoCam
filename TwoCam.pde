/**
 *  Based on 'Getting Started with Capture'.
 * 
 *  This code is intended to be used for capturing time lapse videos of various sources at once. 
 *  It was written by Jack Boland and is property of Design Concepts, Inc.
 *
 *  Also, influenced by this site: http://forum.processing.org/one/topic/second-monitor-window-and-optimizing-performance.html
 */


import processing.video.*;

Capture cam1;
Capture cam2;
//Capture cam3;
//Capture cam4;

int img1;
int img2;
//int img3;
//int img4;

int timeInt = 5;
boolean start;
int lastCapture;



void setup() {
  // Sets up first window
  size(352*2, 288*1);
  
  lastCapture = 0;
  String[] cameras = Capture.list();
  img1 = 0;
  img2 = 0;
  //img3 = 0;
 // img4 = 0;
  start = false;
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      
      println(Integer.toString(i) + ":   " + cameras[i]);
    }

    // The camera can be initialized directly using an element
    // from the array returned by list():
   

    cam1 = new Capture(this, cameras[12]);
    cam2 = new Capture(this, cameras[144]);
   // cam3 = new Capture(this, cameras[191]);
   // cam4 = new Capture(this, cameras[234]);    
    
    // Or, the settings can be defined based on the text in the list
    //cam = new Capture(this, 640, 480, "Built-in iSight", 30);
    
    // Start capturing the images from the camera
    cam1.start();
    cam2.start();
  //  cam3.start();
  //  cam4.start();
    
  }
}

void draw() {
  if (cam1.available() == true) {
    cam1.read();
  }
  if (cam2.available() == true){
    cam2.read();
  }
//  if (cam3.available() == true){
//    cam3.read();
//  }
//  if (cam4.available() == true){
//    cam4.read();
//  }
  
  image(cam1, 0, 0);
  image(cam2, 352, 0);
  //image(cam3, 0, 288);
  //image(cam4, 352, 288);
  
  // The following does the same as the above image() line, but 
  // is faster when just drawing the image without any additional 
  // resizing, transformations, or tint.
  //set(0, 0, cam);
  float elapsedTime = (millis()/1000 - lastCapture);
  
  if(elapsedTime > timeInt){
    lastCapture = millis()/1000;
    captureImages();
  }
  
}


void mouseClicked() { 
  start = !start;
  //captureImages();
}

void captureImages(){
  if(start){
    if(img1 >= 0 && img1 < 10){
        cam1.save("C:/Users/jack.boland/Documents/ProtoA_" + "0000" + Integer.toString(img1) + ".png");
        img1++;
        cam2.save("C:/Users/jack.boland/Documents/ProtoB_" + "0000" + Integer.toString(img2) + ".png");
        img2++;
//        cam3.save("C:/Users/jack.boland/Documents/ProtoC_" + "0000" + Integer.toString(img3) + ".png");
//        img3++;
//        cam4.save("C:/Users/jack.boland/Documents/ProtoD_" + "0000" + Integer.toString(img4) + ".png");
//        img4++;
    }
     if(img1 >= 10 && img1 < 100){
        cam1.save("C:/Users/jack.boland/Documents/ProtoA_" + "000" + Integer.toString(img1) + ".png");
        img1++;
        cam2.save("C:/Users/jack.boland/Documents/ProtoB_" + "000" + Integer.toString(img2) + ".png");
        img2++;
//        cam3.save("C:/Users/jack.boland/Documents/ProtoC_" + "000" + Integer.toString(img3) + ".png");
//        img3++;
//        cam4.save("C:/Users/jack.boland/Documents/ProtoD_" + "000" + Integer.toString(img4) + ".png");
//        img4++;
    }
    if(img1 >= 100 && img1 < 1000){
        cam1.save("C:/Users/jack.boland/Documents/ProtoA_" + "00" + Integer.toString(img1) + ".png");
        img1++;
        cam2.save("C:/Users/jack.boland/Documents/ProtoB_" + "00" + Integer.toString(img2) + ".png");
        img2++;
//        cam3.save("C:/Users/jack.boland/Documents/ProtoC_" + "00" + Integer.toString(img3) + ".png");
//        img3++;
//        cam4.save("C:/Users/jack.boland/Documents/ProtoD_" + "00" + Integer.toString(img4) + ".png");
//        img4++;
    }
    if(img1 >= 1000 && img1 < 10000){
        cam1.save("C:/Users/jack.boland/Documents/ProtoA_" + "0" + Integer.toString(img1) + ".png");
        img1++;
        cam2.save("C:/Users/jack.boland/Documents/ProtoB_" + "0" + Integer.toString(img2) + ".png");
        img2++;
//        cam3.save("C:/Users/jack.boland/Documents/ProtoC_" + "0" + Integer.toString(img3) + ".png");
//        img3++;
//        cam4.save("C:/Users/jack.boland/Documents/ProtoD_" + "0" + Integer.toString(img4) + ".png");
//        img4++;
    }
    if(img1 > 10000){
        cam1.save("C:/Users/jack.boland/Documents/ProtoA_" + Integer.toString(img1) + ".png");
        img1++;
        cam2.save("C:/Users/jack.boland/Documents/ProtoB_"  + Integer.toString(img2) + ".png");
        img2++;
//        cam3.save("C:/Users/jack.boland/Documents/ProtoC_"  + Integer.toString(img3) + ".png");
//        img3++;
//        cam4.save("C:/Users/jack.boland/Documents/ProtoD_"  + Integer.toString(img4) + ".png");
//        img4++;
    }
    
    
  }
}
