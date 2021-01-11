class Sprite
{
  PImage img;
  float x;
  float y;
  float speed;
  float angle;
  float health;
  float damage;
  boolean dead;
  int animationCounter = 0;
  
  Sprite(String filename, float x, float y, float speed, float health, float damage, boolean dead)
  {
    this.img = requestImage(filename);
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.health = health;
    this.dead = dead;
    this.damage = damage;
  }
  
  boolean checkDead(float health)
  {
    if(health <= 0)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  boolean checkCollision(Sprite other, int rangeX, int rangeY)
  {
    return((this.x < (other.x+rangeX)) && (this.x+rangeX > other.x) && (this.y < (other.y+rangeY)) && (this.y+rangeY > other.y));
  }
  
  void walkAnimation(Sprite object, String imgText)//walking animation for zombie
  {
    if (object.speed != 0)
    {
      if(animationCounter >= 0 && animationCounter <= 15)
      {
        object.img = loadImage(imgText+"_move_0001.png");
      }
      else if(animationCounter >= 15 && animationCounter <= 30)
      {
        object.img = loadImage(imgText+"_move_0002.png");
      }
      else if(animationCounter >= 30 && animationCounter <= 45)
      {
        object.img = loadImage(imgText+"_move_0003.png");
      }
      else if(animationCounter > 45)
      {
        animationCounter = 0;
      }
      animationCounter += 1;
    }  
  }
  
}
