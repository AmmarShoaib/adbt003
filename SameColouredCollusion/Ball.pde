class Ball
{

PVector velocity; //Direction and speed of the balls.
float[] vx;
float[] vy;

float diameter; //Size of the balls.
color colour1;
color colour2;
color[] colour;
float colourChooser; //Randoms a value that will choose which colour each ball gets.



Ball()
  {
    diameter = 25;
    colour1 = color(255, 0, 0);
    colour2 = color(0, 0, 255);
    colour = new color[arraySize];
    vx = new float[arraySize];
    vy = new float[arraySize];
    getXposition();
    getYposition();
    colourChoice();
    
    for(int i = 0; i < arraySize; i++)
      {
         velocity = new PVector(random(-4, 4), random(-4, 4));
         vx[i] = velocity.x; //Contains the x value for velocity.
         vy[i] = velocity.y; //Contains the y value for velocity.
      }
    
  }
  
void draw()
  {
    noStroke();   
    for(int i = 0; i < arraySize; i++)
      {
        fill(colour[i]);
        ellipse(randomXpos[i], randomYpos[i], diameter, diameter); 
      }       
  }
  
void colourChoice()
  {
    for(int i = 0; i < arraySize; i++) //Chooses the colour for each ball made.
      {
        colourChooser = random(1, 3);
        
        if(int(colourChooser) == 1)    colour[i] = colour1;
        else  if(int(colourChooser) == 2)  colour[i] = colour2; 
      }
  }

void getYposition()  //Gets the y-cords from where the circles will be drawn at the beginning.
{
  for (int i = 0; i < arraySize; i++)
  {
    randomYpos[i] = random(50, 850);
  }
}

void getXposition()  //Gets the x-cords from where the circles will be drawn at the beginning.
{
  for (int i = 0; i < arraySize; i++)
  {
    randomXpos[i] = random(50, 850);
  }
}
  
void move()
  {
    for(int i = 0; i < arraySize; i++)
      {
        randomXpos[i] = randomXpos[i] + vx[i];
        randomYpos[i] = randomYpos[i] + vy[i];
      }
    for(int i = 0; i < arraySize; i++)
      {
          if(randomXpos[i] < diameter / 2)  vx[i] = -1 * vx[i];  //Left wall.            
          else if(randomXpos[i] > width - (diameter / 2))  vx[i] = -1 * vx[i];  //Right Wall.
            
          if(randomYpos[i] < diameter / 2)  vy[i] = -1 * vy[i];  //Top wall.          
          else if(randomYpos[i] > height - (diameter / 2))  vy[i] = -1 * vy[i];  //Bottom Wall.            
      }    
  }
  
void merge()
  {
    for(int i = 0; i < arraySize; i++)
      {
        for(int j = i + 1; j < arraySize; j++)
          {       
            if((dist(randomXpos[i], randomYpos[i], randomXpos[j], randomYpos[j]) < diameter / 2) && (colour[i] == colour[j])) //Checks if any circles have collided with at least covering the radius.
              {
                randomXpos[i] = randomXpos[j]; //Overlaps both shapes x coords over one another so it becomes one??
                randomYpos[i] = randomYpos[j]; //Sames as top comment but y coords.
              }
              else if((dist(randomXpos[i], randomYpos[i], randomXpos[j], randomYpos[j]) <= diameter) && (colour[i] != colour[j]))
              {
                vx[i] = -1 * vx[i];  vy[i] = -1 * vy[i];
                vx[j] = -1 * vx[j];  vy[j] = -1 * vy[j];
              }
          }
      }
  }

}
