// C14396626 Aaron Renaghan Snake Game
//12/02/2016

import ddf.minim.*; // Loading in the Minim Library
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;

int option = 0; // Used as a variable to see what the user wants 
int speed = 0; // Variable determines how often The snake moves forward once
int time = 0; // Counts time which is used in conjunction with Speed to determine when to move snake
int theta = 0; // Angles at which the snake may travel
boolean redo = true; // Used to make some things Loop
boolean run = true; 
String score;
int score1;
//String temp;
AudioPlayer MGS; // Initiating the MGS Snake scream

Food food = new Food(10*(round(random(width/10))), 10*(round(random(width/10)))); // Initiating classes
Segments snake = new Segments();

void setup() //Setup Declares the window size and calls functions which set variables
{
  size(500, 500);
  food.getFood(); // getting the first instance of food
  restart(); // Initiates variables
  noCursor();

  minim = new Minim(this); // Loading the correct sound into MGS
  MGS = minim.loadFile("/data/MGS2.wav");
}//end setup

void draw() // Contains the menu and calls all the functions for the Snake Game
{ 
  if (option == 0) //drawing the Menu
  {
    background(255);
    stroke(0);
    fill(0);
    textSize(height/10);
    textAlign(CENTER);
    text("Welcome to Snake", width/2, height/4);

    fill(0);
    rect(snake.snakePartX[1]-20, snake.snakePartY[1], 8, 8); //Drawing the snake on the home screen
    rect(snake.snakePartX[1]-10, snake.snakePartY[1], 8, 8);
    rect(snake.snakePartX[1], snake.snakePartY[1], 8, 8);
    rect(snake.snakePartX[1]+10, snake.snakePartY[1], 8, 8);
    rect(snake.snakePartX[1]+20, snake.snakePartY[1], 8, 8);
    rect(snake.snakePartX[1]-20, snake.snakePartY[1]-20, 8, 8);
    rect(snake.snakePartX[1]-20, snake.snakePartY[1]-10, 8, 8);
    rect(snake.snakePartX[1]+20, snake.snakePartY[1]+10, 8, 8);
    rect(snake.snakePartX[1]+20, snake.snakePartY[1]+20, 8, 8);

    textSize(10);
    text("Press 1 for Slug Mode", width/4, (height/4)*3);
    text("Press 2 for Snake Mode", (width/4)*2, (height/4)*3);
    text("Press 3 for Python Mode", (width/4)*3, (height/4)*3);
  }//end if

  else
  {
    if (run == true)
    {
      if (time == 0)
      {
        background(255);
      }

      time+=1;
      fill(255, 0, 0);
      stroke(0);
      rect(food.foodX, food.foodY, 8, 8);
      fill(0);
      stroke(0);

      if (time % speed == 0) // Using a mod of framerate to determine when things move eg every 5 frames
      {
        snake.snakeMove();
        display();
        snake.snakeAlive();
      }

      if (run==false) // Game over screen
      {
        loadStats();
        
        background(255);
        fill(0);
        textSize(20);
        score1 = snake.snakeLength-5;
        text("Your Score", width/2, height/10);
        int number2 = Integer.parseInt(score);
        text(score1, width/2, (height/10)*2);
        
        if (score1 > number2) // If you beat the highscore this rewrites the text file
        {
          number2 = score1;
          String b = str(number2);
          String[] list = split(b, " ");
          saveStrings("record.txt", list);
        }

        text(floor(number2), width/2, (height/10)*6);
        text("Highscore is:", width/2, (height/10)*5);
        text("Press 'M' To Return The Menu", width/2, (height/10)*8);
      }
    } //enf if
  }//end else
}//end draw

void display() // Function for Updating what is seen on screen 
{
  if (snake.snakePartX[1]==food.foodX && snake.snakePartY[1]==food.foodY)
  {
    snake.snakeLength+=2;
    redo=true;
    while (redo)
    {
      food.getFood();
      for (int i=1; i<snake.snakeLength; i++)
      {

        if (food.foodX==snake.snakePartX[i] && food.foodY==snake.snakePartY[i])
        {
          redo=true;
        } else
        {
          redo=false;
          i=2500;
        }
      }
    }
  }

  fill(0); // Covering up the snake
  rect(snake.snakePartX[1], snake.snakePartY[1], 8, 8);
  fill(255);
  stroke(255);
  rect(snake.snakePartX[snake.snakeLength], snake.snakePartY[snake.snakeLength], 8, 8);
  
  stroke(0);
  line(0, 0, width, 0);
}

void restart() // Resets all variables to default states 
{
  background(255);
  snake.snakePartX[1]=250;
  snake.snakePartY[1]=250;
  for (int i=2; i<2500; i++)
  {
    snake.snakePartX[i]=0;
    snake.snakePartY[i]=0;
  }
  food.getFood();

  snake.snakeLength = 5;
  time = 0;
  theta = 0;
  redo = true;
  run = true;
}


void loadStats() // Reads in the initial stats
{
  String[] lines = loadStrings("record.txt");
  for (String line : lines) 
  {
     score=(line);
  }
}
void keyPressed() // Contains all the controls
{
  if (key == '1' && option==0)
  {
    option = 1;
    speed = 7; // Sets how frequently the snake updates position
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

  if (key == 'm'|| key == 'M' ) // Feturns Player to the menu
  {
    option = 0;
    restart();
  }//end if

  if (key == 'w' && option>0 &&theta != 270) // Angles at which the snake moves
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