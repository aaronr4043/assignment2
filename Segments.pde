class Segments
{
  int snakeLength = 5; //Length of the snake
  int[] snakePartX = new int[2500]; //Array of X Co Ords
  int[] snakePartY = new int[2500]; //Array of Y Co Ords
  AudioPlayer MGS;
  
  Segments()
  {
    //MGS = minim.loadFile("MSG2.wav");
  }

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
    if (snakePartX[1]>(width-10) || snakePartX[1] < -1)
    {
      option = 4;
      run = false;
      MGS.play();
    }

    if (snakePartY[1]>(height-10) || snakePartY[1] <-1)
    {  
      option = 4;
      run = false;
      MGS.play();
    }

    for (int i=snakeLength; i>1; i--)
    {
      if (snakePartX[1] == snakePartX[i] && snakePartY[1] == snakePartY[i])
      {
        option = 4;
        run = false;
        MGS.play();
      }
    }
  }
}