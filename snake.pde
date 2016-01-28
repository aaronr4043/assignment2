// C14396626 Aaron Renaghan Snake Game

void setup()
{
  size(500, 500);
}

int option = 0;

void draw()
{
  if (option == 0)
  {
    background(0);
    stroke(255);
    textSize(height/10);
    textAlign(CENTER);
    text("Welcome to Snake", width/2, height/4);
    
    textSize(10);
    text("Press 1 for Slug Mode", width/4, (height/4)*3);
    text("Press 2 for Snake Mode", (width/4)*2, (height/4)*3);
    text("Press 3 for Python Mode", (width/4)*3, (height/4)*3);
  }
  
  else
  {
    if (option == 1)
    {
      background(45);
    }
  
    if (option == 2)
    {
      background(90);
    }
  
    if (option == 3)
    {
      background(145);
    }
  }
}

void keyPressed()
{
  if (key == '1')
  {
    option = 1;
  }
  
  if (key == '2')
  {
    option = 2;
  }
  
  if (key == '3')
  {
    option = 3;
  }
}

void restart()
{
  //Reset all varaiables to the default values
}