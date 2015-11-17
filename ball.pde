class Flock {
}

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


  void update(ArrayList<Ball> balls) {
    fill(ballColor);
    ellipse(ballP.x, ballP.y, radius, radius);

    ballP.x += ballV.x; 
    ballP.y += ballV.y;

    // ballCollision(balls);
    wallCollision();
  }

  void playerCollision() {
  }

  // Detect wall Collision
  void wallCollision() {
    // left and right walls
    if (ballP.x + radius/2 > width) {
      ballV.x *= -1;
      ballP.x = width - 1;
    } else if (ballP.x - radius/2 < 0) {
      ballV.x *= -1;
      ballP.x = 1;
    }

    // top and bottom walls
    if (ballP.y + radius/2 > height) {
      ballV.y *= -1;
      ballP.y = height - 1;
    } else if (ballP.y - radius/2 < 0) {
      ballV.y *= -1;
      ballP.y = 1;
    }
  }

  void playerTwoCollision(float _p2x, float _p2y, float _p2w, float _p2h) {
    
    if (ballP.x >= _p2x && ballP.x <= _p2x + _p2w) {
      
      if (ballP.y >= _p2y && ballP.y <= _p2y + _p2h) {
        
        println("boom");
      }
    }
  }
  // When the balls collide with eachother
}