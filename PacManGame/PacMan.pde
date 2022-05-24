int pMode;//0 = normal
float x;
float y;
float dx;
float dy;
int lives;
public class PacMan{
  public PacMan (float startx, float starty){
    x = startx;
    y = starty;
    lives = 3;
    pMode = 0;
    dx = 0;
    dy = 0;
  }
  
   public float getX(){
     return x;
   }
   public float getY(){
     return y;
   }
   public float getDx(){
     return dx;
   }
   public float getDy(){
     return dy;
   }
   public void setDx(float newDx){
     dx = newDx;
   }
   public void setDy(float newDy){
     dy = newDy;
   }
   public void move(){
     
   }
   public void wMove(){
     dy = gridSize/256;
     dx = 0;
   }
   public void aMove(){}
   public void sMove(){}
   public void dMove(){}
}
