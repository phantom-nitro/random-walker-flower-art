int north = 0;
int northeast = 1;
int east = 2;
int southeast = 3;
int south = 4;
int southwest = 5;
int west = 6;
int northwest = 7;

int step = 10;

float posX, posY;
int f = 0;

void setup() {
  size(1080, 1080);
  colorMode(HSB, 100);
  background(255, 10, 99);
  frameRate(30);
  noStroke();
  posX = width * 0.5;
  posY = height * 0.5;
}

void draw() {
  for (int i = 0; i < 20; i++) {  // draw times
    int direction = (int) random(0, 8);

    //movement
    if (direction == north) {
      posY -= step;
    }
    if (direction == northeast) {
      posY -= step;
      posX += step;
    }
    if (direction == east) {
      posX += step;
    }
    if (direction == southeast) {
      posY += step;
      posX += step;
    }
    if (direction == south) {
      posY += step;
    }
    if (direction == southwest) {
      posY += step;
      posX -= step;
    }
    if (direction == west) {
      posX -= step;
    }
    if (direction == 7) {
      posY -= step;
      posX -= step;
    }

    //borders
    if (posX > width)
      posX = 0;
    if (posY > height)
      posY = 0;
    if (posX < 0)
      posX = width;
    if (posY < 0)
      posY = height;

    //color circle draw
    /*if(random(1) < 0.1){
     fill(123, 20, 180, (int)random(20, 200));
     ellipse(posX, posY, 10, 10);
     }*/
    if (random(1) < 0.0061) {
      fill((int)random(45, 350), 88, 89, (int)random(180, 200));
      ellipse(posX, posY, 10, 10);
      fill((int)random(45, 350), 88, 89, (int)random(180, 200));
      ellipse(posX, posY + step, 10, 10);
      ellipse(posX, posY - step, 10, 10);
      ellipse(posX + step, posY, 10, 10);
      ellipse(posX - step, posY, 10, 10);

      /*posX = step * (int) random(3);
       posY = step * (int) random(3);*/
      posX = width * 0.5;
      posY = height * 0.5;
    }

    //path draw
    if (random(1)>0.5)
      fill(#468155, 30);
    else fill(#70CE88, 30);
    ellipse(posX, posY, 5, 5);
    filter(INVERT);
  }
  /*if(f++ < 1800){
   saveFrame("line-######.png");
   println(f);
   }*/
}
void keyReleased() {

  if (key == 's' || key == 'S') saveFrame("walk.png");
}
