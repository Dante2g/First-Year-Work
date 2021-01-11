class Zombie extends Sprite
{
  int playerCollisionCounter;
  int objCollisionCounter;
  int aliveZombies = 10;
  float previousX;
  float previousY;
  Zombie(String filename, float x, float y, float speed, float health, float damage, boolean dead)
  {
    super(filename, x, y, speed, health, damage, dead);
  }
  
  void update()
  {
    render();
    move();
    setDead();
    changeIndex();
    battlePlayer();
    attackObjective();
    walkAnimation(z[zombieIndex], "zombie");
    countDead();
  }
  
  void render()
  {
    pushMatrix();
    translate(x,y);
    rotate(angle-190); 
    image(img, -img.width/2, -img.height/2);
    popMatrix();
  }
 
  void move()
  {
    angle = atan2(OBJECTIVE.y-z[zombieIndex].y, OBJECTIVE.x-z[zombieIndex].x); 
    float newX = cos(this.angle) * speed + x; 
    float newY = sin(this.angle) * speed + y;
    x = newX; 
    y = newY;
  }
   
  void setDead()
  {
    if (checkDead(this.health))
    {
      z[zombieIndex].dead = true;
      z[zombieIndex].x = -9999;
      z[zombieIndex].y = -9999;
      z[zombieIndex].speed = 0;
    }
  }
  
  void countDead()
  {
    deadZombies = 0;
    for (int i = 0; i < zombieCount; i += 1) //spawns zombies depending on zombie count
    {
      if(z[i].dead)
      {
        deadZombies += 1;
      }
    } 
  }
  
  void changeIndex()
  {
    zombieIndex += 1;
    if (zombieIndex >= zombieCount)
    {
      zombieIndex = 0;
    }
  }
  
  void battlePlayer()
  {
    if(z[zombieIndex].checkCollision(PLAYER, 45, 45))
    {
      clickLocationX = PLAYER.x;
      clickLocationY = PLAYER.y;
      if(playerCollisionCounter >= 0 && playerCollisionCounter <= 30)
      {
        PLAYER.img = loadImage("player_attack_0001.png");
        z[zombieIndex].speed = 0;
        z[zombieIndex].img = loadImage("zombie_attack_0001.png");
        z[zombieIndex].health = z[zombieIndex].health - PLAYER.damage;  
      }
      else if(playerCollisionCounter >= 30 && playerCollisionCounter <= 60)
      {
        PLAYER.img = loadImage("player_attack_0002.png");
        z[zombieIndex].speed = 0;
        z[zombieIndex].img = loadImage("zombie_attack_0002.png");
        z[zombieIndex].health = z[zombieIndex].health - PLAYER.damage; 
      }
      else if(playerCollisionCounter > 60)
      {
        playerCollisionCounter = 0;
      }
    }
    else
    {
     z[zombieIndex].speed = 3;
     z[zombieIndex].img = loadImage("zombie_move_0001.png");
    }
    playerCollisionCounter += 1;
  }
  
  void attackObjective()
  {
    if(OBJECTIVE.checkCollision(z[zombieIndex], 200, 180))
    {
      if(objCollisionCounter >= 0 && objCollisionCounter <= 30)
      {
        z[zombieIndex].speed = 0;
        z[zombieIndex].img = loadImage("zombie_attack_0001.png");
        OBJECTIVE.health = OBJECTIVE.health - z[zombieIndex].damage;   
      }
      else if(objCollisionCounter >= 30 && objCollisionCounter <= 60)
      {
        z[zombieIndex].speed = 0;
        z[zombieIndex].img = loadImage("zombie_attack_0002.png");
        OBJECTIVE.health = OBJECTIVE.health - z[zombieIndex].damage; 
      }
      else if(playerCollisionCounter > 60)
      {
        objCollisionCounter = 0;
      }
    }
    objCollisionCounter += 1;
  }

  
}
