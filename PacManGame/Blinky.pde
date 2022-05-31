float bx;
float by;
float bdx;
float bdy;
boolean bAlive;
int bDeath;
int[]bDir;
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
    bDir = new int[]{1};
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
   void move(){
   }
   int changeDir(){
      Arraylist<Integer>canGo = new ArrayList<Integer>();
     if (bDir[0] == 0){
       if((y-shiftDown)%32==16 && gCanGoThere(0)){
         canGo.add(0);
       }
       if((y-shiftDown)%32==16 && gCanGoThere(1)){
         canGo.add(1);
       }
       if((y-shiftDown)%32==16 && gCanGoThere(3)){
         canGo.add(3);
       }
     }
     if (bDir[0] == 1){
       if(x%32==16 && gCanGoThere(0)){
         canGo.add(0);
       }
       if(x%32==16 && gCanGoThere(1)){
         canGo.add(1);
       }
       if(x%32==16 && gCanGoThere(2)){
         canGo.add(2);
       }
     }
     if (bDir[0] == 2){
       if((y-shiftDown)%32==16 && gCanGoThere(2)){
         canGo.add(2);
       }
       if((y-shiftDown)%32==16 && gCanGoThere(1)){
         canGo.add(1);
       }
       if((y-shiftDown)%32==16 && gCanGoThere(3)){
         canGo.add(3);
       }
     }
     if (bDir[0] == 3){
       if(x%32==16 && gCanGoThere(0)){
         canGo.add(0);
       }
       if(x%32==16 && gCanGoThere(2)){
         canGo.add(2);
       }
       if(x%32==16 && gCanGoThere(3)){
         canGo.add(3);
       }
     }
     //choose randomly the possible directions
     return canGo.get((int)(Math.random()*(canGo.size()+1));
   }
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
   public int getDir(){
     return bDir[0];
   }
   public void setDir(int d){
     dir[0] = d;
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
