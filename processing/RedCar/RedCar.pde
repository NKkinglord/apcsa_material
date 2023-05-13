PImage car;
PImage output;
Kernel[] ks;
int i = 0;

void setup(){
  size(1450,500);
  car = loadImage("redcar.png");
  output = car.copy();

  Kernel k = new Kernel( new float[][] {
    {-1, -1, -1},
    {-1, 8, -1},
    {-1, -1, -1}
  } );
  Kernel k2 = new Kernel( new float[][] {
    {.11, .11, .11},
    {.11, .11, .11},
    {.11, .11, .11}
  } );
  Kernel k3 = new Kernel( new float[][] {
    {0, -1, 0},
    {-1, 4, -1},
    {0, -1, 0}
  } );

  ks = new Kernel[]{k,k2,k3};

  k.apply(car,output);
  image(car,0,0);
  image(output,car.width,0);
   
}
void draw(){keyPressed();
delay(2000);}
void keyPressed() {
  if (key=='m'){
    ks[i % ks.length].apply(car,output);
    image(car,0,0);
    image(output,car.width,0);
    i++;
  }
}
