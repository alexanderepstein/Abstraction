PShape temp;

float lastX = width/2;
float lastY = height/2;
float centX;
float centY;

float maxVerticieDistance = 150;
int maxVerticies =10;
float xShift = 0;
float yShift = 0;

boolean isAbstract = true;
boolean drawing = false;
boolean onlyVert = true;
boolean saved = false;
boolean infinite = true;

int waitTime = 0;
int shapeMax = 500;
int shapeCount =0;
int shapeType = 3;
float hold = 0;

int bottombarSpace = 100;
void setup()
{
  background(255);
}
void settings()
{

  size(1400, 1400);
  fullScreen();
  smooth((int)random(2, 6));
}
void createBar()
{

  fill(0);
  textSize(16);
  text("Max Shapes: ", 60, height-bottombarSpace/2);
  text("Max Shape Size: ", 300, height-bottombarSpace/2);
  if (!infinite)
  {
    fill(255);
    noStroke();
    rect(180, height-bottombarSpace/2-20, 60, 40);
    //text("Infinite",180,height-bottombarSpace/2);
    fill(0);
    text(Integer.toString(shapeMax), 180, height-bottombarSpace/2);
  } else
  {
    fill(255);
    noStroke();
    rect(180, height-bottombarSpace/2-20, 60, 40);
    //text(Integer.toString(shapeMax),180,height-bottombarSpace/2);
    fill(0);
    text("Infinite", 180, height-bottombarSpace/2);
  }
  fill(0);

  fill (255);
  noStroke();
  rect(430, height-bottombarSpace/2-20, 100, 40);
  fill(0);
  text((int)map(maxVerticieDistance, 0, 500, 0, 100), 430, height-bottombarSpace/2);
  if (isAbstract)
  {
    fill(255);
    rect(600, height-bottombarSpace/2-20, 100, 40);

    fill(0);
    text("Abstract", 600, height-bottombarSpace/2);
  } else
  {
    fill(255);
    rect(600, height-bottombarSpace/2-20, 100, 40);
    fill(0);
    text("Free Form", 600, height-bottombarSpace/2);
  }
  text("Creation Speed: ", 800, height-bottombarSpace/2);
  fill(255);
  rect(930, height-bottombarSpace/2-20, 100, 40);
  fill(0);
  text((int)map(waitTime, 100, 0, 1, 100), 930, height-bottombarSpace/2);
  if (drawing)
  {
    fill(255);
    rect(1098, height-bottombarSpace/2-20, 105, 40);
    fill(0);
    text("Drawing", 1100, height-bottombarSpace/2);
  } else
  {
    fill(255);
    rect(1098, height-bottombarSpace/2-20, 105, 40);
    fill(0);
    text("Appreciating", 1100, height-bottombarSpace/2);
  }
  if (onlyVert)
  {
    fill(0);
    text("R", 1250, height-bottombarSpace/2);
  } else
  {
    fill(255);
    rect(1248, height-bottombarSpace/2-20, 60, 40);
  }
  if (!saved)
  {
    fill(255);
    rect(1270, height-bottombarSpace/2-20, 150, 40);
  } else
  {
    saved = false;
  }
}
void draw()
{
  if (!saved)
  {
    createBar();
  } else
  {
    fill(0);
    text("Saved image!", 1275, height-bottombarSpace/2);
  }

  fill((int)random(1, 255), (int)random(1, 255), (int)random(1, 255));
  if ((!(shapeCount >= shapeMax) || infinite == true) && drawing)
  {

    if (!isAbstract)
    {
      if (onlyVert)
      {
        shapeType = (int)random(1, 5);
      }
      if (mouseY >= height-bottombarSpace- maxVerticieDistance)
      {
        lastY = height-bottombarSpace - maxVerticieDistance;
      } else
      {
        lastY = mouseY;
      }

      lastX = mouseX;
    } else
    {
      if (onlyVert)
      {
        shapeType = (int)random(1, 5);
      } 
      lastX = random(0, width);
      //System.out.println(random(0,height - bottombarSpace - maxVerticieDistance));
      lastY = random(0, height - bottombarSpace - maxVerticieDistance);
    }

    if (shapeType ==3)
    {
      temp = createShape();
      temp.beginShape();
      for (int i=0; i < (int)random(maxVerticies); i++)
      {
        xShift = random(-maxVerticieDistance, maxVerticieDistance);
        yShift = random(-maxVerticieDistance, maxVerticieDistance);

        temp.vertex(lastX + xShift, lastY + yShift);
      }
      temp.endShape(CLOSE);
    } else if (shapeType ==2)
    {
      hold = random(1, maxVerticieDistance);
      temp = createShape(ELLIPSE, lastX, lastY, hold, hold);
    } else if (shapeType ==1)
    {
      temp = createShape(RECT, lastX, lastY, random(1, maxVerticieDistance), random(1, maxVerticieDistance));
    } else if (shapeType ==4)
    {
      hold = random(1, maxVerticieDistance);
      temp = createShape(RECT, lastX, lastY, hold, hold);
    }
    //stroke((int)random(1,255),(int)random(1,255),(int)random(1,255));
    noStroke();
    fill((int)random(1, 255), (int)random(1, 255), (int)random(1, 255));
    strokeWeight((int)random(1, 10));
    shape(temp);
    delay(waitTime*2);
    shapeCount +=1;
    if (saved)
    {
      saved = !saved;
    }
  }
}
void mouseDragged()
{
  if (!isAbstract)
  {
    drawing = true;
  }
}
void mousePressed()
{
  if (!isAbstract)
  {
    drawing = true;
  }
}
void mouseReleased()
{
  if (!isAbstract)
  {
    drawing = false;
  }
}
void keyPressed()
{
  if (key == 'a' || key == 'A')
  {
    isAbstract = !isAbstract;
    drawing = false;
  } else if (key == 'p' || key == 'P')
  {
    if (isAbstract)
    {
      drawing = !drawing;
    }
  } else if (keyCode == UP)
  {
    if (maxVerticieDistance != 500)
    {

      maxVerticieDistance += 25;
    }
  } else if (keyCode == CONTROL)
  {
    infinite = !infinite;
    if (!infinite)
    {
      if (shapeMax < shapeCount)
      {
        shapeMax =shapeCount;
      }
    }
  } else if (keyCode == DOWN)
  {
    if (maxVerticieDistance != 0)
    {

      maxVerticieDistance -= 25;
    }
  } else if (keyCode == RIGHT)
  {
    if (waitTime != 0)
    {
      waitTime -= 10;
    }
  } else if (keyCode == LEFT)
  {
    if (waitTime != 100)
    {
      waitTime += 10;
    }
  } else if (keyCode == SHIFT)
  {
    shapeMax += 20;
  } else if (key == 'r' || key == 'R')
  {
    background(255);
    shapeCount =0;
    shapeMax = 500;
    drawing = false;
  } else if (key == 's' || key == 'S')
  {
    saved = true;

    if (!drawing)
    {
      saveFrame("artistry_###.jpg");
    }
  } else if (key == '2')
  {
    shapeType = 2;
  } else if (key == '3')
  {
    shapeType = 3;
  } else if (key == '1')
  {
    shapeType = 1;
  } else if (key == '4')
  {
    shapeType = 4;
  } else if (key == 't')
  {
    onlyVert = !onlyVert;
  }
}