float px;
float py;
float pdx;
float pdy;
boolean pAlive;
int pDeath;
int[]pDir;
final int pspawnx = 432;
final int pspawny = 464+shiftDown;

public class Pinky extends Ghost{
  public Pinky(float startx,float starty,float sdx, float sdy){
    px = startx;
    py = starty;
    pdx = sdx;
    pdy = sdy;
    pAlive = true;
    pDir = new int[]{1};
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
   //void Gmove(Ghost g){}
   //void wGMove(Ghost g){}
   //void aGMove(Ghost g){}
  // void sGMove(Ghost g){}
  // void dGMove(Ghost g){}
   /*int xToCor(float x){
     return (int)x;
   }
   int yToCor(float y){
     return (int)y;
   }*/
  int changeDir(){
      ArrayList<Integer>canGo = new ArrayList<Integer>();
     if (pDir[0] == 0){
       if((py-shiftDown)%32==16 && gCanGoThere(0)){
         canGo.add(0);
       }
       if((py-shiftDown)%32==16 && gCanGoThere(1)){
         canGo.add(1);
       }
       if((py-shiftDown)%32==16 && gCanGoThere(3)){
         canGo.add(3);
       }
     }
     if (pDir[0] == 1){
       if(px%32==16 && gCanGoThere(0)){
         canGo.add(0);
       }
       if(px%32==16 && gCanGoThere(1)){
         canGo.add(1);
       }
       if(px%32==16 && gCanGoThere(2)){
         canGo.add(2);
       }
     }
     if (pDir[0] == 2){
       if((py-shiftDown)%32==16 && gCanGoThere(2)){
         canGo.add(2);
       }
       if((py-shiftDown)%32==16 && gCanGoThere(1)){
         canGo.add(1);
       }
       if((py-shiftDown)%32==16 && gCanGoThere(3)){
         canGo.add(3);
       }
     }
     if (pDir[0] == 3){
       if(px%32==16 && gCanGoThere(0)){
         canGo.add(0);
       }
       if(px%32==16 && gCanGoThere(2)){
         canGo.add(2);
       }
       if(px%32==16 && gCanGoThere(3)){
         canGo.add(3);
       }
     }
     //choose randomly out of the possible directions
     return canGo.get((int)(Math.random()*(canGo.size())));
   }
   
   boolean gCanGoThere(int dir){
     if (dir == 0) {
       return board[yToCor(py) - 1][xToCor(px)] != 1;
     } else if (dir == 1) {
       return board[yToCor(py)][xToCor(px) - 1] != 1;
     } else if (dir == 2) {
       return board[yToCor(py) + 1][xToCor(px)] != 1;
     } else if (dir == 3) {
       return board[yToCor(py)][xToCor(px) + 1] != 1;
     }     
     return false;
   }
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
