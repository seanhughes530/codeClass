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
  }

  void collision() {

  }
}