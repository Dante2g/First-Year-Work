size(500,500);
int x = 50;
int y = 50;
int count = 1;

for(;y < 250;) {

  
for(;x < 250;) {
  x=x+20;
  
  fill(0,0,0);
  text(""+count, x,y);
  
  
  count = count+1;
}

x = 50;
y=y+20;

}
