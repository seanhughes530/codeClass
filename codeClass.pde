// Object Array Lists
ArrayList<Ball> balls = new ArrayList<Ball>(); 

// Ball Object Variables
float radius;
float ballv;
color ballColor;
Paddle p1;

//player2
float p2x, p2y, p2w, p2h;

void setup() {

  size(800, 800);
  // Setup the ball class
  radius = 10;
  ballColor = color(255, 122, 133);
  ballv = 5;


  p1 = new Paddle();
  p2x = width/2;
  p2y = 100;
  p2w = 5;
  p2h = 40;

  for (int i = 0; i < 10; i++) {
    balls.add(new Ball(radius, random(width), random(height), ballv, ballv, ballColor));
  }
}

void draw() {
  background(255);

  p1.update();
  //playerCollide();
  ballLogic(); 

  for (Ball ball : balls) {
    ball.playerTwoCollision(p2x, p2y, p2w, p2h);
    ball.playerOneCollision(p1.paddleX,p1.paddleY,p1.pWidth,p1.pHeight);
  }

  playerTwo();
  rect(p2x, p2y, p2w, p2h);
}

// To make our draw funciton cleaner
void ballLogic() {
  for (Ball ball : balls) {
    ball.update(balls);
  }
}

void playerTwo() {
  if (keyPressed) {
    if (key == 'i') {
      p2y -= 10;
    }
    if (key == 'k') {
      p2y += 10;
    }
    if (key == 'j') {
      p2x -= 10;
    }
    if (key == 'l') {
      p2x += 10;
    }
  }

}

void playerCollide() {

 //// if Player 1 hits the left side of Player 2 they stop.

 //if (p1.paddleY > p2y - p1.pHeight && p1.paddleY + p1.pHeight < p2y + p2h + p1.pHeight && p1.paddleX  < p2x) {
    
 //  float savedSpeed = 0;
 //  float savedX;
 //  //float savedY;
 //  savedX = p1.paddleX;
 //  //savedY = p1.paddleY;

 //  if (p1.paddleX + p1.pWidth >= p2x) {
 //    savedSpeed = p1.speedX;
 //    p1.speedX = 0;
 //    p1.paddleX = savedX;
 //  } else {
 //    p1.speedX = savedSpeed;
 //    savedSpeed = 0;
 //  }
 //} 
  
 //// If Player 1 hits the right side of Player 2
 //else if (p1.paddleX <= p2x + p2w && p1.paddleY > p2y - p1.pHeight && p1.paddleY + p1.pHeight < p2y + p2h + p1.pHeight) {
 //  float savedSpeed = 0;
 //  float savedX;
 //  float savedY;
 //  savedX = p1.paddleX;
 //  savedY = p1.paddleY;
 //  if (p1.paddleX + p1.pWidth >= p2x) 
 //  {
 //    savedSpeed = p1.speedX;
 //    p1.speedX = 0;
 //  } else {
 //    p1.speedX = savedSpeed;
 //    savedSpeed = 0;
 //  }
 //  if (p1.paddleY + p1.pHeight > p2x && p1.paddleY > p2y && p1.paddleY < p2y + p2h) 
 //  {
 //    p1.speedX = 0;
 //  }
 //  if (p1.paddleY + p1.pWidth > p2x && p1.paddleY > p2y && p1.paddleY < p2y + p2h) 
 //  {
 //    p1.speedX = 0;
 //  }
 //}
}