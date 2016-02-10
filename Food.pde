class Food
{
  int foodX; //X Co Ord for food
  int foodY; //Y Co Ord for food

  Food(int foodX, int foodY)
  {
    foodX = foodX;
    foodY = foodY;
  }

  void getFood() // Gets Co ords for food 
  {
    foodX=10*(round(random((width-10)/10)));
    foodY=10*(round(random((height-10)/10)));
  }
}
