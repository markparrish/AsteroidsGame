public class Bullet extends Floater
{
  public int mySize;
  
  public Bullet(Spaceship theShip) 
  {
    mySize = 7;
    
    myCenterX = theShip.myCenterX;
    myCenterY = theShip.myCenterY;
    myXspeed = theShip.myXspeed;
    myYspeed = theShip.myYspeed;
    myPointDirection = theShip.myPointDirection;
    
    accelerate(6.0);
  }
  
  public void move()
  {
    myCenterX += myXspeed;
    myCenterY += myYspeed;
  }
  
  public void show()
  {
    fill(255, 0, 0);
    noStroke();
    ellipse((float)myCenterX, (float)myCenterY, (float)mySize, (float)mySize);
  }
}
