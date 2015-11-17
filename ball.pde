// This is the ball object
class Ball {
  float radius; 
  color ballColor;
  PVector ballP, ballV;

  Ball(float _radius, float _ballx, float _bally, float _ballvy, float _ballvx, color _ballc) {
    radius = _radius;
    ballColor = _ballc;
    ballP = new PVector(_ballx, _bally);
    ballV = new PVector(_ballvx, _ballvy);
  }

  void update() {
    fill(ballColor);
    ellipse(ballP.x, ballP.y, radius, radius);

    ballP.x += ballV.x; 
    ballP.y += ballV.y;
  }

  void playerCollision() {

  }

  void wallCollision() {
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

  // When the balls collide with eachother
  // void ballCollision(ArrayList<Ball> balls) {
  //   for (Ball other : balls) {
  //     if (other.ballx)
  //   }
  // }
}