


class walker
{
  int x = 10;
  int y = 200;
  PImage img1, img2, img3, img4;
  int speed;
  int counter = 0;
  int countDir=1;


  walker(int y, int x, int speed)
  {
  this.y = y;
  this.x = x;
  this.speed = speed;
  img1 = loadImage("walk1.gif");
  img2 = loadImage("walk2.gif");
  img3 = loadImage("walk3.gif");
  img4 = loadImage("walk4.gif");
  
  }


  void render()
  {
    if (counter>=0 && counter<=10){
        image(img1,x,y);
      }
      else if (counter>10 && counter<=20){
        image(img2,x,y);
      }
      else if (counter>20 && counter<=30)
      {
        image(img3,x,y);
      }
      else if (counter>30 && counter <= 40)
      {
        image(img4, x, y);
      }
      else 
      {
        countDir = -countDir; 
      }
      counter = counter + countDir;   
    }


  void moveForward()
  {

   x = x + speed;
  }
  
  void moveBackward()
  {
  speed = -speed;
   x = x + speed;
  }


  void update() 
  {
   
   moveForward();
    
    if (x>390)
  {
  moveBackward();
  }
  
  
   render();
  }






}//end of class

walker move1;

void setup()
{

size(400,400);
move1 = new walker(10,100,3);

}

void draw()
{
  background(255);
  
  
  move1.update();
  
}
