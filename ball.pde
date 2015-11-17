// This is the ball object
class Ball {
  float radius, ballx, bally, ballvx, ballvy; 
  color ballColor;

  Ball(float _radius, float _ballx, float _bally, float _ballvy, float _ballvx, color _ballc) {
    radius = _radius;
    ballx = _ballx;
    bally = _bally; 
    ballvx = _ballvx; 
    ballvy = _ballvy;
    ballColor = _ballc;
  }

  void update() {
    fill(ballColor);
    ellipse(ballx, bally, radius, radius);

    ballx += ballvx; 
    bally += ballvy;
  }

  void playerCollision() {

  }

  void wallCollision() {
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