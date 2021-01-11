int x = 150;
int y = 150;
int size = 100;

void setup()
{
  size(500,500);
  motorbike();
}

void motorbike()
{
  triangle(x,y,size);
  
  
  int wheelsize = size/5*2;
  fill(0);
  ellipse(x,y,wheelsize,wheelsize);
  fill(255);
  ellipse(x,y,size/5,size/5);
  
  fill(0);
  ellipse(x+size,y,wheelsize,wheelsize);
  fill(255);
  ellipse(x+size,y,size/5,size/5);
  
}

void triangle(int x, int y, int size)
{
  line(x,y,x+size,y);
  line(x,y,x+size/2,y-size/2);
  line(x+size,y,x+size/2,y-size/2);
}
