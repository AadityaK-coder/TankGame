class Obstacle {
  // Member Variable
  float x, y, w, h, speed, health;
  PImage obs;
  char idir;
  
  // Constructor
  Obstacle(float x, float y, float w, float h, float speed, float health) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.health = health;
    if (int(random(4))==2) {
      idir = 'w';
      x = random(width);
      y = height + 100;
    } else if (int(random(3))==1) {
      idir = 'd';
      x = -100;
      y = random(height);
    } else if (int(random(2))==1) {
      idir = 'a';
      x = width +100;
      y = random(height);
    } else {
      idir = 's';
      x =random(width);
      y = -100;
    }
obs = loadImage("obstacle.png");
  }
  
  void display() {
    fill(128);
    image(obs,x,y);
  }
  
  void move() {
    switch(idir) {
    case 'w':
      y=y-speed;
      break;
    case 'a':
      x=x-speed;
      break;
    case 's':
      y=y+speed;
      break;
    case 'd':
      x=x+speed;
      break;
    }
    
    x=x+speed;
    if(x>width) {
      x=0;
    }
  }
  
  void fire() {
  }

boolean reachedSide() {
  return (x < -200 || x >= width + 200 || y < -200 || y>= height+200);
  }
}
