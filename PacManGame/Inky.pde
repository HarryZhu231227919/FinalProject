float ix;
float iy;
float idx;
float idy;
boolean iAlive;
int iDeath;
final int ispawnx = 468;
final int ispawny = 368+shiftDown;

public class Inky extends Ghost{
  public Inky(float startx,float starty,float sdx, float sdy){
    ix = startx;
    iy = starty;
    idx = sdx;
    idy = sdy;
    iAlive = true;
  } 
   public void display(){
     if (iAlive == true){
       noStroke();
       fill(119, 231, 250);
       ellipse(ix,iy, 28, 28);
     }
   }
   void move(){}
   public float getX(){
     return ix;
   }
   public float getY(){
     return iy;
   }
   public float getDx(){
     return idx;
   }
   public float getDy(){
     return idy;
   }
   public void setAlive(boolean a){
     iAlive = a;
   }
   void setX(float x){
     ix = x;
   }
   void setY(float y){
     iy = y;
   }
   void setDx(float speed){
     idx = speed;
   }
   void setDy(float speed){
     idy = speed;
   }
   void setDTimer(int s){
     iDeath = s;
   }
   public int getDTimer(){
     return iDeath;
   }
   public float getSpawnX(){
     return ispawnx;
   }
   public float getSpawnY(){
     return ispawny;
   }
}
