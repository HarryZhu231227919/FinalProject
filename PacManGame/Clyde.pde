float cx;
float cy;
float cdx;
float cdy;
boolean cAlive;
int cDeath;
int[]cDir;
final int spawnx = 528;
final int spawny = 464+shiftDown;
public class Clyde extends Ghost{
  public Clyde(float startx,float starty,float sdx, float sdy){
    cx = startx;
    cy = starty;
    dx = sdx;
    dy = sdy;
    cAlive = true;
    cDir = new int[]{1};
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
   //void Gmove(Ghost g){}
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
     if (cDir[0] == 0){
       if((cy-shiftDown)%32==16 && gCanGoThere(0)){
         canGo.add(0);
       }
       if((cy-shiftDown)%32==16 && gCanGoThere(1)){
         canGo.add(1);
       }
       if((cy-shiftDown)%32==16 && gCanGoThere(3)){
         canGo.add(3);
       }
     }
     if (cDir[0] == 1){
       if(cx%32==16 && gCanGoThere(0)){
         canGo.add(0);
       }
       if(cx%32==16 && gCanGoThere(1)){
         canGo.add(1);
       }
       if(cx%32==16 && gCanGoThere(2)){
         canGo.add(2);
       }
     }
     if (cDir[0] == 2){
       if((cy-shiftDown)%32==16 && gCanGoThere(2)){
         canGo.add(2);
       }
       if((cy-shiftDown)%32==16 && gCanGoThere(1)){
         canGo.add(1);
       }
       if((cy-shiftDown)%32==16 && gCanGoThere(3)){
         canGo.add(3);
       }
     }
     if (cDir[0] == 3){
       if(cx%32==16 && gCanGoThere(0)){
         canGo.add(0);
       }
       if(cx%32==16 && gCanGoThere(2)){
         canGo.add(2);
       }
       if(cx%32==16 && gCanGoThere(3)){
         canGo.add(3);
       }
     }
     //choose randomly out of the possible directions
     return canGo.get((int)(Math.random()*(canGo.size())));
   }
   
   boolean gCanGoThere(int dir){
     if (dir == 0) {
       return board[yToCor(cy) - 1][xToCor(cx)] != 1;
     } else if (dir == 1) {
       return board[yToCor(cy)][xToCor(cx) - 1] != 1;
     } else if (dir == 2) {
       return board[yToCor(cy) + 1][xToCor(cx)] != 1;
     } else if (dir == 3) {
       return board[yToCor(cy)][xToCor(cx) + 1] != 1;
     }     
     return false;
   }
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
