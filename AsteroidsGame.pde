Spaceship spaceship;
ArrayList<Asteroid> asteroids;
ArrayList<Bullet> bullets;
Star[] stars = new Star[200];
boolean wIsPressed, aIsPressed, dIsPressed;


public void setup() 
{
  spaceship = new Spaceship();
  
  asteroids = new ArrayList<Asteroid>();
  
  for(int i = 0; i < 5; i++)
  {
    asteroids.add(new Asteroid((Math.random()*4)-2));
  }
  
  bullets = new ArrayList<Bullet>();
  
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
  
  for(int i = 0; i < bullets.size(); i++)
  {
    bullets.get(i).move();
    
    if(asteroids.size() != 0)
    {
      for(int j = 0; j < asteroids.size(); j++)
      {
        if(dist((float)bullets.get(i).myCenterX, (float)bullets.get(i).myCenterY, (float)asteroids.get(j).myCenterX, (float)asteroids.get(j).myCenterY) < 30)
        {
          bullets.remove(i);
          asteroids.remove(j);
          break;
        }
        else
        {
          bullets.get(i).show();
        }
      }
    }
    else
    {
      bullets.get(i).show();
    }
  }
  
  for(int i = 0; i < asteroids.size(); i++)
  {
    asteroids.get(i).move();
    
    if(dist((float)asteroids.get(i).myCenterX, (float)asteroids.get(i).myCenterY, (float)spaceship.myCenterX, (float)spaceship.myCenterY) < 40)
    {
      asteroids.remove(i);
      i--;
    }
    else
    {
      asteroids.get(i).show();
    }
  }
  
  spaceship.show();
  spaceship.move();
  
  fill(255);
  textSize(20);
  text("X Coordinate: " + nf((float)spaceship.myCenterX, 0, 2) +
    "\nY Coordinate: " + nf((float)spaceship.myCenterY, 0, 2) + 
    "\nDirection: " + nf((float)spaceship.myPointDirection, 0, 0) + 
    "\nHorizontal Speed: " + nf((float)spaceship.myXspeed, 0, 2) + 
    "\nVertical Speed: " + nf((float)spaceship.myYspeed, 0, 2), 10, 25);
}

public void keyPressed()
{
  if(key == 'w')
    wIsPressed = true;
  else if(key == 'a')
    aIsPressed = true;
  else if(key == 'd')
    dIsPressed = true;
  else if(key == ' ')
     bullets.add(new Bullet(spaceship));
  else if(key == 's')
  {
    spaceship.hyperspace();
    
    asteroids = new ArrayList<Asteroid>();
    
    for(int i = 0; i < 5; i++)
    {
      asteroids.add(new Asteroid((Math.random()*4)-2));
    }
    
    for(int i = 0; i < stars.length; i++)
    {
      stars[i] = new Star();
    }
  }
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
