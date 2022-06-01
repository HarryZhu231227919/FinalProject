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
  
   void Gmove(){
     
     if (changeDir()==0){
       wGMove();
     }
     if (changeDir()==1){
       aGMove();
     }
     if (changeDir()==2){
       sGMove();
     }
     if (changeDir()==3){
       dGMove();
     }
     bx+=bdx;
     by+=bdy;
   }
   void wGMove(){
     int ycor = yToCor(by - bdy - (gridSize / 2)-1.5);//checks if cord + 16 is wall
     int xcor = xToCor(bx - bdx);

     //centers when turning
    if((bx%gridSize)!=gridSize/2){
       bx = (xToCor(bx)*gridSize+16);
     }
     
     if (!(board[ycor][xcor] == 1)){
       if(level<3){
          bdy = -(level*2*gridSize) / 64;
          bdx = 0;
       }else{
          bdy = -(2*2*gridSize)/64;
          bdx = 0;
       }
     }
   }
   void aGMove(){
     int xcor = xToCor(bx - bdx - (gridSize / 2) - 1.5);
     int ycor = yToCor(by - bdy);
    if((by-shiftDown)%gridSize!=gridSize/2){
       bdy = yToCor(by)*gridSize+shiftDown+16;
     }
     //exits
     if (!(board[ycor][xcor] == 1)){
       if(level<3){
          bdy = 0;
          bdx = -(level*2*gridSize) / 64;
       }else{
          bdy = 0;
          bdx = -(2*2*gridSize) / 64;
       }
     }
   }
   void sGMove(){
     int ycor = yToCor(by + bdy + (gridSize / 2)+1.5);
     int xcor = xToCor(bx - bdx);
     
     if(bx%gridSize!=gridSize/2){
       bx = xToCor(bx)*gridSize+16;
     }
     
     if (!(board[ycor][xcor] == 1)){
       if(level<3){
          bdy = (level*2*gridSize) / 64;
          bdx = 0;
       }else{
          bdy = (2*2*gridSize)/64;
          bdx = 0;
       }
     }
   }
   void dGMove(){
     int xcor = xToCor(bx + bdx + (gridSize / 2)+1.5);
     int ycor = yToCor(by - bdy);
     
     if((by-shiftDown)%gridSize!=gridSize/2){
       by = (yToCor(by)*gridSize+shiftDown+16);
     }
     //exits
     if (!(board[ycor][xcor] == 1)){
       if(level<3){
          bdy = 0;
          bdx = (2*level*gridSize) / 64;
       }else{
          bdy = 0;
          bdx = (2*2*gridSize)/64;
       }
     }
   }
    public int xToCor(float x){
     return (int)(x / gridSize);
   }
   public int yToCor(float y){
     return (int)((y-shiftDown) / gridSize);
   }
  int changeDir(){
     ArrayList<Integer>canGo = new ArrayList<Integer>();
     canGo.add(bDir[0]);
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
       if(bx%32==16 && gCanGoThere(0)){
         canGo.add(0);
       }
       if(bx%32==16 && gCanGoThere(1)){
         canGo.add(1);
       }
       if(bx%32==16 && gCanGoThere(2)){
         canGo.add(2);
       }
     }
     if (bDir[0] == 2){
       if((by-shiftDown)%32==16 && gCanGoThere(2)){
         canGo.add(2);
       }
       if((by-shiftDown)%32==16 && gCanGoThere(1)){
         canGo.add(1);
       }
       if((by-shiftDown)%32==16 && gCanGoThere(3)){
         canGo.add(3);
       }
     }
     if (bDir[0] == 3){
       if(bx%32==16 && gCanGoThere(0)){
         canGo.add(0);
       }
       if(bx%32==16 && gCanGoThere(2)){
         canGo.add(2);
       }
       if(bx%32==16 && gCanGoThere(3)){
         canGo.add(3);
       }
     }
     //choose randomly out of the possible directions
     return canGo.get((int)(Math.random()*(canGo.size())));
   }
   
   boolean gCanGoThere(int dir){
     if (dir == 0) {
       return board[yToCor(by) - 1][xToCor(bx)] != 1;
     } else if (dir == 1) {
       return board[yToCor(by)][xToCor(bx) - 1] != 1;
     } else if (dir == 2) {
       return board[yToCor(by) + 1][xToCor(bx)] != 1;
     } else if (dir == 3) {
       return board[yToCor(by)][xToCor(bx) + 1] != 1;
     }     
     return false;
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
     bDir[0] = d;
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
