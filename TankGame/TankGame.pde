// April 29 2026 | TankGame by Aaditya Kuberan
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
Obstacle o1;
Obstacle o2;
Obstacle o3;
PImage bg;
int score;
int health;
Timer objTimer, puTimer;

void setup() {
  size(500, 500);
  score = 0;
  health = 10;
  bg = loadImage("background.png");
  t1 = new Tank();
  objTimer = new Timer(1000);
  objTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
}

void draw() {
  if (health <= 0) {
    background(0);          // Black screen
    fill(255, 0, 0);        // Red text
    textAlign(CENTER, CENTER);
    textSize(50);
    text("GAME OVER", width/2, height/2);
    noLoop();               // Stops the game from running further
    return;                 // Exit draw() so the rest of the game doesn't render
  }
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0); //
  if (objTimer.isFinished()) {
    float randomY = random(50, height - 100);
    obstacles.add(new Obstacle(-100, randomY, 100, 100, int(random(1, 10)), 10));
    objTimer.start();
  }
  if (puTimer.isFinished()) {
    //add object
    powerups.add(new PowerUp(100, 100, 'w'));
    puTimer.start();
  }

for (int i = 0; i < powerups.size(); i++) {
    PowerUp pu = powerups.get(i);
    pu.display(); // [cite: 12]
    pu.move(); // [cite: 12]

    // Check if Tank touches PowerUp
    if (pu.intersect(t1)) { // [cite: 14]
      if (pu.type == 't') {
        t1.turretCount++; // [cite: 14]
      } else if (pu.type == 'a') {
        t1.laserCount += 100; // [cite: 15]
      } else if (pu.type == 'h') {
        t1.health += 25; // Boosts Tank health [cite: 16]
      }
      powerups.remove(i); // Removes power-up after collection
    } 
    // Remove if it goes off-screen
    else if (pu.reachedSide()) { // [cite: 13]
      powerups.remove(i);
    }
  }
  
  for (int j = obstacles.size() - 1; j >= 0; j--) {
    Obstacle o = obstacles.get(j);
    o.display(); // [cite: 6]
    o.move();
    if (o.reachedSide()) {
      obstacles.remove(j);
      continue;
    }
    if (t1.intersect(o)) {
      health = health - 1;
      obstacles.remove(j);
      continue;
    }
  }
  for (int i = projectiles.size() - 1; i >= 0; i--) {
    Projectile p = projectiles.get(i);
    p.display(); // [cite: 9]
    p.move();
    if (p.reachedEdge()) {
      projectiles.remove(i);
      continue;
    }
    boolean hit = false;
    for (int j = obstacles.size() - 1; j >= 0; j--) {
      Obstacle o = obstacles.get(j);

      if (p.intersect(o)) { //
        score = score + 100; //
        obstacles.remove(j); //
        hit = true;
        break;
      }
    }
    if (hit) {
      projectiles.remove(i); //
    }
  }

  t1.display();
  scorePanel();
}

void keyPressed() {
  if (key == 'w') {
    t1.move('w');
  } else if (key == 's') {
    t1.move('s');
  } else if (key == 'a') {
    t1.move('a');
  } else if (key == 'd') {
    t1.move('d');
  }
}

void mousePressed() {
  float dx = mouseX -t1.x;
  float dy = mouseY - t1.y;
  float mag = sqrt(dx*dx + dy*dy);
  if (mag > 0) {
    dx /= mag;
    dy /= mag;

    float speed = 5;
    if (t1.turretCount == 1 && t1.laserCount > 0) {
      projectiles.add(new Projectile(t1.x, t1.y, dx * speed, dy * speed));
      t1.laserCount = t1.laserCount - 1;
    } else     if (t1.turretCount == 2) {
      projectiles.add(new Projectile(t1.x-20, t1.y, dx * speed, dy * speed));
      projectiles.add(new Projectile(t1.x+20, t1.y, dx * speed, dy * speed));
      t1.laserCount = t1.laserCount - 2;
    }
  }
}

void scorePanel() {
  fill(0, 150); 
  rectMode(CORNER);
  rect(0, 0, width, 40);

  fill(255);
  textSize(16);
  textAlign(LEFT, CENTER);
  
  text("Score: " + score, 20, 20);
  text("Health: " + (int)t1.health, 150, 20);
  text("Ammo: " + t1.laserCount, 300, 20);
  text("Turrets: " + t1.turretCount, 410, 20);
}
