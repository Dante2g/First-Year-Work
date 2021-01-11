class bounce
{
  int y;
  int x;
  int deltaY;
  int deltaX;
  PImage okhandNE, okhandNW, okhandSE, okhandSW;
 

    bounce(int x, int y, int deltaX, int deltaY)
    {
    this.y = y;
    this.x = x;
    this.deltaY = deltaY;
    this.deltaX = deltaX;
    okhandNE = loadImage("okhandNE.png");
    okhandNW = loadImage("okhandNW.png");
    okhandSE = loadImage("okhandSE.png");
    okhandSW = loadImage("okhandSW.png");
    }


    void render()
    {
      if(deltaX == 1 && deltaY == -1)
      {
      image(okhandNE,x,y);
      }
      else if (deltaX == -1 && deltaY == -1)
      {
      image(okhandNW,x,y);
      }
      else if (deltaX == 1 && deltaY == 1)
      {
      image(okhandSE,x,y);
      }
      else if (deltaX == -1 && deltaY == 1)
      {
      image(okhandSW,x,y);
      }
    }
    
     void changeDirection()
    {
      deltaY = -deltaY;
      deltaX = -deltaX;
    }    
        
        
    void update()
    {
      render();
      move();
    }
    
    void collision()
    {
      if (y<=(0)) 
       deltaY=1; 
      if (y>=500-(120)) 
       deltaY=-1; 
      if (x<=0) 
      deltaX=1; 
      if (x>=500-(120)) 
      deltaX=-1;
    }

   void move()
      {
       if (crash(instance1,instance3))
       {
          print("crash");
           instance1.changeDirection();
           instance3.changeDirection();
       }
        if (crash(instance3,instance2))
       {
          print("crash");
           instance3.changeDirection();
           instance2.changeDirection();
       }
       if (crash(instance1,instance2))
       {
          print("crash");
           instance1.changeDirection();
           instance2.changeDirection();
       }
       
        collision();
        y = y + deltaY;
        x = x + deltaX;
      }

    boolean crash(bounce F1, bounce other)
     {
       return((F1.x < (other.x+120)) && (F1.x+120 > other.x) && (F1.y < (other.y+120)) && (F1.y+120 > other.y));
     }
  


}//end class

bounce instance1, instance2, instance3;

void setup()
{
  size(500,500);
  instance1 = new bounce(250,250,-1,-1);
  instance2 = new bounce(400,250,1,-1);
  instance3 = new bounce(10,100,-1,-1);
}

void draw()
{
  background(255);
  instance1.update();
  instance2.update();
  instance3.update();
 
}
