//screen size  
size(300,300);



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

//car scaling
float w;
w = 30;

float h;

h = 30;

//car body
rect(x,y,w+70,h+30);
//wheels
ellipse(x+20,y+50,w,h);
ellipse(x+80,y+50,w,h);
//windows
rect(x+20,y-30,w,h);
rect(x+50,y-30,w,h);
//light 
ellipse(x+100,y+10,w-20,h-20);
