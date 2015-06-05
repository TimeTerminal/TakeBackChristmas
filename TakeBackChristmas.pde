class Player
{
  //Animation
  int numFrames = 3;  // The number of frames in the animation
  int currentFrame = 0;
  PImage[] sprites = new PImage[numFrames];

  //Position and Jumping
  PVector position;
  float jumpSpeed;
  PVector velocity;
}

class Enemy
{
  PVector enemyVelocity;
}

//Global Variables
Player santa;

float gravity = 0.5;
float ground = 530;

float up;
float down;

void setup ()
{
  size (1080, 800);
  
  frameRate (6);
  
  santa = new Player();
  
  santa.sprites[0]  = loadImage ("Santa1.png");
  santa.sprites[1]  = loadImage ("Santa2.png"); 
  santa.sprites[2]  = loadImage ("Santa3.png");
  
  santa.position = new PVector (400, ground);
  santa.jumpSpeed = 10;
  santa.velocity = new PVector (0, 0);
}

//Spikes
//int [] spikes = new int [3];

void draw ()
{
  background (200);
  updatePlayer ();
}

void updatePlayer ()
{
  // Only apply gravity if above ground (since y positive is down we use < ground)
  if (santa.position.y < ground)
  {
    santa.velocity.y += gravity;
  }
  else
  {
    santa.velocity.y = 0;
  }
  
  if (santa.position.y >= ground && up != 0)
  {
    santa.velocity.y = -santa.jumpSpeed;

  }
  
  PVector nextPosition = new PVector (0, santa.position.y);
  nextPosition.add (santa.velocity);
   
  float offset = 0;
  if (nextPosition.y > offset && nextPosition.y < (height - offset))
  {
    santa.position.y = nextPosition.y;
  }
  
  translate (300, santa.position.y);
  
  //Animation
  santa.currentFrame = (santa.currentFrame + 1) % santa.numFrames;  // Use % to cycle through frames
  
  for (int i = 0; i < 3; i++)
  {
    santa.sprites[i].resize (0, 100);
  }
  
  imageMode (CENTER);
  image (santa.sprites[(santa.currentFrame) % santa.numFrames], 0, 0);
}

void keyPressed ()
{
  if (key == ' ')
  {
    up = -1;
  }
}

void keyReleased()
{
  if (key == ' ')
  {
    up = 0;
  }
}
