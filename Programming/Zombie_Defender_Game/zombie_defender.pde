//assets from http://bigrookgames.com/portfolio-items/top-shooter-2d-sprite-animation-kit/
PImage backgroundImg; //global PImage varible to store background img
int stage; //variable to store active stage number (start/game/end)
int level; //variable to store current level
float clickLocationX = 200; //var for storing locations of where mouse is clicked
float clickLocationY = 200; //var for storing locations of where mouse is clicked
int zombieCount = 10; //amount of zombies in array
int zombieIndex = 0; //array of zombies current index
int deadZombies; //stores current amount of alive zombies
Zombie[] z = new Zombie[1000]; //array of zombies

Player PLAYER;
Objective OBJECTIVE;
Zombie ZOMBIE;

void setup()
{
  size(800, 800); //set screen size
  stage = 1; //sets stage to 1 (default/start menu) 
  level = 1; //sets level to 1
  backgroundImg = loadImage("zombieGameBG.jpg"); //load image in background variable
  backgroundImg.resize(width,height); //resize background img to fit screen
  PLAYER = new Player("player_move_0002.png", 200, 200, 1.5, 100, 2, false);
  OBJECTIVE = new Objective("objective.png", -10, -10, 0, 1000, 0, false);
  spawnZombies();
}

void draw()
{
  switch(stage) //switch case to enable switching between main menu/game/end screen
  {
    case 1://start menu
      background(0);
      textSize(32);
      text("Welcome", 10, 30); 
      fill(0, 102, 153);
      text("Press Enter To Play...", 10, 70); 
      fill(0, 102, 153);
    break;
    case 2://game
      background(backgroundImg); //sets background to background img
      textSize(15);
      text("Current Level: "+level, 630, 25); 
      fill(0, 102, 153);
      PLAYER.update();
      OBJECTIVE.update();
      for (int i = 0; i < zombieCount; i += 1)
      {
        z[i].update();
      }
     // println(deadZombies);
      if (deadZombies == zombieCount)
      {
        newLevel();
      }
    break;
    case 3://end screen
      background(0);
      textSize(32);
      text("You Died.", 10, 30); 
      fill(0, 102, 153);
      text("You survived "+(level - 1)+" levels!", 10, 140); 
      fill(0, 102, 153);
      text("Press Enter To Play Again...", 10, 70); 
      fill(0, 102, 153);
    break;
  }
}


void spawnZombies()
{
  deadZombies = zombieCount;
  for (int i = 0; i < zombieCount; i += 1) //spawns zombies depending on zombie count
  {
    z[i] = new Zombie("zombie_move_0001.png", random(750, 1400), random(750, 1400), 3, 100, 1, false);
    deadZombies -= 1;
   // print(aliveZombies);
  } 
}

void newLevel()
{
  level = level + 1;
  zombieCount = level*10;
  spawnZombies();
}

void keyPressed() 
{
  if (key == ENTER && stage == 1) //stage switcher
  {
    stage = 2;
  }
  else if (key == ENTER && stage == 3)
  {
    setup();
    stage = 1;
  }
}

void mouseReleased()
{
    if((z[zombieIndex].checkCollision(PLAYER, 45, 45) == false)) //checks collision before allowing mouseX/Y to be stored.
    {
      clickLocationX = mouseX;
      clickLocationY = mouseY;
    }
   println(mouseX);
    println(mouseY);
}
