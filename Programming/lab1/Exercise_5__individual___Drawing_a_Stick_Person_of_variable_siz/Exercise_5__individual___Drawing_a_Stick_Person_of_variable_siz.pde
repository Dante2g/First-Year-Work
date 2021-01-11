
//screen size 500x500 pixels
size(500,500);
//draw lines
/*for (int i = 0; i < 500; i = i+10) {
  line(0, i, 500, i);
}

for (int i = 0; i < 500; i = i+10) {
  line(i, 0, i, 500);
}
*/




float x =70;
float y =50;
float size =1;

//head
ellipse(x,y,(20*size),(20*size));
//body
line(x,y,x,y+(60*size));
//arms
line(x-(30*size),y+(20*size),x+(30*size),y+(20*size));
//legs
line(x,y+(60*size),x+(30*size),y+(90*size));
line(x,y+(60*size),x-(30*size),y+(90*size));
