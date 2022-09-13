static int WIDTH = 500;
static int HEIGHT = 500;
static int SEP = rw(.02);

static int rw(float perc) {
  return Math.round(WIDTH*perc);
}

static int rh(float perc) {
  return Math.round(HEIGHT*perc);
}

void setup() {
  size(500, 500);  //feel free to change the size
  noLoop(); //stops the draw() function from repeating
}
void draw() {
  stroke(50, 50, 50);
  background(50, 50, 50);
  for (int xpixel = 0; xpixel <= WIDTH; xpixel+=SEP) {
    for (int ypixel = 0; ypixel <= HEIGHT; ypixel+=SEP) {
      scale(xpixel, ypixel);
    }
  }
}
void scale(int x, int y) {
  pushMatrix();
  float rt = (float) (Math.random() * 45.0 - 22.5);
  rotate(radians(rt)); //WHY DOESN'T PROCESSING CONVERT RANDOM'S DOUBLE
  float xt = x+(float)(Math.random() * 11 - 5);
  float yt = y+(float)(Math.random() * 11 - 5);
  translate(xt, yt);
  scale((float) (1+Math.random()));
  switch ((int)(Math.random() * 4)){
    case 1:
      fill(200+(int)(Math.random() * 127), (int)(Math.random() * 127), (int)(Math.random() * 127));
      break;
    case 2:
      fill(127+(int)(Math.random() * 127), (int)(Math.random() * 127), (int)(Math.random() * 127));
      break;
    case 3:
      fill(100+(int)(Math.random() * 127), (int)(Math.random() * 127), (int)(Math.random() * 127));
      break; //probably unnessecary?  
  }
  beginShape(POLYGON);
  vertex(rw(-.05), rh(-.1));
  bezierVertex(rw(-.05), rh(-.2), rw(.05), rh(-.2), rw(.05), rh(-.1));
  vertex(rw(0), rh(0));
  vertex(rw(-.05), rh(-.1));
  endShape();
  popMatrix();
  //translate(-xt, -yt);
  //rotate(radians(-rt));
}
