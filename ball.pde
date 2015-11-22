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
    ////hit top of box
    //if ((ballP.x >= _p2x) && (ballP.x <= _p2x + _p2w) && () && (ballP.y >= _p2y)){
    //  ballV.y *= -1;
    //} 
    ////hit bottom of box
    //if ((ballP.x >= _p2x) && (ballP.x <= _p2x + _p2w) && (ballP.y <= _p2y + _p2h)){
    //  ballV.y *= -1;
    //}
    ////hit right side
    //if ((ballP.y >= _p2y) && (ballP.y <= _p2y + _p2h) && (ballP.x >= _p2x)){
    //  ballV.x *= -1;
    //}
    ////hit left side
    //if ((ballP.y >= _p2y) && (ballP.y <= _p2y + _p2h) && (ballP.x <= _p2x + _p2w)){
    //  ballV.x *= -1;
    //}
    
    if (ballP.x >= _p2x && ballP.x <= _p2x + _p2w) {    
     if (ballP.y >= _p2y && ballP.y <= _p2y + _p2h) {
       ballV.x *= -1;
       //ballV.y *= -1;
       println("boom");
     }
    }
  }
  void playerOneCollision(float _p1x, float _p1y, float _p1w, float _p1h) {
    _p1x = p1.paddleX;
    _p1y = p1.paddleY;
    _p1w = p1.pWidth;
    _p1h = p1.pHeight;
    
    if (ballP.x >= _p1x && ballP.x <= _p1x + _p1w) {    
     if (ballP.y >= _p1y && ballP.y <= _p1y + _p1h) {
       ballV.x *= -1;
       //ballV.y *= -1;
       println("boom");
     }
    }
  }
  // When the balls collide with eachother
}