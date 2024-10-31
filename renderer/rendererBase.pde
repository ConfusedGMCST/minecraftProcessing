float x = 0, y = 0, z = 0, yRot = 0, xRot = 0;

void setup() {
  fullScreen(P3D);
  fill(255);
  stroke(0);
}

void draw() {
  background(#DEDEDE);
  translate(displayWidth / 2, displayHeight / 2, 0);
  if (keyPressed) {
    if (key == 'a') {
      x += 2.5;
    }
    if (key == 'd') {
      x -= 2.5;
    }
    if (key == 'w') {`
      y += 2.5;
    }
    if (key == 's') {
      y -= 2.5;
    }
    if (keyCode == LEFT) {
      yRot += 0.04;
    }
    if (keyCode == RIGHT) {
      yRot -= 0.04;
    }
    if (keyCode == UP) {
      xRot += 0.04;
    }
    if (keyCode == DOWN) {
      xRot -= 0.04;
    }
  }
  if (!keyPressed) {
    key = ' ';
  }
  push();
  translate(x, y, z);
  rotateY(yRot);
  rotateX(xRot);
  box(100, 100, 100);
  pop();
  text(x + ", " + y + ", " + z + ", " + key + ", " + yRot + ", " + xRot + ", " + mouseX, 100, 100);
}

void mouseWheel(MouseEvent event) {
  float wheelValue = event.getCount();
    if (wheelValue < 0) {
      z += 10;
    }
    if (wheelValue > 0) {
      z -= 10;
    }
}
