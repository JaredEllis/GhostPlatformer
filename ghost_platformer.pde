Ghost ghost;
Platform platform;

Platform platforms[] = {};

void setup()
{
  size(600, 600);
  imageMode(CENTER);
  rectMode(CENTER);
  frameRate(60);
  
  ghost = new Ghost(300, 300);
  
  platforms = (Platform[]) append(platforms, new Platform(300, 300, 100));
  platforms = (Platform[]) append(platforms, new Platform(100, 300, 100));

}

void draw()
{
  background(50);
  rectMode(CENTER);
  
  ghost.display();
  ghost.update();
  
  displayPlatforms();
  
  checkPlatformCollision();
}

boolean objectIntersection(Ghost r1, Platform r2)
{
  float distX = abs(r1.x - r2.x);
  float distY = abs(r1.y - r2.y);
  
  float combHalfW = r1.w / 2 + r2.w / 2;
  float combHalfH = r1.h / 2 + r2.h / 2;
  
  if (distX < combHalfW)
  {
    if (distY < combHalfH)
    {
      return true;
    }
  }
  return false;
}

void displayPlatforms()
{
  for (int i = 0; i < platforms.length; i++)
  {
    platforms[i].display();
  }
}

void checkPlatformCollision()
{
  for (int i = 0; i < platforms.length; i++)
  {
    if (objectIntersection(ghost, platforms[i]))
    {
      ghost.groundCheck(platforms[i].y, platforms[i].h);
      break;
    }
    else
    {
      ghost.grounded = false;
    }
  }
}

void keyPressed()
{
  ghost.setMove(key, true);
}

void keyReleased()
{
  ghost.setMove(key, false);
}
