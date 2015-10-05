Snowflake[] special;
void setup()
{
  noStroke();
  background(0);
  frameRate(30);
  size(500, 500);
  special = new Snowflake[50];
  for(int i = 0; i < special.length; i++)
  {
    special[i] = new Snowflake();
  }
}

void draw()
{
  for(int i = 0; i < special.length; i++)
  {
    special[i].lookDown();
    special[i].erase();
    special[i].move();
    special[i].wrap();
    special[i].show();
  }
}

void mouseDragged()
{
  fill(50, 0, 50);
  ellipse(mouseX, mouseY, 15, 15);
}

void keyPressed()
{
  if(key == ' ')
  {
    fill(0);
    rect(-25, -25, 525, 525);
    for(int i = 0; i < special.length; i++)
    {
      special[i].x = (int)(Math.random()*500);
      special[i].y = (int)(Math.random()*500);
    }
  }
}

class Snowflake
{
  int x, y, frame;
  boolean isMoving;
  Snowflake()
  {
    x = (int)(Math.random()*500);
    y = (int)(Math.random()*500);
    frame = (int)(Math.random()*2);
    isMoving = true;
  }

  void show()
  {
    if(frame == 0)
    {
      fill(255, 25, 0);
      ellipse(x, y, 10, 10);
      triangle(x + 5, y, x - 5, y, x, y - 20);
      fill(255, 255, 0);
      ellipse(x, y, 6, 6);
      triangle(x + 3, y, x - 3, y, x, y - 10);
    }
    else if(frame == 1)
    {
      fill(255, 25, 0);
      ellipse(x, y, 10, 10);
      triangle(x + 5, y, x - 5, y, x + 5, y - 15);
      fill(255, 255, 0);
      ellipse(x, y, 6, 6);
      triangle(x + 3, y, x - 3, y, x, y - 10);
    }
    else if(frame == 2)
    {
      fill(255, 25, 0);
      ellipse(x, y, 10, 10);
      triangle(x + 5, y, x - 5, y, x - 5, y - 15);
      fill(255, 255, 0);
      ellipse(x, y, 6, 6);
      triangle(x + 3, y, x - 3, y, x, y - 10);
    }
    frame++;
    if(frame > 2)
    {
      frame = 0;
    }
  }

  void lookDown()
  {
    if((y > -10 && y < 510) && get(x, y + 7) == color(50, 0, 50))
      isMoving = false;
    else
      isMoving = true;
  }

  void erase()
  {
      fill(0);
      ellipse(x, y - 7, 12, 28);
  }

  void move()
  {
    if(isMoving)
      y += 4;
  }
  
  void wrap()
  { 
    if(y > 505)
      y = -5;
  }   
}


