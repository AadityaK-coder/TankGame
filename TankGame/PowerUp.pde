class PowerUp {
  // Member Variable
  float x, y, w, h, speed, health;
  //PImage obs;
  char type;
  char idir;

  // Constructor
PowerUp(float w, float h, char idir) {
    this.w = w;
    this.h = h;
    this.idir = idir; // Assign the direction!
    this.speed = 3;

    // Logic to set type and starting position
    float r = random(1);
    if (r < 0.33) {
      type = 'h'; // Health
    } else if (r < 0.66) {
      type = 'a'; // Ammo
    } else {
      type = 't'; // Turret
    }
    
    // Start at a random edge based on direction
    x = random(width);
    y = -50; // Start above screen and move down
  }


  void display() {
    if (type == 'h') {
      fill(0, 200, 0);
      ellipse(x, y, w, h);
      fill(255);
      text("Health", x, y);
      textAlign(CENTER, CENTER);
    } else if (type == 't') {
      fill(0, 200, 0);
      ellipse(x, y, w, h);
      fill(255);
      text("Turret", x, y);
      textAlign(CENTER, CENTER);
    } else if (type == 'a') {
      fill(0, 200, 0);
      ellipse(x, y, w, h);
      fill(255);
      text("Ammo", x, y);
      textAlign(CENTER, CENTER);
    }
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
    break;
    }

    x=x+speed;
    if (x>width) {
      x=0;
    }
  }

  void fire() {
  }

  boolean reachedSide() {
    return (x < -200 || x >= width + 200 || y < -200 || y>= height+200);
  }
   boolean intersect(Tank o) {
    float distance = dist(x, y, o.x, o.y);
    if (distance < 30) {
      return true;
    } else {
      return false;
    }
  }
}
