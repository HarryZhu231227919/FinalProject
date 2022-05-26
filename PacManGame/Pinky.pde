float px;
float py;
float pdx;
float pdy;
boolean pAlive;
int pDeath;
final int pspawnx = 432;
final int pspawny = 368+shiftDown;

public class Pinky extends Ghost{
  public Pinky(float startx,float starty,float sdx, float sdy){
    px = startx;
    py = starty;
    pdx = sdx;
    pdy = sdy;
    pAlive = true;
  } 
   public void display(){
     if (pAlive == true){
       if(pTimer>0){
         image(s,px,py,32,32);
       }else{
         image(p,px,py,32,32);
       }
     }
   }
   void move(){}
   public float getX(){
     return px;
   }
   public float getY(){
     return py;
   }
   public float getDx(){
     return pdx;
   }
   public float getDy(){
     return pdy;
   }
   public void setAlive(boolean a){
     pAlive = a;
   }
   public boolean isAlive(){
    return pAlive;
  }
   void setX(float x){
     px = x;
   }
   void setY(float y){
     py = y;
   }
   void setDx(float speed){
     pdx = speed;
   }
   void setDy(float speed){
     pdy = speed;
   }
   void setDTimer(int s){
     pDeath = s;
   }
   public int getDTimer(){
     return pDeath;
   }
   public float getSpawnX(){
     return pspawnx;
   }
   public float getSpawnY(){
     return pspawny;
   }
}
