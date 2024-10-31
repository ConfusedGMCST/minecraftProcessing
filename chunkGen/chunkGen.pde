int heightLimit = 9;
int chunkDepth = 9;

class nRandom {
  private int least;
  private int greatest;
  private int result;
  
  public nRandom(int least, int greatest) {
    float resultCalc =  random(least, greatest);
    if (resultCalc >= (int) resultCalc + 0.5) {
      this.result = (int) resultCalc + 1;
    } else {
      this.result = (int) resultCalc;
    }
  }
}

class initChunk {
  private int topLayer;
  private int biome;
  private int[] xAxis = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  private int[] yAxis = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  private int[] zAxis = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  
  public initChunk(int topLayer, int biome) {
    this.topLayer = topLayer;
    this.biome = biome;
    genPlanes();
  }
  
  void genPlanes() {
    for (int i = chunkDepth; i >= 0; i--) {
      zAxis[i] = i;
      for (int v = heightLimit; v >= 0; v--) {
        yAxis[v] = v;
        if (yAxis[v] <= topLayer) {
          if (yAxis[v] == topLayer && biome == 0) {
            xAxis[v] = 1;
          }
          if (yAxis[v] < topLayer && yAxis[v] != 0) {
            xAxis[v] = 2;
          }
          if (yAxis[v] == 0) {
            xAxis[v] = 3;
          }
        } else {
          xAxis[v] = 0;
        }
        getDepth(i, v);
      }
    }
  }
  
  void getDepth(int i, int v) {
    println(xAxis[v] + "x " + yAxis[v] + "y " + zAxis[i] + "z ");
  }
}

initChunk originChunk = new initChunk(3, 0);

void setup() {
  size(100, 100);
}
