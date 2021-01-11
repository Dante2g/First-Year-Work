//this is a comment - draw a face
//global variables
float x=50;
float y=50;
float size = 50;
float offset = size/3;
float offsetMouth = size /4;
float eyeSize =0.2*size;
//head
fill(0,255,0);
ellipse(x,y,size,size);
//eyes
fill(255,255,255);
ellipse(x-offset,y-offset,eyeSize,eyeSize);
ellipse(x+offset,y-offset,eyeSize,eyeSize);
point(x+offset,y-offset);
point(x-offset,y-offset);
//mouth
line(x-offset,y+offset,x+offset,y+offset);
//nose
line(x,y-offsetMouth,x,y+offsetMouth);
