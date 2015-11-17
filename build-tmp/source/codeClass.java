import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class codeClass extends PApplet {

// Object Array Lists
ArrayList<Ball> balls = new ArrayList<Ball>(); 

// Ball Object Variables
float radius;
float ballv;
int ballColor; 

public void setup() {
  

  // Setup the ball class
  radius = 10;
  ballColor = color(255);
  ballv = 10;

  for (int i = 0; i < 10; i++) {
    balls.add(new Ball(radius, random(width), random(height), ballv, ballv, ballColor));
  }
}

public void draw() {

  for (Ball ball : balls) {
    ball.update();
  }
  
}
// This is the ball object
class Ball {
  float radius, ballx, bally, ballvx, ballvy; 
  int ballColor;

  Ball(float _radius, float _ballx, float _bally, float _ballvy, float _ballvx, int _ballc) {
    radius = _radius;
    ballx = _ballx;
    bally = _bally; 
    ballvx = _ballvx; 
    ballvy = _ballvy;
    ballColor = _ballc;
  }

  public void update() {
    fill(ballColor);
    ellipse(ballx, bally, radius, radius);
  }

  public void collision() {

  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "codeClass" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
