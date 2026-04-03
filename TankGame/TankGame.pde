// April 1 2026 | TankGame by Aaditya Kuberan
Tank t1;

void setup() {
  size(500, 500);
  t1 = new Tank();
}

void draw() {
  background(127);
  t1.display();
}

void keyPressed() {
  if(key == 'w') {
    t1.move('w');
  } else if (key == 's') {
    t1.move('s');
  } else if (key == 'a') {
    t1.move('a');
  } else if (key == 'd') {
    t1.move('d');
  }
}
