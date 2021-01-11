int x=10;
int y=20;
int step = 50;
size(200,200); //set size of canvas screen


for (; y <= 60; ){

for(;x <= step;) {
 x=x+10; //add amount to value stored in variable x
 ellipse(x,y,10,10);
 line(x-5, y, x+5 ,y);
 line(x, y-5 ,x, y+5);

}
x = 10;
y = y+10;
step = step -10;

}
