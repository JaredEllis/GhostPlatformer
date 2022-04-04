class Health
{
  float x, y, w, h;
  int health;
  color green, yellow, red;
  
  Health(float xpos, float ypos)
  {
    x = xpos;
    y = ypos;
    h = 10;
    green = color(100, 150, 100);
    yellow = color(150, 150, 100);
    red = color(150, 100, 100);
  }
  
  void display()
  {
    w = health;
    
    if (health > 60)
    {
      fill(green);
    }
    else if (health >  30)
    {
      fill(yellow);
    }
    else if (health > 0)
    {
       fill(red);
    }
    rectMode(CORNER);
    rect(x, y, w/2, h);
  }
  
  void update(float newX, float newY)
  {
    x = newX;
    y = newY;
  }
  
  void setHealth(int healthAmount)
  {
    health = healthAmount;
  }
}
