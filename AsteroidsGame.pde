//your variable declarations here
Spaceship spaceship;
Star[] stars = new Star[200];
boolean wIsPressed, aIsPressed, dIsPressed;

public void setup() 
{
  spaceship = new Spaceship();
  
  size(600, 400);
  background(0);
  
  for(int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();
  }
}

public void draw() 
{
  background(0);
  spaceship.show();
  spaceship.move();
  
  if(wIsPressed)
    spaceship.accelerate(0.1);
  if(aIsPressed)
    spaceship.turn(-5);
  if(dIsPressed)
    spaceship.turn(5); 
    
  for(Star s : stars)
  {
    s.show();
  }
}

public void keyPressed()
{
  if(key == 'w')
    wIsPressed = true;
  else if(key == 'a')
    aIsPressed = true;
  else if(key == 'd')
    dIsPressed = true;
  else if(key == 's')
    spaceship.hyperspace();
}

public void keyReleased()
{
  if(key == 'w')
    wIsPressed = false;
  else if(key == 'a')
    aIsPressed = false;
  else if(key == 'd')
    dIsPressed = false;
}
