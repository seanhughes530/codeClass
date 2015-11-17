// Object Array Lists
ArrayList<Ball> balls = new ArrayList<Ball>(); 

// Ball Object Variables
float radius;
float ballv;
color ballColor; 

void setup() {
  

  // Setup the ball class
  radius = 10;
  ballColor = color(255);
  ballv = 10;

  for (int i = 0; i < 10; i++) {
    balls.add(new Ball(radius, random(width), random(height), ballv, ballv, ballColor));
  }
}

void draw() {

  for (Ball ball : balls) {
    ball.update();
  }
  
}