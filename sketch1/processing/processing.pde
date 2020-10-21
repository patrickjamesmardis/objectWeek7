import processing.serial.*;

Serial myPort;

PFont myFont;
int w = 54, //width, 
  h = 260, //height, 
  y = 20;   //and y position of white keys

String mode = "hover"; //does the user want to hover on keys to play or click on keys to play? default to hover

Boolean playing = false; //nothing is playing when the sketch starts. will be used to tell arduino to run noTone()

void setup() { //set up canvas, serial port, and font (data/Avenir-Roman-20.vlw)
  size(796, 340);
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
  myFont = loadFont("Avenir-Roman-20.vlw");
  surface.setTitle("piano");
}

void draw() {
  background(120);
  int x = 20; //x position of first white key
  for (int i = 0; i < 14; i++) { //14 white keys to make
    fill(255);
    //check if the mouse is over the key
    //then if it is, are we in hover or click mode
    //if hover, playTone()
    //if click, check that mousePressed before playTone()
    if ((mouseOverKey() == i) && (((mode == "click") && (mousePressed)) || (mode == "hover"))) {
      playTone(i); //will change fill of rect to gray and tell arduino to play the tone
    }
    rect(x, y, w, h);
    x += w; //increment x by the width on each iteration to put the white keys directly beside each other
  }
  //x position of first balck key
  //it's width is half that of a white key
  //it should be centered on the edge where the first and second white keys meet
  //so it's x is 3/4 * width (of white key) after the first white key
  x = 20 + w * 3/4;  
  for (int i = 0; i < 10; i++) { //10 black keys to make
    fill(0);
    if ((mouseOverKey() == i + 100) && (((mode == "click") && (mousePressed)) || (mode == "hover"))) {
      playTone(i + 100); //will change fill of rect to gray and tell arduino to play the tone
    }
    if (i == 2 || i ==5 || i ==7) {
      //black keys aren't consistently spaced on a keyboard
      //first two then a gap then three then a gap then two ... then three
      //gap is size of white key width
      x += w;
    }
    rect(x, y, w/2, h/2); //half width and half height of white key
    x += w;
  }
  textFont(myFont);
  fill(0);
  text("play tone on: ", 20, 320);
  if (mode == "hover") {
    text("click", 210, 320);
    fill(#80ADA0); //selected mode is colored - others are black
    text("hover", 150, 320);
  } else {
    text("hover", 150, 320);
    fill(#80ADA0); //selected mode is colored - others are black
    text("click", 210, 320);
  }

  //once the mouse leaves a key tone should stop
  if (mouseOverKey() < 0) {
    playing = false;
  }

  //tell arduino when it shoudl stop playing ( noTone() )
  if (!playing) {
    myPort.write(-1);
  }
}

//playTone changes fill of the key being played and gives arduino the reference for tone
//parameter: int i - corresponds to the tone in arduino - white keys 0 - 13, black keys 100 - 109, noTone is antything else
void playTone(int i) {
  fill(50);
  myPort.write(i);
  playing = true;
}

int mouseOverKey() {
  //if statement first checks if the mouse is within the piano keyboard
  //returns an integer relative to the i value in the for loop when the key is created in draw()
  //black keys are checked first and return 100 + i
  //white keys are checked second and return i
  //returns -1 if outside the keyboard and -2 if it makes it all the way through the else ifs
  if ((mouseX < 20) || (mouseX > 776) || (mouseY < 20) || (mouseY > 280)) {
    //outside bounds of piano - return -1 to skip highlighting and playing tones
    return -1;
  } else if ((mouseX >= w * 3/4 + 20) && (mouseX < 20 + w * 5/4) && (mouseY < 20 + h / 2)) { 
    //check black keys first since they are smaller
    //checking white keys first would trigger the white key when hovering over a black key. 
    return 100;
  } else if ((mouseX >= w * 7/4 + 20) && (mouseX < 20 + w * 9/4) && (mouseY < 20 + h / 2)) {
    return 101;
  } else if ((mouseX >= w * 15/4 + 20) && (mouseX < 20 + w * 17/4) && (mouseY < 20 + h / 2)) {
    return 102;
  } else if ((mouseX >= w * 19/4 + 20) && (mouseX < 20 + w * 21/4) && (mouseY < 20 + h / 2)) {
    return 103;
  } else if ((mouseX >= w * 23/4 + 20) && (mouseX < 20 + w * 25/4) && (mouseY < 20 + h / 2)) {
    return 104;
  } else if ((mouseX >= w * 31/4 + 20) && (mouseX < 20 + w * 33/4) && (mouseY < 20 + h / 2)) {
    return 105;
  } else if ((mouseX >= w * 35/4 + 20) && (mouseX < 20 + w * 37/4) && (mouseY < 20 + h / 2)) {
    return 106;
  } else if ((mouseX >= w * 43/4 + 20) && (mouseX < 20 + w * 45/4) && (mouseY < 20 + h / 2)) {
    return 107;
  } else if ((mouseX >= w * 47/4 + 20) && (mouseX < 20 + w * 49/4) && (mouseY < 20 + h / 2)) {
    return 108;
  } else if ((mouseX >= w * 51/4 + 20) && (mouseX < 20 + w * 53/4) && (mouseY < 20 + h / 2)) {
    return 109;
  } else if ((mouseX < w + 20)) { 
    //getting through the first if statement and all the black keys allows us to ingore y 
    //and only focus on the x positions for white keys
    return 0;
  } else if ((mouseX >= w + 20) && (mouseX < 20 + w * 2)) {
    return 1;
  } else if ((mouseX >= 2 * w + 20) && (mouseX < 20 + w * 3)) {
    return 2;
  } else if ((mouseX >= 3 * w + 20) && (mouseX < 20 + w * 4)) {
    return 3;
  } else if ((mouseX >= 4 * w + 20) && (mouseX < 20 + w * 5)) {
    return 4;
  } else if ((mouseX >= 5 * w + 20) && (mouseX < 20 + w * 6)) {
    return 5;
  } else if ((mouseX >= 6 * w + 20) && (mouseX < 20 + w * 7)) {
    return 6;
  } else if ((mouseX >= 7 * w + 20) && (mouseX < 20 + w * 8)) {
    return 7;
  } else if ((mouseX >= 8 * w + 20) && (mouseX < 20 + w * 9)) {
    return 8;
  } else if ((mouseX >= 9 * w + 20) && (mouseX < 20 + w * 10)) {
    return 9;
  } else if ((mouseX >= 10 * w + 20) && (mouseX < 20 + w * 11)) {
    return 10;
  } else if ((mouseX >= 11 * w + 20) && (mouseX < 20 + w * 12)) {
    return 11;
  } else if ((mouseX >= 12 * w + 20) && (mouseX < 20 + w * 13)) {
    return 12;
  } else if ((mouseX >= 13 * w + 20) && (mouseX < 20 + w * 14)) {
    return 13;
  } else {
    return -2;
  }
}

void mouseClicked() {
  //check if the click is on top of "hover" or "click" and then change mode
  //will change fill of text and if user will hover or click on the key to play tone
  if ((mouseX >= 150) && (mouseX <= 200) && (mouseY >= 300)) {
    mode = "hover";
  } else if ((mouseX >= 210) && (mouseX <= 250) && (mouseY >= 300)) {
    mode = "click";
  }
}

void mouseReleased() {
  //check if we're in click mode and there is something playing
  //if both, then stop playing once mouse is released
  if ((mode == "click") && playing) {
    playing = false;
  }
}
