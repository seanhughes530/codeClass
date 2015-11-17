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
  ballColor = color(255, 122, 133);
  ballv = 10;

  for (int i = 0; i < 10; i++) {
    balls.add(new Ball(radius, random(width), random(height), ballv, ballv, ballColor));
  }
}

public void draw() {
  background(255);
  
  ballLogic(); 
}


public void ballLogic() {
  for (Ball ball : balls) {
    ball.update();
    ball.wallCollision();
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

    ballx += ballvx; 
    bally += ballvy;
  }

  public void playerCollision() {

  }

  public void wallCollision() {
    // left and right walls
    if (ballx + radius/2 > width) {
      ballx = width - 1;
      ballvx *= -1;
    } else if (ballx - radius/2 < 0) {
      ballx = 1; 
      ballvx *= -1;
    }

    // top and bottom walls
    if (bally + radius/2 > height) {
      bally = height - 1;
      ballvy *= -1;
    } else if (bally - radius/2 < 0) {
      bally = 1; 
      ballvy *= -1;
    }


  }
}
  public void settings() {  size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "codeClass" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
