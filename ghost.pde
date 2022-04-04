class Ghost
{
  PImage i;
  float x, y, w, h;
  float dx, dy;
  float speed;
  int direction;
  
  boolean isLeft, isRight, isUp;
  
  boolean grounded;
  float g;
  
  int health;
  
  Ghost(float xpos, float ypos)
  {
    x = xpos;
    y = ypos;
    w = 50;
    h = 50;
    i = loadImage("ghost.png");
    
    direction = 1;
    dx = 8;
    speed = 0;
    
    grounded = false;
    g = 0.6;
    
    health = 100;
  }
  
  void display()
  {
    pushMatrix();
    translate(x, y);
    scale(direction, 1);
    image(i, 0, 0, w, h);
    popMatrix();
  }
  
  void update()
  {
    x += speed;
    
    if (isRight)
    {
      speed = dx;
      direction = -1;
    }
    
    if (isLeft)
    {
      speed = -dx;
      direction = 1;
    }
    
    if (isUp && grounded)
    {
      dy = -10;
      grounded = false;
    }
    
    if (!grounded)
    {
      dy += g;
    }
    
    if (y > height)
    {
      y = 0;
      dy = 0;
      if (health > 0) health -= 10;
    }
    
    y += dy;
    
    speed *= 0.8;
  }
  
  void groundCheck(float newY, float newH)
  {
    dy = 0;
    grounded = true;
    y = newY-newH/2-h/2;
  }
  
  boolean setMove(char k, boolean b)
  {
    switch(k)
    {
      case 'a':
        return isLeft = b;
      case 'd':
        return isRight = b;
      case 'w':
        return isUp = b;
      default:
        return b;
    }
  }
}
