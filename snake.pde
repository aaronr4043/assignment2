// C14396626 Aaron Renaghan Snake Game

void setup()
{
  size(500, 500);
}

int option = 0; // Used as a variable to see what the user wants 
int speed = 0; // Variable determines how often The snake moves forward once
int time = 0; // Counts time which is used in conjunction with Speed to determine when to move snake

void draw()
{
  if (option == 0)
  {
    background(255);
    stroke(0);
    fill(0);
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
    time ++;
    
    if (option == 1)
    {
      background(45);
      speed = 7;
    }
  
    if (option == 2)
    {
      background(90);
      speed = 5;
    }
  
    if (option == 3)
    {
      background(145);
      speed = 3;
    }
    
    if(frameRate%time == speed)
    {
      //Main Snake Game Goes In Here
    }
  }
}

void keyPressed()
{
  if (key == '1' && option==0)
  {
    option = 1;
  }
  
  if (key == '2' && option==0)
  {
    option = 2;
  }
  
  if (key == '3' && option==0)
  {
    option = 3;
  }
  
  if (key == 'm')
  {
    option = 0;
  }
}

void restart()
{
  //Reset all varaiables to the default values
  time = 0;
}