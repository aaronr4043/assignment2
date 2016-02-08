class Segments
{
  int snakeLength = 5; //Length of the snake
  int[] snakePartX = new int[2500]; //Array of X Co Ords
  int[] snakePartY = new int[2500]; //Array of Y Co Ords

  void snakeMove() //Moves the snakeparts in the correct angles chosen by the user
  {
    for (int i=snakeLength; i>0; i--)
    {
      if (i!=1)
      {
        snakePartX[i]=snakePartX[i-1];
        snakePartY[i]=snakePartY[i-1];
      }//end if

      else
      {
        if (theta == 0)
        {
          snakePartX[1] = snakePartX[1] + (width/50);
        }//end if

        if (theta == 90)
        {
          snakePartY[1] = snakePartY[1] - (height/50);
        }//end if

        if (theta == 180)
        {
          snakePartX[1] = snakePartX[1] - (width/50);
        }//end if

        if (theta == 270)
        {
          snakePartY[1] = snakePartY[1] + (height/50);
        }//end if
      }//end else
    }//end if
  }//end snakeMove()

  void snakeAlive()
  {
    if (snake.snakePartX[1]>(width-10) || snake.snakePartX[1] < -1)
    {
      option = 4;
      run = false;
    }

    if (snake.snakePartY[1]>(height-10) || snake.snakePartY[1] <-1)
    {  
      option = 4;
      run = false;
    }

    for (int i=snake.snakeLength; i>1; i--)
    {
      if (snake.snakePartX[1] == snake.snakePartX[i] && snake.snakePartY[1] == snake.snakePartY[i])
      {
        option = 4;
        run = false;
      }
    }
  }
}