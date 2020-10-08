int arraySize = 100;
float[] randomXpos = new float[arraySize];
float[] randomYpos = new float[arraySize];
Ball ball;

void setup()
{ 
  size(900, 900);
  ball = new Ball();
}

void draw()
{   
    background(150, 150, 150); 
    ball.draw(); 
    ball.move();
    ball.merge();
}
