class Star //note that this class does NOT extend Floater
{
  float xPos, yPos;
  float size;
  
  Star()
  {
    xPos = (float)(Math.random()*width);
    yPos = (float)(Math.random()*height);
    size = (float)(Math.random()*5+1);
  }
  
  void show()
  {
    fill(255);
    ellipse(xPos, yPos, size, size);
  }
}
