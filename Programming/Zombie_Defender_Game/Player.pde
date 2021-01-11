class Player extends Sprite
{
  int playerWalkCounter;
  Player(String filename, float x, float y, float speed, float health, float damage, boolean dead)
  {
    super(filename, x, y, speed, health, damage, dead);
  }
  
  void update()
  {
    render();
    move();
    walkAnimation(PLAYER, "player");
    checkNearBuilding();
  }
  
  void render()
  {
    angle = atan2(mouseY-PLAYER.y, mouseX-PLAYER.x); //calculates angle of rotation depending on mouse position 
    pushMatrix(); //rotates image towards mouse
    translate(x,y);
    rotate(angle-190); 
    image(img, -img.width/2, -img.height/2);
    popMatrix(); 
  }
  
  void move()
  {
    if ((PLAYER.x < (clickLocationX+10)) && (PLAYER.x+10 > clickLocationX) && (PLAYER.y < (clickLocationY+10)) && (PLAYER.y+10 > clickLocationY))
    {
    PLAYER.img = loadImage("player_stand_0001.png");
    PLAYER.speed = 0;
    }
    else 
    {
      PLAYER.speed = 1.5;
      angle = atan2(clickLocationY-PLAYER.y, clickLocationX-PLAYER.x);
      float newX = cos(this.angle) * speed + x; //uses calculated angle to determine new coordinates to move to depending on mouse click position
      float newY = sin(this.angle) * speed + y;
      x = newX; //updates x and y so player will walk towards mouse click location
      y = newY; 
    }     
  }
  
  void checkNearBuilding()
  {
    if(PLAYER.checkCollision(OBJECTIVE, 183, 183))
    {
      clickLocationX += 6;
      clickLocationY += 6;
    }
  }
 
}
