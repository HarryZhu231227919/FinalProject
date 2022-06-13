float ix;
float iy;
float idx;
float idy;
boolean iAlive;
int iDeath;
boolean iinSpawn;
int[]iDir;
int[]iRevDir;
final int ispawnx = 368;
final int ispawny = 464+shiftDown;

public class Inky extends Ghost{
  public Inky(float startx,float starty,float sdx, float sdy){
    ix = startx;
    iy = starty;
    idx = sdx;
    idy = sdy;
    iAlive = true;
    iDir = new int[]{1};
    iRevDir = new int[]{3};
    iinSpawn = true;
  } 
   public void display(){
     if (iAlive == true){
       if(pTimer>0){
         image(s,ix,iy,32,32);
       }else{
         image(i,ix,iy,30,30);
       }
     } else {
      //code that displayes the image for a set of eyeballs
      image(e,ix,iy,32,32);
    }
   }
   void Gmove(){
     if (ix > 352 && ix < 544 && iy > 416 + shiftDown && iy < 544 + shiftDown) {
       setAlive(true);
       setSpawn(true);
     }
     if(iinSpawn && dotsEaten >= 30){
       out(iDir[0]);
     }else{
       if (iAlive){
       if(pTimer>0){
         iDir[0] = changeDir();
       }else{
         if (!scatterMode) {
         bestMove();
         } else {
           scatter();
         }
       }
       } else {
       bestMove();
     }
     }
     if(iDir[0]==1){
      if(xToCor(ix)<=0){
         ix = 895;
       }
     }
     if(iDir[0]==3){
       if(xToCor(ix)>=27){
         ix = 1;
       }
     }
     if(ix%gridSize==16 && (iy-shiftDown)%gridSize==16){
     if (iDir[0]==0){
       wGMove();
     }
     if (iDir[0]==1){
       aGMove();
     }
     if (iDir[0]==2){
       sGMove();
     }
     if (iDir[0]==3){
       dGMove();
     }
     }
     ix+=idx;
     iy+=idy;
   }
   void wGMove(){
     int ycor = yToCor(iy - idy - (gridSize / 2)-1.5);//checks if cord + 16 is wall
     int xcor = xToCor(ix - idx);

     //centers when turning
    if((ix%gridSize)!=gridSize/2){
       ix = (xToCor(ix)*gridSize+16);
     }
     
     if (!(board[ycor][xcor] == 1)){
       if (iAlive) {
         if (!(board[ycor][xcor] == 8)) {
       iRevDir[0] = 2;
       if(level<3 && iAlive){
          idy = -((level+1)/2*2*gridSize) / 64;
          idx = 0;
       }else{
          idy = -(2*2*gridSize)/64;
          idx = 0;
       }
         }
       } else {
         iRevDir[0] = 2;
       if(level<3 && iAlive){
          idy = -((level+1)/2*2*gridSize) / 64;
          idx = 0;
       }else{
          idy = -(2*2*gridSize)/64;
          idx = 0;
       }
       }
     }
   }
   void aGMove(){
     int xcor = xToCor(ix - idx - (gridSize / 2) - 1.5);
     int ycor = yToCor(iy - idy);
    if((iy-shiftDown)%gridSize!=gridSize/2){
       idy = yToCor(iy)*gridSize+shiftDown+16;
     }
     //exits
     if (!(board[ycor][xcor] == 1)){
       if (iAlive) {
         if (!(board[ycor][xcor] == 8)) {
       iRevDir[0] = 3;
       if(level<3 && iAlive){
          idy = 0;
          idx = -((level+1)/2*2*gridSize) / 64;
       }else{
          idy = 0;
          idx = -(2*2*gridSize) / 64;
       }
         }
       } else {
         iRevDir[0] = 3;
       if(level<3 && iAlive){
          idy = 0;
          idx = -((level+1)/2*2*gridSize) / 64;
       }else{
          idy = 0;
          idx = -(2*2*gridSize) / 64;
       }
       }
     }
   }
   void sGMove(){
     int ycor = yToCor(iy + idy + (gridSize / 2)+1.5);
     int xcor = xToCor(ix - idx);
     
     if(ix%gridSize!=gridSize/2){
       ix = xToCor(ix)*gridSize+16;
     }
     
     if (!(board[ycor][xcor] == 1)){
       if (iAlive) {
         if (!(board[ycor][xcor] == 8)) {
       iRevDir[0] = 0;
       if(level<3 && iAlive){
          idy = ((level+1)/2*2*gridSize) / 64;
          idx = 0;
       }else{
          idy = (2*2*gridSize)/64;
          idx = 0;
       }
         }
       } else {
         iRevDir[0] = 0;
       if(level<3 && iAlive){
          idy = ((level+1)/2*2*gridSize) / 64;
          idx = 0;
       }else{
          idy = (2*2*gridSize)/64;
          idx = 0;
       }
       }
     }
   }
   void dGMove(){
     int xcor = xToCor(ix + idx + (gridSize / 2)+1.5);
     int ycor = yToCor(iy - idy);
     
     if((iy-shiftDown)%gridSize!=gridSize/2){
       iy = (yToCor(iy)*gridSize+shiftDown+16);
     }
     //exits
     if (!(board[ycor][xcor] == 1)){
       if (iAlive) {
         if (!(board[ycor][xcor] == 8)) {
       iRevDir[0] = 1;
       if(level<3 && iAlive){
          idy = 0;
          idx = ((level+1)/2*2*gridSize) / 64;
       }else{
          idy = 0;
          idx = (2*2*gridSize)/64;
       }
         }
       } else { 
         iRevDir[0] = 1;
       if(level<3 && iAlive){
          idy = 0;
          idx = ((level+1)/2*2*gridSize) / 64;
       }else{
          idy = 0;
          idx = (2*2*gridSize)/64;
       }
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
     if(canGo.size()>0){
       return canGo.get((int)(Math.random()*(canGo.size())));
     }else{
       return iDir[0];
     }
   }
   
   boolean gCanGoThere(int dir){
     if (iAlive) {
     if (dir == 0) {
       return board[yToCor(iy)-1][xToCor(ix)] != 1 && board[yToCor(iy) - 1][xToCor(ix)] != 8;
     } else if (dir == 1 && xToCor(ix)-1>-1) {
       return board[yToCor(iy)][xToCor(ix) - 1] != 1 && board[yToCor(iy)][xToCor(ix)-1] != 8;
     } else if (dir == 2) {
       return board[yToCor(iy) + 1][xToCor(ix)] != 1 && board[yToCor(iy) + 1][xToCor(ix)] != 8;
     } else if (dir == 3 && xToCor(ix)+1<28) {
       return board[yToCor(iy)][xToCor(ix) + 1] != 1 && board[yToCor(iy)][xToCor(ix)+1] != 8;
     }     
     } else {
            if (dir == 0) {
       return board[yToCor(iy)-1][xToCor(ix)] != 1;
     } else if (dir == 1 && xToCor(ix)-1>-1) {
       return board[yToCor(iy)][xToCor(ix) - 1] != 1;
     } else if (dir == 2) {
       return board[yToCor(iy) + 1][xToCor(ix)] != 1;
     } else if (dir == 3 && xToCor(ix)+1<28) {
       return board[yToCor(iy)][xToCor(ix) + 1] != 1;
     }
     }
     return false;
   }
   
    boolean gCanGoThere2(int dir){
     if (dir == 0) {
       return (board[yToCor(iy)-1][xToCor(ix)] != 1);
     } else if (dir == 1 && xToCor(ix) - 1>-1) {
       return (board[yToCor(iy)][xToCor(ix) - 1] != 1);
     } else if (dir == 2) {
       return (board[yToCor(iy) + 1][xToCor(ix)] != 1);
     } else if (dir == 3 && xToCor(ix)+1<28) {
       return (board[yToCor(iy)][xToCor(ix) + 1] != 1);
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
   public void setSpawn(boolean spawn){
     iinSpawn = spawn;
   }
   public void out(int dir){
     float shortest = 10000; //placeholder, no distance can be greater than 10000 in the game
     int direction = dir;
     int nextGridX = 0;
     int nextGridY = 0;
     float temp = 0;
     if(iy == 368+shiftDown && ix == 432){
       iinSpawn = false;
     } 
     for (int i = 0; i < 4; i++) {
       if (i != iRevDir[0] && gCanGoThere2(i)) {
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
         temp = dist(ix+nextGridX,(iy-shiftDown)+nextGridY,432,368+shiftDown);
         if (temp < shortest) {
           shortest = temp;
           direction = i;
         }
       }
     }
     iDir[0] = direction;
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
       if (i != iRevDir[0] && gCanGoThere(i)) {
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
           aheadX = -64;
           aheadY = -64;
         }
         if(direction[0] == 1){
           aheadX = -64;
           aheadY = 0;
         }
         if(direction[0] == 2){
           aheadX = 0;
           aheadY = 64;
         }
         if(direction[0] == 3){
           aheadX = 64;
           aheadY = 0;
         }
         if (iAlive) {
         temp = dist(ix+nextGridX,(iy-shiftDown)+nextGridY, pacMan.getX() + aheadX - (bx - (pacMan.getX()+aheadX)), pacMan.getY() + aheadY- (by - (pacMan.getY()+aheadY)));
         } else {
           temp = dist(ix+nextGridX,(iy-shiftDown)+nextGridY,getSpawnX(),getSpawnY());
         }
         if (temp < shortest) {
           shortest = temp;
           gdirection = i;
         }
       }
     }
     iDir[0] = gdirection;
   }
   
   public int getDir() {
     return iDir[0];
   }
   public int getRevDir() {
     return iRevDir[0];
   }
   
   public void setDir(int d) {
     iDir[0] = d;
   }
   
   public void setRevDir(int d) {
     iRevDir[0] = d;
   } 
   
   public void scatter() {
     float shortest = 10000; //placeholder, no distance can be greater than 10000 in the game
     int direction = iDir[0];
     int nextGridX = 0;
     int nextGridY = 0;
     float temp = 0;
     for (int i = 0; i < 4; i++) {
       if (i != iRevDir[0] && gCanGoThere(i)) {
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
         temp = dist(ix+nextGridX,(iy-shiftDown)+nextGridY,870,1080);
         if (temp < shortest) {
           shortest = temp;
           direction = i;
         }
       }
     }
     iDir[0] = direction;
   }

}
