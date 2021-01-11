//Global variables
int x; //ball x position
int y; 
int deltaX = 5; //ball x direction is right, step 5
int deltaY = 5;
int batY = 100;

void setup() //runs once at start
{
  size(500, 250);
}



void keyPressed() {
if (key == CODED){
  
  if (keyCode == UP){
  
  batY = batY - 20;
  
  } else if (keyCode == DOWN){
  
  batY = batY + 20;
  
  }
  
}

}



void draw() //runs repeatedly
{

  background(200); //clear screen RGB = 200 (grey)
  bat();
  //draw and update ball position

  x = x + deltaX; //move ball x right
  y = y + deltaY;
  ellipse(x, y, 10, 10);
  //Collision Detection
  //collide right hand edge?
  if (x>500) {
    deltaX = -deltaX; //reverse x direction

    //collide left hand edge?
  

    //collide top edge?
  } else if (y<0) {
    deltaY = -deltaY;

    //collide bottom edge?
  } else if (y>250) {
    deltaY = -deltaY;
  }
  
  
  if((y>=batY&&y<=batY+70)&&(x<10)){
    deltaX = -deltaX;
    deltaY = -deltaY;
  
  }
    
  
  
}




void bat()
{

  rect(0, batY, 10, 70);
  
  if(batY < 0){
    batY = 0;
  } else if(batY>180){
    batY = 180;
  
  }
  
  
}
