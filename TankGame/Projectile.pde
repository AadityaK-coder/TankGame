class Projectile {
  // Member Variable
  float x, y, w, h, speed;
  
  // Constructor
  Projectile(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    speed = 8;
  }
  
  void display() {
    fill(255,0,0);
    rect(x,y,w,h);
  }
  
  void move() {
    y=y-speed;
    }
  }
  
  void fire() {
  }
