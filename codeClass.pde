// Object Array Lists
ArrayList<Ball> balls = new ArrayList<Ball>(); 

// Ball Object Variables
float radius;
float ballv;
color ballColor;
Paddle p1= new Paddle();

void setup() {
  
  size(800, 800);
  // Setup the ball class
  radius = 10;
  ballColor = color(255, 122, 133);
  ballv = 10;
  
  for (int i = 0; i < 10; i++) {
    balls.add(new Ball(radius, random(width), random(height), ballv, ballv, ballColor));
  }
}

void draw() {
  background(255);
  p1crtl();
  ballLogic(); 
}


void ballLogic() {
  for (Ball ball : balls) {
    ball.update();
    ball.wallCollision();
  }
}

void p1crtl(){
  p1.drawPlayer();
  p1.update();
  p1.hitCheck();
  p1.pMove();
}