int heightLimit = 9; //HEIGHT NEEDS TO MATCH CHUNKDEPTH. WILL FIX LATER.
int chunkDepth = 9;

//nRandom class is just an int random class in order to round the float random to an int
class nRandom {
  private int least;
  private int greatest;
  private int result;
  
  public nRandom(int least, int greatest) {
    float resultCalc =  random(least, greatest);
    this.result = round(resultCalc);
  }
}

class initChunk {
  private int topLayer; //toplayer of ground
  private int biome;
  
  //All the axes of the chunk
  private int[] xAxis = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  private int[] yAxis = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  private int[] zAxis = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  
  public initChunk(int topLayer, int biome) {
    this.topLayer = topLayer;
    this.biome = biome;
    genPlanes();
  }
  
  void genPlanes() {
    //loops through the zAxis and also sets it depending on the current index
    for (int i = chunkDepth; i >= 0; i--) {
      zAxis[i] = i;
      //loops through the yAxis and sets the xVal accordingly
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
        //prints the xyz values
        getDepth(i, v);
      }
    }
  }
  
  void getDepth(int i, int v) {
    println(xAxis[v] + "x " + yAxis[v] + "y " + zAxis[i] + "z ");
  }
}

//chunk of origin
initChunk originChunk = new initChunk(3, 0);

void setup() {
  size(100, 100);
}
