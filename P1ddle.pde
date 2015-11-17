class Paddle {
  
  float paddleX, paddleY, newPX, newPY, speedX, speedY, pWidth, pHeight;
  color p1Color;
  PVector f = new PVector(0, 0);

  Paddle() {

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
      if (key == 'w' || key == 'W') {
        speedY += .1f;
        paddleY -= speedY;
      }

      if (key == 's' || key == 'S') {
        speedY += .1f;
        paddleY += speedY;
      }

      if (speedY >=5) {
        speedY = 5;
      } else { 
        speedY *= 0;
      }

      if (key == 'a' || key == 'A') {

        speedX += .1f;
        paddleX -= speedX;
      }

      if (key == 'd' || key == 'D') {

        speedX += .1f;
        paddleX += speedX;
      }

      if (speedX >= 5) {
        speedX -= .1f;
      }
    }
  }


  //if ( keyPressed == false &&((key == 'a' )|| (key == 'A')|| (key == 'd') || (key == 'D')) ) {
  //  speedX = 0;
  //}

  void catchThrow() {
  }

  void hitCheck() {

    if (paddleX <=0)paddleX = 0;
    if (paddleY <=0)paddleY = 0;
    if (paddleX >=width-pWidth)paddleX = width-pWidth;
    if (paddleY >=height-pHeight)paddleY = height-pHeight;
  }
}