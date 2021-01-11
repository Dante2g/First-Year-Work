int x=10;
int y=20;
int step = 10;
size(500,500); //set size of canvas screen


for (; y <= 120; ){

for(;x <= step;) {
 x=x+10; //add amount to value stored in variable x
 ellipse(x,y,10,10);
 line(x-5, y, x+5 ,y);
 line(x, y-5 ,x, y+5);

}
x = 10;
y = y+10;
step = step + 10;

}




 x=10;
 y=130;
 step = 100;

for (; y <= 230; ){

for(;x <= step;) {
 x=x+10; 
 ellipse(x,y,10,10);
 line(x-5, y, x+5 ,y);
 line(x, y-5 ,x, y+5);

}
x = 10;
y = y+10;
step = step - 10;

}
