//EtchySketch
//arrow keys to draw
float x,y;
int direction= RIGHT;



void setup(){
size(500,500);
background(255,255,255); //background white
x=200;
y=200;
stroke(0,0,0); //pen black
}



void draw(){
 
  
 if (crash(x,y)) {
 background(0);
 }
 
 
 
 
 point(x,y); //draw a point at current (x,y)
 if (direction==RIGHT)
  {
    x++;
  }
  else
  {
    if (direction==LEFT)
    {
      x--;
    }
    if (direction==UP)
    {
      y--;
    }
    if (direction==DOWN)
    {
      y++;
    }
  }
}


void keyPressed(){
if(key == CODED)
 {
 if (keyCode == UP && y>=0){ //restrict to screen edge
 direction = UP;
 }
 else if(keyCode == DOWN && y<=500){
 direction = DOWN;
 }
 else if (keyCode == LEFT && x>=0){
 direction = LEFT;
 }
 else if (keyCode == RIGHT && x<=500){
 direction = RIGHT;;
 }
 }
}

boolean crash(float x, float y)
{
color col=get((int)x,(int)y); //get colour of the next position
if (col==color(255,255,255)){
  return(false);
} else {
  return(true);
}
}
