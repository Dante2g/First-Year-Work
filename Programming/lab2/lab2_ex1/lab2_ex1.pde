int x=10;
int y=20;

size(200,200); //set size of canvas screen


for (; y <= 110; ){

for(;x <= 50;) {
 x=x+10; //add amount to value stored in variable x
 ellipse(x,y,10,10);
 line(x-5, y, x+5 ,y);
 line(x, y-5 ,x, y+5);
}
x = 10;
y = y+10;

}
