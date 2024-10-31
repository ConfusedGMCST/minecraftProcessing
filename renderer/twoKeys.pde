public class twoKeys {
  boolean[] moveKeys = new boolean[4];

  void setup() {
  }

  void draw() {
    println();
    println("w: "+moveKeys[0]);
    println("a: "+moveKeys[1]);
    println("s: "+moveKeys[2]);
    println("d: "+moveKeys[3]);
    println();
  }

  void setMovement(int k, boolean b) {
    switch (k) {
    case 'w':
      moveKeys[0] = b;
      break;
    case 'a':
      moveKeys[1] = b;
      break;
    case 's':
      moveKeys[2] = b;
      break;
    case 'd':
      moveKeys[3] = b;
      break;
    }
  }

  void keyPressed() {
    setMovement(key, true);
  }

  void keyReleased() {
    setMovement(key, false);
  }
}
