# Week $argv

first didn't work : json w all keys in consecutive order.
![badkeys](/documentationAssets/badBlackKeys.png)
this didn't work :
``` processing

import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;        // Data received from the serial port

JSONArray tones;



void setup() 
{
  size(800, 300);

  //frequencies from https://pages.mtu.edu/~suits/notefreqs.html
  tones = loadJSONArray("tones.json");

  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);

  background(120);
}

Float w = (800.0 - 40.0) / 14.0;
  int y = 20, 
    h = 260;

void draw() {

  for (int i = 0; i < tones.size(); i++) {
    JSONObject tone = tones.getJSONObject(i);
    String keyColor = tone.getString("color");
    Float x = tone.getFloat("x");
    Float freq = tone.getFloat("freq");
    tone.setBoolean("selected", false);
    switch (keyColor) {
    case "white" : 
      fill(255);
      if(mouseOverKey() == i) {
        fill(50);
        myPort.write(str(freq));
      }
      rect(x, y, w, h);
      break;
    case "black" :
      fill(0);
      rect(x, y, w / 2, h / 2);
      break;
    }
  }


}

int mouseOverKey() {
  if ((mouseX < 20) || (mouseX > 780) || (mouseY < 20) || (mouseY > 280)) {
    //outside bounds of piano - return -1 to skip highlighting and playing tones
    return -1;
    //if we get past the first if, we know y is within the bounds of all white keys and can be ignored when checking those keys
  } else if ((mouseX >= 20) && (mouseX < w + 20)) { 
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
  } else if ((mouseX >= 14 * w + 20) && (mouseX < 20 + w * 15)) {
    return 14;
  } else {
    return -2;
  }
}

boolean mouseOverRect() { // Test if mouse is over square
  return ((mouseX >= 50) && (mouseX <= 150) && (mouseY >= 50) && (mouseY <= 150));
}

```

```c++
void setup() {
  pinMode(9, OUTPUT); 
  Serial.begin(9600); 
}

void loop() {
  while (Serial.available()) {
    tone(9, float(Serial.read()));
  }
  
}
```

this also isn't working, but i think i found a fix ?

```processing
if ((mouseX < 20) || (mouseX > 780) || (mouseY < 20) || (mouseY > 280)) {
    //outside bounds of piano - return -1 to skip highlighting and playing tones
    return -1;
    //if we get past the first if, we know y is within the bounds of all white keys and can be ignored when checking those keys
  } else if ((mouseX >= 3/4 * w + 20) && (mouseX < 20 + w * 5/4) && (mouseY < 20 + h / 2)) { 
    return 100;
  } else if ((mouseX >= 7/4 * w + 20) && (mouseX < 20 + w * 9/4) && (mouseY < 20 + h / 2)) {
    return 101; 
  } else if ((mouseX >= 15/4 * w + 20) && (mouseX < 20 + w * 17/4) && (mouseY < 20 + h / 2)) {
    return 102;
  } else if ((mouseX >= 19/4 * w + 20) && (mouseX < 20 + w * 21/4) && (mouseY < 20 + h / 2)) {
    return 103;
  } else if ((mouseX >= 23/4 * w + 20) && (mouseX < 20 + w * 25/4) && (mouseY < 20 + h / 2)) {
    return 104;
  } else if ((mouseX >= 31/4 * w + 20) && (mouseX < 20 + w * 33/4) && (mouseY < 20 + h / 2)) {
    return 105;
  } else if ((mouseX >= 35/4 * w + 20) && (mouseX < 20 + w * 37/4) && (mouseY < 20 + h / 2)) {
    return 106;
  } else if ((mouseX >= 39/4 * w + 20) && (mouseX < 20 + w * 41/4) && (mouseY < 20 + h / 2)) {
    return 107;
  } else if ((mouseX >= 43/4 * w + 20) && (mouseX < 20 + w * 45/4) && (mouseY < 20 + h / 2)) {
    return 108;
  } else if ((mouseX >= 47/4 * w + 20) && (mouseX < 20 + w * 49/4) && (mouseY < 20 + h / 2)) {
    return 109;
  } else if ((mouseX < w + 20)) { 
    return 0;
  } else if ((mouseX >= w + 20) && (mouseX < 20 + w * 2)) {
    return 1;
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
  } else if ((mouseX >= 14 * w + 20) && (mouseX < 20 + w * 15)) {
    return 14;
  } else {
    return -2;
  }
}
```


added this to test mouse positions and notice that switching the order of the equation changed it. w * 3/4 + 20 gives 60 which is correct for the first key; howerver, 3/4 * w + 20 gives 20 which is causing the issues.

```processing
  int t = w * 3/4 + 20;
 println(t + " | " + mouseX);
```
