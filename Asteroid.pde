class Asteroid extends Floater
{
  double myRotSpeed;
  private int directionalMaxSpeed = 2;
  
  Asteroid(double rot_)
  {
    super();
    
    myRotSpeed = rot_;
    corners = 5;
    xCorners = new int[]{-25, -15, 10, 31, -12};
    yCorners = new int[]{3, 32, 25, -22, -27};
    myColor = 155;
    myPointDirection = 0;
    
    double sector = Math.random();
    if(sector < 0.25) // top of screen
    {
      myCenterX = Math.random()*width;
      myCenterY = -50;
      
      myXspeed = (Math.random() * directionalMaxSpeed*2) - (directionalMaxSpeed/2);
      myYspeed = Math.random() * (-1 * directionalMaxSpeed);
    }
    else if(sector >= 0.25 && sector < 0.5) // right of screen
    {
      myCenterX = width+50;
      myCenterY = Math.random()*height;
      
      myXspeed = Math.random() * (-1 * directionalMaxSpeed);
      myYspeed = (Math.random() * directionalMaxSpeed*2) - (directionalMaxSpeed/2);
    }
    else if(sector >= 0.5 && sector < 0.75) // bottom of screen
    {
      myCenterX = Math.random()*width;
      myCenterY = height+50;
      
      myXspeed = (Math.random() * directionalMaxSpeed*2) - (directionalMaxSpeed/2);
      myYspeed = Math.random() * directionalMaxSpeed;
    }
    else // left of screen
    {
      myCenterX = -50;
      myCenterY = Math.random()*height;
      
      myXspeed = Math.random() * directionalMaxSpeed;
      myYspeed = (Math.random() * directionalMaxSpeed*2) - (directionalMaxSpeed/2);
    }
     
    System.out.println(sector + " " + myXspeed + " " + myYspeed);
  }
  
  public void move()
  {
    myCenterX += myXspeed;
    myCenterY += myYspeed;
    
    turn(myRotSpeed);
  }
}
