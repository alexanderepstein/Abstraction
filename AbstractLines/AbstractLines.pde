PShape temp;
float lastX = width/2;
float lastY = height/2;

float maxLineLength = map(mouseX,0,width,0,40);
int maxLineConnect = 10;
float xShift = 0;
float yShift = 0;
void setup()
{
  background(255);

  
}
void settings()
{
    
  size(800,800);
  smooth((int)random(2,6));
}

void draw()
{
 
  maxLineLength = map(mouseX,0,width,0,200);
  maxLineConnect = (int)map(mouseY,0,height,0,15);
  lastX = random(0,width);
  lastY = random(0,height);
  
  for (int i=0;i < (int)random(maxLineConnect);i++)
  {
  xShift = random(-maxLineLength,maxLineLength);
  yShift = random(-maxLineLength,maxLineLength);
  stroke((int)random(1,255),(int)random(1,255),(int)random(1,255));
  fill((int)random(1,255),(int)random(1,255),(int)random(1,255));
  strokeWeight((int)random(1,10));
  temp = createShape(LINE,lastX,lastY,lastX + xShift,lastY + yShift);
  lastX += xShift;
  lastY += yShift;
  shape(temp);
  }
}
  void mouseClicked()
  {
    background(255);
  }