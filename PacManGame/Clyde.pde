float cx;
float cy;
float cdx;
float cdy;
boolean cAlive;
public class Clyde extends Ghost{
  public Clyde(float startx,float starty,float sdx, float sdy){
    cx = startx;
    cy = starty;
    dx = sdx;
    dy = sdy;
    cAlive = true;
  } 
   public void display(){
     background(255);
     noStroke();
     fill(206, 27, 27);
     ellipse(x,y, 28, 28);
   }
  
}
