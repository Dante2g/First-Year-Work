class Objective extends Sprite
{
  PImage objImg;
  
  Objective(String filename, float x, float y, float speed, float health, float damage, boolean dead)
  {
    super(filename, x, y, speed, health, damage, dead);
  }
  
  void update()
  {
    render();
    setDead();
  }
  
  void render()
  {
    objImg = loadImage("objective.png");
    objImg.resize(170,150);
    image(objImg, x, y);
    
  }
  
  void setDead()
  {
    if (checkDead(this.health))
    {
      OBJECTIVE.dead = true;
      stage = 3;
    }
  }
  
}
