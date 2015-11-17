// Object Array Lists
ArrayList<Ball> balls = new ArrayList<Ball>(); 

// Ball Object Variables
float radius;
float ballv;
color ballColor;
Paddle p1= new Paddle();

//player2
float p2x, p2y;

void setup() {
  
  size(800, 800);
  // Setup the ball class
  radius = 10;
  ballColor = color(255, 122, 133);
  ballv = 10;
<<<<<<< HEAD
  
=======

  p2x = width/2;
  p2y = 100;

>>>>>>> 77ff1eebdabc32f2dc9f6f334655033198da473e
  for (int i = 0; i < 10; i++) {
    balls.add(new Ball(radius, random(width), random(height), ballv, ballv, ballColor));
  }
}

void draw() {
  background(255);
  p1crtl();
  ballLogic(); 
  
  playerTwo();
  rect(p2x, p2y, 30, 30);
}

// To make our draw funciton cleaner
void ballLogic() {
  for (Ball ball : balls) {
    ball.update();
    ball.wallCollision();
    // ball.ballCollision(); 
  }
}

void playerTwo(){
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

void p1crtl(){
  p1.drawPlayer();
  p1.update();
  p1.hitCheck();
  p1.pMove();
}