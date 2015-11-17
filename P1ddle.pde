class Paddle {
  float paddleX, paddleY, newPX, newPY, speedX, speedY, pWidth, pHeight;
  color p1Color;
  PVector f = new PVector(1, 1);
  
  Paddle(){
    smooth();
    noStroke();
    speedX = .5f;
    speedY = .5f;
    pWidth = 10;
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
    
  }
  void pMove() {
     if (keyPressed) {
       if (key == 'w' || key == 'W'){
         paddleY -= 10;
       }
       if (key == 's' || key == 'S'){
         paddleY += 10;
       }
       if (key == 'a' || key == 'A'){
         paddleX -= 10;
       }
       if (key == 'd' || key == 'D'){
         paddleX += 10;
       }
       
     }    
  }
  void catchThrow() {
  }

  void hitCheck() {
  }
}