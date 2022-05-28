float bx;
float by;
float bdx;
float bdy;
boolean bAlive;
int bDeath;
final int bspawnx = 464;
final int bspawny = 432+shiftDown;
final int bspawnx2 = 464;
final int bspawny2 = 464+shiftDown;

public class Blinky extends Ghost{
  public Blinky(float startx,float starty,float sdx, float sdy){
    bx = startx;
    by = starty;
    bdx = sdx;
    bdy = sdy;
    bAlive = true;
  } 
   public void display(){
     if (bAlive == true){
       if(pTimer>0){
         image(s,bx,by,32,32);
       }else{
         image(b,bx,by,32,32);
       }
     }
   }
   void move(){}
   public float getX(){
     return bx;
   }
   public float getY(){
     return by;
   }
   public float getDx(){
     return bdx;
   }
   public float getDy(){
     return bdy;
   }
   public void setAlive(boolean a){
     bAlive = a;
   }
   public boolean isAlive(){
    return bAlive;
  }
   void setX(float x){
     bx = x;
   }
   void setY(float y){
     by = y;
   }
   void setDx(float speed){
     bdx = speed;
   }
   void setDy(float speed){
     bdy = speed;
   }
   void setDTimer(int s){
     bDeath = s;
   }
   public int getDTimer(){
     return bDeath;
   }
   public float getSpawnX(){
     return bspawnx2;
   }
   public float getSpawnY(){
     return bspawny2;
   }
}
