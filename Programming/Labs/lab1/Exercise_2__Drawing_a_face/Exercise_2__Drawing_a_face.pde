//this is a comment - draw a face
//global variables
float x=50;
float y=50;
float size = 50;

//head
fill(0,255,0);
ellipse(x,y,size,size);
//eyes
fill(255,255,255);
ellipse(x-15,y-15,10,10);
ellipse(x+15,y-15,10,10);
point(x+15,y-15);
point(x-15,y-15);
//mouth
line(x-15,y+15,x+15,y+15);
//nose
line(x,y-15,x,y+5);
