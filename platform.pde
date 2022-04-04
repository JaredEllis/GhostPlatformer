class Platform
{
  float x, y, w, h;
  
  Platform(float xpos, float ypos, int sizeW)
  {
    x = xpos;
    y = ypos;
    w = sizeW;
    h = 20;
  }
  
  void display()
  {
    fill(0);
    rect(x, y, w, h);
  }
}
