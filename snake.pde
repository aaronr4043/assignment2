// C14396626 Aaron Renaghan Snake Game

void setup()
{
  size(500, 500);
}

int option = 0; // Used as a variable to see what the user wants 
int speed = 0; // Variable determines how often The snake moves forward once
int time = 0; // Counts time which is used in conjunction with Speed to determine when to move snake
int foodX = round(random(width));
int foodY = round(random(height));
int snakeLength = 3;
int[] snakePartX = new int[1000];
int[] snakePartY = new int[1000];
int theta = 0;

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
    
    fill(255,65,0);
    stroke(0);
    rect(foodX,foodY,8,8);
    fill(0);
    stroke(0);
    
    stroke(0);
    fill(0);
    rect(snakePartX[1], snakePartY[1], (width/50), (height/50));
    fill(255);
    rect(snakePartX[snakeLength], snakePartY[snakeLength], (width/50), (height/50));
    
    if(frameRate%time == speed)
    {
      snakeMove();
    } 
  }
  
  println(theta);
  
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
  
  if (key == 'w' && option>0)
  {
    theta = 90;
  }
  
  if (key == 'a' && option>0)
  {
    theta = 180;
  }
  
  if (key == 's' && option>0)
  {
    theta = 270;
  }
  
  if (key == 'd' && option>0)
  {
    theta = 0;
  }
}

void restart()
{
  //Reset all varaiables to the default values
  time = 0;
}

void snakeMove()
{
  for(int i=0; i<snakeLength; i++)
  {
    if(i != 0)
    {
      snakePartX[i]=snakePartX[i-1];
      snakePartY[i]=snakePartY[i-1];
    }
    
    else
    {
      if(theta == 0) //send snake to the right
      {
        snakePartX[1] = snakePartX[1] + (width/50);
      }//end if
      
      if(theta == 0) //Send Snake Upwards
      {
        snakePartY[1] = snakePartY[1] - (height/50);
      }//end if
      
      if(theta == 0) //Send snake to the left
      {
        snakePartX[1] = snakePartX[1] - (width/50);
      }//end if
      
      if(theta == 0) //Send snake south
      {
        snakePartY[1] = snakePartY[1] + (height/50);
      }//end if
    }//end else
  }
}