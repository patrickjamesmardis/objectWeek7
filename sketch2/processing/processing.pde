
import processing.serial.*;

Serial myPort;
float xSpeed = 0, 
  ySpeed = 0, 
  xPos = 400, 
  yPos = 400;
boolean bDown = false;
int filename = 1;
PShape[] shapes = new PShape[100];
void setup () {
  size(800, 800);

  myPort = new Serial(this, Serial.list()[2], 9600);
  myPort.bufferUntil('\n');

  background(50);
}

void draw () {
  fill(0);
  circle(xPos, yPos, 20);
  xPos += xSpeed;
  yPos += ySpeed;

  if (xPos > 800) {
    xPos = 800;
  } else if (xPos < 0) {
    xPos = 0;
  }
  if (yPos > 800) {
    yPos = 800;
  } else if (yPos < 0) {
    yPos = 0;
  }
}
void serialEvent (Serial myPort) {
  String xString = myPort.readStringUntil(' ');
  String yString = myPort.readStringUntil(' ');
  String bString = myPort.readStringUntil('\n');

  if (xString != null && yString != null && bString != null) {

    // trim off any whitespace:
    xString = trim(xString);
    yString = trim(yString);
    bString = trim(bString);
    // convert to float and map to a "speed"
    xSpeed = float(xString) - 14.5;
    ySpeed = float(yString) + 7.5;
    xSpeed = map(xSpeed, 0, 1023, -10, 10);
    ySpeed = map(ySpeed, 0, 1023, -10, 10);
    //is joystick pressed down
    if (float(bString) == 0) {
      save(filename + ".png");
    }
  }
}
