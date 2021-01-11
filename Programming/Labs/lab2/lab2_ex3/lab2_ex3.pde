float x= 25;
float y= 25;
float radius = 20;
float angle; //in radians
size(500,500);

for(;y < 224;) {

for(;x < 225;) {
x=x+40;

  
float r = random(50); //random number [0..50]
float g = random(50);
float b = random(50);
 stroke(r*5,g*5,b*5); //random line colour
 
 
 ellipse(x,y,40,40);
for(int degrees=0; degrees<360; degrees = degrees+10)
{
  angle = radians(degrees); //convert degrees to radians
 line(x,y, x+radius*sin(angle),y+radius*cos(angle));
}



}
x=25;
y=y+40;

}
