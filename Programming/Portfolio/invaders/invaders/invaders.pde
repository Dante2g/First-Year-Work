PImage background;
int x=0; //global variable background location
boolean gamemode = false;

class Defender
{
  int x;
  int y;
  
  Defender(int x, int y)
  {
    this.y = y;
    this.x = x;
  }
  
  void render()
    {
      //draw a defender
     fill(255,0,0);
     rect(x,y,50,20);
     triangle(x+50,y,x+50,y+20,x+60,y+10);
     fill(0,0,100);
     rect(x,y-10,20,10);
     collisionCheck();
    }
    
    void move(int direction)
    {
      y = y + direction;
    }
    
    void collisionCheck()
    {
      color c = get(x+65, y);
  if (c == color(0,255,0)||(c == color(50,100,0)))
  {
    gamemode = false;
  }
    }
  
}//end defender class



class Alien
{
  int x;
  float y;
  int deltaX;
  final color ALIEN1 = color(0,255,0);
  final color ALIEN2 = color(50,100,0);
  
  Alien(int x, float y, int deltaX)
  {
    this.y = y;
    this.x = x;
    this.deltaX = deltaX;
    
  }
  
  void render()
    {
      //draw an alien
       fill(ALIEN1);
       ellipse(x,y,30,30);
       fill(ALIEN2);
       ellipse(x,y,50,15);
    }
    
    void move()
    {
      x = x + deltaX;
      y = y + random(-2.5,2.5);
    }
  
  void update()
  {
    render();
    move();
    checkBound();
  }
  
  void checkBound()
  {
  if (this.x <= 0)
  {
    this.x = 700;
  }
  else if (gamemode == false)
  {
    this.x = 700;
  }
  }
  
}//end alien class







Alien ALIEN;
Defender DEFENDER;


void setup(){
 size(800,400);
 background = loadImage("spaceBackground.jpg");
 background.resize(width,height);
 ALIEN = new Alien(700,200,-1);
 DEFENDER = new Defender(100,200);


}




void draw ()
{
 image(background, x, 0); //draw background twice adjacent
 image(background, x+background.width, 0);
 x -=4;
 if(x == -background.width)
 x=0; //wrap background
 
 if (gamemode == true){
 ALIEN.update();
 DEFENDER.render();
 }
 else if (gamemode == false)
 {
   text("Game Over, Press 'p' to continue.", 100, 100);
   ALIEN.x = 700;
 }

}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
   
      DEFENDER.move(-20);
    } else if (keyCode == DOWN) {
     
      DEFENDER.move(20);
    } 
  } 
  
   if (keyPressed) {
    if (key == 'p' || key == 'P') {
      gamemode = true;
     
    }
  }
}
