final color RED = color(255,0,0);
final color BLUE = color(0,0,255);



class motorbike
{
 int x = 5;  //members
 int y;
 int speed=2;
 int size=30;
 color colour;
 
 motorbike(int y, int speed)
 {
 this.y = y;
 this.speed = speed;
 }

void render(color colour)
 {
   float wheelHeight = size/3;
   fill(colour);
   triangle(x,y,x+size,y,x+size/2,y-size/2);
   drawWheel(x,y,wheelHeight);
   drawWheel(x+size,y,wheelHeight);
 }
 
 void drawWheel(int x,int y,float size)
 {
    float inner = size*2/3;
    fill(0);
    ellipse(x,y,size,size);
    fill(255);
    ellipse(x,y,inner,inner);
 }
 
 boolean finished(int width)
{
 return x>(width-10); //screen width
}

 void move()
 {
   speed = (int)random(5.0); //a random step [0..5]
    x = x + speed;  
 }
 
 void update(color colour) {
 move();
 render(colour);
}

 
} //end of class description






motorbike b1,b2;
void setup()
{
  size(500,100);
  b1 = new motorbike(50, 5);
  b1.y = 50;
  b2 = new motorbike(70, 3);
  b2.y = 70;
}




void draw()
{
  background(125);
  
 if (b1.finished(490) == false){
   b1.update(RED);
  
 }
 
  if (b2.finished(490) == false){
   b2.update(BLUE);
  
 }
  
} 
