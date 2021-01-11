//screen size  
size(500,500);



//draw lines
for (int i = 0; i < 500; i = i+10) {
  line(0, i, 500, i);
}

for (int i = 0; i < 500; i = i+10) {
  line(i, 0, i, 500);
}

//coord variables 
float x;
x= 150;

float y;
y = 150;

//scale
float s;
s= 1;

//car body
scale(s);
rect(x,y,100,50);

//wheels
scale(s);
ellipse(x+20,y+50,30,30);

scale(s);
ellipse(x+80,y+50,30,30);

//windows
scale(s);
rect(x+20,y-30,30,30);

scale(s);
rect(x+50,y-30,30,30);

//light 
scale(s);
ellipse(x+100,y+10,10,10);
