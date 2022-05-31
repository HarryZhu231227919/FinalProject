float ix;
float iy;
float idx;
float idy;
boolean iAlive;
int iDeath;
int[]iDir;
final int ispawnx = 468;
final int ispawny = 464+shiftDown;

public class Inky extends Ghost{
  public Inky(float startx,float starty,float sdx, float sdy){
    ix = startx;
    iy = starty;
    idx = sdx;
    idy = sdy;
    iAlive = true;
    iDir = new int[]{1};
  } 
   public void display(){
     if (iAlive == true){
       if(pTimer>0){
         image(s,ix,iy,32,32);
       }else{
         image(i,ix,iy,30,30);
       }
     }
   }
  // void Gmove(Ghost g){}
   //void wGMove(Ghost g){}
   //void aGMove(Ghost g){}
   //void sGMove(Ghost g){}
   //void dGMove(Ghost g){}
   /*int xToCor(float x){
     return (int)x;
   }
   int yToCor(float y){
     return (int)y;
   }*/
  int changeDir(){
      ArrayList<Integer>canGo = new ArrayList<Integer>();
     if (iDir[0] == 0){
       if((iy-shiftDown)%32==16 && gCanGoThere(0)){
         canGo.add(0);
       }
       if((iy-shiftDown)%32==16 && gCanGoThere(1)){
         canGo.add(1);
       }
       if((iy-shiftDown)%32==16 && gCanGoThere(3)){
         canGo.add(3);
       }
     }
     if (iDir[0] == 1){
       if(ix%32==16 && gCanGoThere(0)){
         canGo.add(0);
       }
       if(ix%32==16 && gCanGoThere(1)){
         canGo.add(1);
       }
       if(ix%32==16 && gCanGoThere(2)){
         canGo.add(2);
       }
     }
     if (iDir[0] == 2){
       if((iy-shiftDown)%32==16 && gCanGoThere(2)){
         canGo.add(2);
       }
       if((iy-shiftDown)%32==16 && gCanGoThere(1)){
         canGo.add(1);
       }
       if((iy-shiftDown)%32==16 && gCanGoThere(3)){
         canGo.add(3);
       }
     }
     if (iDir[0] == 3){
       if(ix%32==16 && gCanGoThere(0)){
         canGo.add(0);
       }
       if(ix%32==16 && gCanGoThere(2)){
         canGo.add(2);
       }
       if(ix%32==16 && gCanGoThere(3)){
         canGo.add(3);
       }
     }
     //choose randomly out of the possible directions
     return canGo.get((int)(Math.random()*(canGo.size())));
   }
   
   boolean gCanGoThere(int dir){
     if (dir == 0) {
       return board[yToCor(iy) - 1][xToCor(ix)] != 1;
     } else if (dir == 1) {
       return board[yToCor(iy)][xToCor(ix) - 1] != 1;
     } else if (dir == 2) {
       return board[yToCor(iy) + 1][xToCor(ix)] != 1;
     } else if (dir == 3) {
       return board[yToCor(iy)][xToCor(ix) + 1] != 1;
     }     
     return false;
   }
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
   public boolean isAlive(){
    return iAlive;
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
