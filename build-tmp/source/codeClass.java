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
Paddle p1= new Paddle();

//player2
float p2x, p2y, p2w, p2h;

public void setup() {
  
  
  // Setup the ball class
  radius = 10;
  ballColor = color(255, 122, 133);
  ballv = 2;

  p2x = width/2;
  p2y = 100;
  p2w = 30;
  p2h = 30;

  for (int i = 0; i < 10; i++) {
    balls.add(new Ball(radius, random(width), random(height), ballv, ballv, ballColor));
  }
}

public void draw() {
  background(255);
  p1crtl();
  ballLogic(); 
  
  for(Ball ball : balls){
    ball.playerTwoCollision(p2x, p2y, p2w, p2h);
  }
  playerTwo();
  rect(p2x, p2y, p2w, p2h);
}

// To make our draw funciton cleaner
public void ballLogic() {
  for (Ball ball : balls) {
    ball.update(balls);
  }
}

public void playerTwo(){
  if(keyPressed){
    if(key == 'i'){
      p2y -= 10;
    }
    if(key == 'k'){
      p2y += 10;
    }
    if(key == 'j'){
      p2x -= 10;
    }
    if(key == 'l'){
      p2x += 10;
    }
  }
}

public void p1crtl(){
  p1.drawPlayer();
  p1.update();
  p1.hitCheck();
  p1.pMove();
}
class Paddle {
  float paddleX, paddleY, newPX, newPY, speed, pWidth, pHeight;
  int p1Color;
  PVector p1Pos;
  
  public void setup(){
    speed = 0f;
    pWidth = 10f;
    pHeight = 50;
    paddleX = pWidth;
    paddleY = (height/2) - (pHeight/2);
    p1Color = (0xff8EBEFF);
  }
  public void update() {
    drawPlayer();
    pMove();
    catchThrow();
    hitCheck();
  }
  public void drawPlayer() {
        
    fill(p1Color);
    rect(paddleX, paddleY, pWidth, pHeight);
    //rect(paddleX, paddleY, pWidth, pHeight);
  }
  public void pMove() {
    
  }
  public void catchThrow() {
  }

  public void hitCheck() {
  }
}
class Flock {

}

// This is the ball object
class Ball {
  float radius; 
  int ballColor;
  PVector ballP, ballV;

  Ball(float _radius, float _ballx, float _bally, float _ballvy, float _ballvx, int _ballc) {
    radius = _radius;
    ballColor = _ballc;
    ballP = new PVector(_ballx, _bally);
    ballV = new PVector(_ballvx, _ballvy);
  }

  public void update(ArrayList<Ball> balls) {
    fill(ballColor);
    ellipse(ballP.x, ballP.y, radius, radius);

    ballP.x += ballV.x; 
    ballP.y += ballV.y;

    ballCollision(balls);
    wallCollision();
  }

  public void playerCollision() {

  }

  // Detect wall Collision
  public void wallCollision() {
    // left and right walls
    if (ballP.x + radius/2 > width) {
      ballP.x = width - 1;
      ballV.x *= -1;
    } else if (ballP.x - radius/2 < 0) {
      ballP.x = 1; 
      ballV.x *= -1;
    }

    // top and bottom walls
    if (ballP.y + radius/2 > height) {
      ballP.y = height - 1;
      ballV.y *= -1;
    } else if (ballP.y - radius/2 < 0) {
      ballP.y = 1; 
      ballV.y *= -1;
    }
  }
  
  public void playerTwoCollision(float _p2x, float _p2y, float _p2w, float _p2h){
   if ((ballP.x >= _p2x) && (ballP.x <= _p2x + _p2w)){
     if ((ballP.y >= _p2y) && (ballP.y <= _p2y + _p2h)){
       println("boom");
     }
   }
  }

  // When the balls collide with eachother
  public void ballCollision(ArrayList<Ball> balls) {
    for (Ball other : balls) {
      float d = PVector.dist(ballP, other.ballP);
      if (d < 1) {
        other.ballV.x *= -1;
        other.ballV.y *= -1;
      }
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
