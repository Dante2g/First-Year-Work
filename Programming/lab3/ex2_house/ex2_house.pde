//int x = 100;
//int y = 100;
//int size = 30;


void setup()
{
  size(500, 500); //screen size
  //house(200,200,50);
  ///house(x,y,size);
  street();
}

void street()
{
  int x = 100;
  int y = 100;
  int size = 30;
  for (int i = 0; i <= 8; i = i+1) 
  {
    //println(i);
    house(x,y,size);
    x= x +size*3;
  }
}

void house(int x, int y, int size) //draws house
{
   rect(x-size, y-size,size*2,size*2); //walls 
  line(x-size, y-size, x, (y-(size*2))); //left roof
  line(x+size, y-size, x, (y-(size*2))); //right roof
  ellipse(x, y-(size*1.5), size/2, size/2); //circle on roof

}
