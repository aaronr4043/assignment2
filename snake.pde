// C14396626 Aaron Renaghan Snake Game

int option = 0; // Used as a variable to see what the user wants 
int speed = 0; // Variable determines how often The snake moves forward once
int time = 0; // Counts time which is used in conjunction with Speed to determine when to move snake
int theta = 0; // Angles at which the snake may travel
boolean redo = true; // Used to make some things Loop
int foodX; //X Co Ord for food
int foodY; //Y Co Ord for food
int snakeLength = 5; //Length of the snake
int[] snakePartX = new int[2500]; //Array of X Co Ords
int[] snakePartY = new int[2500]; //Array of Y Co Ords
boolean run = true;
String score;


void setup() //Setup Declares the window size and calls functions which set variables
{
  size(500, 500);
  getFood();
  restart();
}//end setup

void draw() // Contains the menu and calls all the functions for the Snake Game
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
  }//end if
  
  else
  {
    if(run == true)
    {
      if(time == 0)
      {
        background(255);
      }
    
      time+=1;
      fill(255,0,0);
      stroke(0);
      rect(foodX,foodY,8,8);
      fill(0);
      stroke(0);
    
      if(time % speed == 0)
      {
        snakeMove();
        display();
        snakeAlive();
      }
      
      if(run==false)
      {
        background(255);
        fill(0);
        textSize(20);
        score = str(snakeLength-5);
        text("Your Score", width/2, height/10);
        text(score, width/2, (height/10)*2);
        text("Press 'M' To Return The Menu", width/2, (height/10)*8);
      }
    } //enf if
  }//end else
}//end draw

void display() // Function for Updating what is seen on screen 
{
   if (snakePartX[1]==foodX && snakePartY[1]==foodY)
    {
    snakeLength+=20;
    redo=true;
    while(redo)
    {
      getFood();
      for(int i=1;i<snakeLength;i++)
      {
        
        if (foodX==snakePartX[i] && foodY==snakePartY[i])
        {
          redo=true;
        }
        else
        {
          redo=false;
          i=2500;
        }
      }
    }
  }
  
  fill(0);
  rect(snakePartX[1],snakePartY[1],8,8);
  fill(255);
  rect(snakePartX[snakeLength],snakePartY[snakeLength],8,8);
}

void restart() // Resets all variables to default states 
{
  background(255);
  snakePartX[1]=250;
  snakePartY[1]=250;
  for(int i=2;i<2500;i++)
  {
    snakePartX[i]=0;
    snakePartY[i]=0;
  }
  getFood();
  
  snakeLength = 5;
  time = 0;
  theta = 0;
  redo = true;
  run = true;
}

void getFood() // Gets Co ords for food 
{
  foodX=10*(round(random(width/10)));
  foodY=10*(round(random(width/10)));
  
}

void snakeMove() //Moves the snakeparts in the correct angles chosen by the user
{
  for(int i=snakeLength; i>0; i--)
  {
    if(i!=1)
    {
      snakePartX[i]=snakePartX[i-1];
      snakePartY[i]=snakePartY[i-1];
    }//end if
    
    else
    {
      if(theta == 0)
      {
        snakePartX[1] = snakePartX[1] + (width/50);
      }//end if
      
      if(theta == 90)
      {
        snakePartY[1] = snakePartY[1] - (height/50);
      }//end if
      
      if(theta == 180)
      {
        snakePartX[1] = snakePartX[1] - (width/50);
      }//end if
      
      if(theta == 270)
      {
        snakePartY[1] = snakePartY[1] + (height/50);
      }//end if
    }//end else 
  }//end if
}//end snakeMove()

void snakeAlive()
{
  if(snakePartX[1]>(width) || snakePartX[1] < 0)
  {
    option = 4;
    run = false;
  }
    
  if(snakePartY[1]>(height) || snakePartY[1] <0)
  {  
    option = 4;
    run = false;
  }
  
  for(int i=snakeLength; i>1; i--)
  {
    if(snakePartX[1] == snakePartX[i] && snakePartY[1] == snakePartY[i])
    {
      option = 4;
      run = false;
    }
  }
}

void keyPressed() // Contains all the controls
{
  if (key == '1' && option==0)
  {
    option = 1;
    speed = 7;
  }//end if
  
  if (key == '2' && option==0)
  {
    option = 2;
    speed = 5;
  }//end if
  
  if (key == '3' && option==0)
  {
    option = 3;
    speed = 3;
  }//end if
  
  if (key == 'm')
  {
    option = 0;
    restart();
  }//end if
  
  if (key == 'w' && option>0 &&theta != 270)
  {
    theta = 90;
  }//end if
  
  if (key == 'a' && option>0 && theta != 0)
  {
    theta = 180;
  }//end if
  
  if (key == 's' && option>0 && theta != 90)
  {
    theta = 270;
  }//end if
  
  if (key == 'd' && option>0 && theta != 180)
  {
    theta = 0;
  }//end if
}//end KeyPress()