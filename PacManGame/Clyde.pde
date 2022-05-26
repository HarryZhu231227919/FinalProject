float cx;
float cy;
float cdx;
float cdy;
boolean cAlive;
int cDeath;
final int spawnx = 528;
final int spawny = 368+shiftDown;
public class Clyde extends Ghost{
  public Clyde(float startx,float starty,float sdx, float sdy){
    cx = startx;
    cy = starty;
    dx = sdx;
    dy = sdy;
    cAlive = true;
  } 
   public void display(){
     if (cAlive == true){
       if(pTimer>0){
         image(s,cx,cy,32,32);
       }else{
       image(c,cx,cy,32,32);
       }
     }
   }
   void move(){}
   public float getX(){
     return cx;
   }
   public float getY(){
     return cy;
   }
   public float getDx(){
     return cdx;
   }
   public float getDy(){
     return cdy;
   }
   public void setAlive(boolean a){
     cAlive = a;
   }
   public boolean isAlive(){
    return cAlive;
  }
   void setX(float x){
     cx = x;
   }
   void setY(float y){
     cy = y;
   }
   void setDx(float speed){
     cdx = speed;
   }
   void setDy(float speed){
     cdy = speed;
   }
   void setDTimer(int s){
     cDeath = s;
   }
   public int getDTimer(){
     return cDeath;
   }
   public float getSpawnX(){
     return spawnx;
   }
   public float getSpawnY(){
     return spawny;
   }
}
