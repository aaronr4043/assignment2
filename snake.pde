// C14396626 Aaron Renaghan Snake Game

void setup()
{
  size(500, 500);
  option = 0;
}

int option = 0;

void draw()
{
  if (option == 0)
  {
    background(0);
    
  }
  
  if (option == 1)
  {
    
  }
  
  if (option == 2)
  {
    
  }
  
  if (option == 3)
  {
    
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