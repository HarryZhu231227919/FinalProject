
float px;
float py;
float pdx;
float pdy;
boolean pAlive;
int pDeath;
int[]pDir;
int[]pRevDir;
boolean pinSpawn;
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
    pRevDir = new int[]{3};
    pinSpawn = true;
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
   void Gmove(){
     if(pinSpawn && pDeath == 0){
       out(pDir[0]);
     }else{
       if(pTimer>0){
         pDir[0] = changeDir();
       }else{
         bestMove();
       }
     }
     if(pDir[0]==1){
      if(xToCor(px)<=0){
         px = 895;
       }
     }
     if(pDir[0]==3){
       if(xToCor(px)>=27){
         px = 1;
       }
     }
     if(px%gridSize==16 && (py-shiftDown)%gridSize==16){
     if (pDir[0]==0){
       wGMove();
     }
     if (pDir[0]==1){
       aGMove();
     }
     if (pDir[0]==2){
       sGMove();
     }
     if (pDir[0]==3){
       dGMove();
     }
     }
     px+=pdx;
     py+=pdy;
   }
   void wGMove(){
     int ycor = yToCor(py - pdy - (gridSize / 2)-1.5);//checks if cord + 16 is wall
     int xcor = xToCor(px - pdx);

     //centers when turning
    if((px%gridSize)!=gridSize/2){
       px = (xToCor(px)*gridSize+16);
     }
     
     if (!(board[ycor][xcor] == 1)|| board[ycor][xcor] == 8){
       pRevDir[0] = 2;
       if(level<3){
          pdy = -((level+1)/2*2*gridSize) / 64;
          pdx = 0;
       }else{
          pdy = -(2*2*gridSize)/64;
          pdx = 0;
       }
     }
   }
   void aGMove(){
     int xcor = xToCor(px - pdx - (gridSize / 2) - 1.5);
     int ycor = yToCor(py - pdy);
    if((py-shiftDown)%gridSize!=gridSize/2){
       pdy = yToCor(py)*gridSize+shiftDown+16;
     }
     //exits
     if (!(board[ycor][xcor] == 1)|| board[ycor][xcor] == 8){
       pRevDir[0] = 3;
       if(level<3){
          pdy = 0;
          pdx = -((level+1)/2*2*gridSize) / 64;
       }else{
          pdy = 0;
          pdx = -(2*2*gridSize) / 64;
       }
     }
   }
   void sGMove(){
     int ycor = yToCor(py + pdy + (gridSize / 2)+1.5);
     int xcor = xToCor(px - pdx);
     
     if(px%gridSize!=gridSize/2){
       px = xToCor(px)*gridSize+16;
     }
     
     if (!(board[ycor][xcor] == 1 || board[ycor][xcor] == 8)){
       pRevDir[0] = 0;
       if(level<3){
          pdy = ((level+1)/2*2*gridSize) / 64;
          pdx = 0;
       }else{
          pdy = (2*2*gridSize)/64;
          pdx = 0;
       }
     }
   }
   void dGMove(){
     int xcor = xToCor(px + pdx + (gridSize / 2)+1.5);
     int ycor = yToCor(py - pdy);
     
     if((py-shiftDown)%gridSize!=gridSize/2){
       py = (yToCor(py)*gridSize+shiftDown+16);
     }
     //exits
     if (!(board[ycor][xcor] == 1 || board[ycor][xcor] == 8)){
       pRevDir[0] = 1;
       if(level<3){
          pdy = 0;
          pdx = ((level+1)/2*2*gridSize) / 64;
       }else{
          pdy = 0;
          pdx = (2*2*gridSize)/64;
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
     if(canGo.size()>0){
       return canGo.get((int)(Math.random()*(canGo.size())));
     }else{
       return pDir[0];
     }
   }
   
   boolean gCanGoThere(int dir){
     if (dir == 0) {
       return (board[yToCor(py)-1][xToCor(px)] != 1 && board[yToCor(py) - 1][xToCor(px)] != 8);
     } else if (dir == 1 && xToCor(px)-1>-1) {
       return (board[yToCor(py)][xToCor(px) - 1] != 1 && board[yToCor(py)][xToCor(px)-1] != 8);
     } else if (dir == 2) {
       return (board[yToCor(py) + 1][xToCor(px)] != 1 && board[yToCor(py) + 1][xToCor(px)] != 8);
     } else if (dir == 3 && xToCor(px)+1<28) {
       return (board[yToCor(py)][xToCor(px) + 1] != 1 && board[yToCor(py)][xToCor(px)+1] != 8);
     }     
     return false;
   }
   
  boolean gCanGoThere2(int dir){
     if (dir == 0) {
       return (board[yToCor(py)-1][xToCor(px)] != 1);
     } else if (dir == 1 && xToCor(px) - 1>-1) {
       return (board[yToCor(py)][xToCor(px) - 1] != 1);
     } else if (dir == 2) {
       return (board[yToCor(py) + 1][xToCor(px)] != 1);
     } else if (dir == 3 && xToCor(px)+1<28) {
       return (board[yToCor(py)][xToCor(px) + 1] != 1);
     }     
     return false;
   }
   
    public void bestMove() {
     float shortest = 10000; //placeholder, no distance can be greater than 10000 in the game
     int gdirection = pDir[0];
     int nextGridX = 0;
     int nextGridY = 0;
     int aheadX = 0;
     int aheadY = 0;
     float temp = 0;
     for (int i = 0; i < 4; i++) {
       if (i != pRevDir[0] && gCanGoThere(i)) {
         if(i == 0){
           nextGridX = 0;
           nextGridY = -gridSize;
         }
         if(i == 1){
           nextGridX = -gridSize;
           nextGridY = 0;
         }
         if(i == 2){
           nextGridX = 0;
           nextGridY = gridSize;
         }
         if(i == 3){
           nextGridX = gridSize;
           nextGridY = 0;
         }
         if(direction[0] == 0){
           aheadX = -128;
           aheadY = -128;
         }
         if(direction[0] == 1){
           aheadX = -128;
           aheadY = 0;
         }
         if(direction[0] == 2){
           aheadX = 0;
           aheadY = 128;
         }
         if(direction[0] == 3){
           aheadX = 128;
           aheadY = 0;
         }
         temp = dist(px+nextGridX,(py-shiftDown)+nextGridY,pacMan.getX()+aheadX,pacMan.getY()+aheadY);
         if (temp < shortest) {
           shortest = temp;
           gdirection = i;
         }
       }
     }
     pDir[0] = gdirection;
   }
   
    public void out(int dir){
     float shortest = 10000; //placeholder, no distance can be greater than 10000 in the game
     int direction = dir;
     int nextGridX = 0;
     int nextGridY = 0;
     float temp = 0;
     if(py == 368+shiftDown && px == 432){
       pinSpawn = false;
     } 
     for (int i = 0; i < 4; i++) {
       if (i != pRevDir[0] && gCanGoThere2(i)) {
         if(i == 0){
           nextGridX = 0;
           nextGridY = -gridSize;
         }
         if(i == 1){
           nextGridX = -gridSize;
           nextGridY = 0;
         }
         if(i == 2){
           nextGridX = 0;
           nextGridY = gridSize;
         }
         if(i == 3){
           nextGridX = gridSize;
           nextGridY = 0;
         }
         temp = dist(px+nextGridX,(py-shiftDown)+nextGridY,432,368+shiftDown);
         if (temp < shortest) {
           shortest = temp;
           direction = i;
         }
       }
     }
     pDir[0] = direction;
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
   public void setSpawn(boolean spawn){
     pinSpawn = spawn;
   }
   
   public int getDir() {
     return pDir[0];
   }
   public int getRevDir() {
     return pRevDir[0];
   }
   
   public void setDir(int d) {
     pDir[0] = d;
   }
   
   public void setRevDir(int d) {
     pRevDir[0] = d;
   } 
}
