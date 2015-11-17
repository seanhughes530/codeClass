class Paddle {
  float paddleX, paddleY, newPX, newPY, speed, pWidth, pHeight;
  color p1Color;
  PVector p1Pos;
  
  void setup(){
    smooth();
    noStroke();
    speed = 0f;
    pWidth = 10f;
    pHeight = 50;
    paddleX = pWidth;
    paddleY = (height/2) - (pHeight/2);
    p1Color = (#8EBEFF);
  }
  void update() {
    drawPlayer();
    pMove();
    catchThrow();
    hitCheck();
  }
  void drawPlayer() {
        
    fill(p1Color);
    rect(paddleX, paddleY, pWidth, pHeight);
    //rect(paddleX, paddleY, pWidth, pHeight);
  }
  void pMove() {
     
  }
  void catchThrow() {
  }

  void hitCheck() {
  }
}