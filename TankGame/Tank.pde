class Tank {
  float x, y, w, h, speed, health;
  PImage iTankW, iTankA, iTankS, iTankD;
  char idir;
  int turretCount;
  int laserCount;

  Tank() {
    x = 100.0;
    y = 100.0;
    w = 100.0;
    h = 100.0;
    speed = 10.0;
    health = 75.0;
    iTankW = loadImage("Kuberan_tank.png");     
    iTankA = loadImage("left_tank.png");     
    iTankS = loadImage("down_tank.png");     
    iTankD = loadImage("right_tank.png");
    idir = 'w';
    turretCount = 1;
    laserCount = 100;
  }

  void display() {
    imageMode(CENTER);
    if (idir == 'w') {
      image(iTankW, x, y);
    } else if (idir == 'a') {
      image(iTankA, x, y);
    } else if (idir == 's') {
      image(iTankS, x, y);
    } else if (idir == 'd') {
      image(iTankD, x, y);
    }
  }

  void move(char dir) {
    idir = dir;
    if (dir == 'w') {
      y = y - speed;
    } else if (dir == 's') {
      y = y + speed;
    } else if (dir == 'a') {
      x = x - speed;
    } else if (dir == 'd') {
      x = x + speed;
    }
  }

  void fire() {
  }
  boolean intersect(Obstacle o) {
    float distance = dist(x, y, o.x, o.y);
    return distance < 50;
  }
}
