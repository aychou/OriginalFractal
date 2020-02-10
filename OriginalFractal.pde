PImage photo;
public void setup()
{
	size(500,500);
	rectMode(CENTER);
	photo= loadImage("sky.jpg");

}
public void draw()
{

	background(0);
	image(photo, 0, 0, 500, 500);
	pushMatrix();
  	translate(width*0.5, height*0.5);
  	rotate(frameCount / -100.0);
  	fill(255, 255, 0);
  	myFractal(0, 0, 40, 80, 5); 
  	popMatrix();

}
public void myFractal(float x, float y, float radius1, float radius2, int npoints)
{
	star(x, y, radius1, radius2, npoints);
	if(radius1>10&& radius2>40)
	{
		myFractal(x-radius1, y-radius2, (radius1-10), (radius2-10), npoints);
		myFractal(x+radius1, y+radius2, (radius1-10), (radius2-10), npoints);
	}
	
}
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}