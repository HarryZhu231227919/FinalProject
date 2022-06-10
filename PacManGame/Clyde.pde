float cx;
float cy;
float cdx;
float cdy;
boolean cAlive;
int cDeath;
int[]cDir;
int[]cRevDir;
boolean cinSpawn;
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
    cRevDir = new int[]{3};
    cinSpawn = true;
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
 void Gmove(){
     if(cinSpawn && cDeath==0 && dotsEaten >= 82 ){
       out(cDir[0]);
     }else{
       if(pTimer>0){
         cDir[0] = changeDir();
       }else{
         if(dist(cx,cy,pacMan.getX(),pacMan.getY())>256 && !scatterMode){
           bestMove();
         }else{
           scatter();
         }
       }
     }
    
     if(cDir[0]==1){
      if(xToCor(cx)<=0){
         cx = 895;
       }
     }
     if(cDir[0]==3){
       if(xToCor(cx)>=27){
         cx = 1;
       }
     }
     if(cx%gridSize==16 && (cy-shiftDown)%gridSize==16){
     if (cDir[0]==0){
       wGMove();
     }
     if (cDir[0]==1){
       aGMove();
     }
     if (cDir[0]==2){
       sGMove();
     }
     if (cDir[0]==3){
       dGMove();
     }
     }
     cx+=cdx;
     cy+=cdy;
   }
   void wGMove(){
     int ycor = yToCor(cy - cdy - (gridSize / 2)-1.5);//checks if cord + 16 is wall
     int xcor = xToCor(cx - cdx);

     //centers when turning
    if((cx%gridSize)!=gridSize/2){
       cx = (xToCor(cx)*gridSize+16);
     }
     
     if (!(board[ycor][xcor] == 1)|| board[ycor][xcor] == 8){
       cRevDir[0] = 2;
       if(level<3){
          cdy = -((level+1)/2*2*gridSize) / 64;
          cdx = 0;
       }else{
          cdy = -(2*2*gridSize)/64;
          cdx = 0;
       }
     }
   }
   void aGMove(){
     int xcor = xToCor(cx - cdx - (gridSize / 2) - 1.5);
     int ycor = yToCor(cy - cdy);
    if((cy-shiftDown)%gridSize!=gridSize/2){
       cdy = yToCor(cy)*gridSize+shiftDown+16;
     }
     //exits
     if (!(board[ycor][xcor] == 1)|| board[ycor][xcor] == 8){
       cRevDir[0] = 3;
       if(level<3){
          cdy = 0;
          cdx = -((level+1)/2*2*gridSize) / 64;
       }else{
          cdy = 0;
          cdx = -(2*2*gridSize) / 64;
       }
     }
   }
   void sGMove(){
     int ycor = yToCor(cy + cdy + (gridSize / 2)+1.5);
     int xcor = xToCor(cx - cdx);
     
     if(cx%gridSize!=gridSize/2){
       cx = xToCor(cx)*gridSize+16;
     }
     
     if (!(board[ycor][xcor] == 1 || board[ycor][xcor] == 8)){
       cRevDir[0] = 0;
       if(level<3){
          cdy = ((level+1)/2*2*gridSize) / 64;
          cdx = 0;
       }else{
          cdy = (2*2*gridSize)/64;
          cdx = 0;
       }
     }
   }
   void dGMove(){
     int xcor = xToCor(cx + cdx + (gridSize / 2)+1.5);
     int ycor = yToCor(cy - cdy);
     
     if((cy-shiftDown)%gridSize!=gridSize/2){
       cy = (yToCor(cy)*gridSize+shiftDown+16);
     }
     //exits
     if (!(board[ycor][xcor] == 1 || board[ycor][xcor] == 8)){
      cRevDir[0] = 1;
       if(level<3){
          cdy = 0;
          cdx = ((level+1)/2*2*gridSize) / 64;
       }else{
          cdy = 0;
          cdx = (2*2*gridSize)/64;
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
     if(canGo.size()>0){
       return canGo.get((int)(Math.random()*(canGo.size())));
     }else{
       return cDir[0];
     }
   }
   
   boolean gCanGoThere(int dir){
     if (dir == 0) {
       return board[yToCor(cy)-1][xToCor(cx)] != 1 && board[yToCor(cy) - 1][xToCor(cx)] != 8;
     } else if (dir == 1 && xToCor(cx) - 1>-1) {
       return board[yToCor(cy)][xToCor(cx) - 1] != 1 && board[yToCor(cy)][xToCor(cx)-1] != 8;
     } else if (dir == 2) {
       return board[yToCor(cy) + 1][xToCor(cx)] != 1 && board[yToCor(cy) + 1][xToCor(cx)] != 8;
     } else if (dir == 3 && xToCor(cx)+1<28) {
       return board[yToCor(cy)][xToCor(cx) + 1] != 1 && board[yToCor(cy) - 1][xToCor(cx)+1] != 8;
     }     
     return false;
   }
   
    boolean gCanGoThere2(int dir){
     if (dir == 0) {
       return (board[yToCor(cy)-1][xToCor(cx)] != 1);
     } else if (dir == 1 && xToCor(cx) - 1>-1) {
       return (board[yToCor(cy)][xToCor(cx) - 1] != 1);
     } else if (dir == 2) {
       return (board[yToCor(cy) + 1][xToCor(cx)] != 1);
     } else if (dir == 3 && xToCor(cx)+1<28) {
       return (board[yToCor(cy)][xToCor(cx) + 1] != 1);
     }     
     return false;
   }
   
    public void bestMove() {
     float shortest = 10000; //placeholder, no distance can be greater than 10000 in the game
     int direction = cDir[0];
     int nextGridX = 0;
     int nextGridY = 0;
     float temp = 0;
     for (int i = 0; i < 4; i++) {
       if (i != cRevDir[0] && gCanGoThere(i)) {
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
         temp = dist(cx+nextGridX,(cy-shiftDown)+nextGridY,pacMan.getX(),pacMan.getY());
         if (temp < shortest) {
           shortest = temp;
           direction = i;
         }
       }
     }
     cDir[0] = direction;
   }
   
    public void scatter() {
     float shortest = 10000; //placeholder, no distance can be greater than 10000 in the game
     int direction = cDir[0];
     int nextGridX = 0;
     int nextGridY = 0;
     float temp = 0;
     for (int i = 0; i < 4; i++) {
       if (i != cRevDir[0] && gCanGoThere(i)) {
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
         temp = dist(cx+nextGridX,(cy-shiftDown)+nextGridY,0,1080);
         if (temp < shortest) {
           shortest = temp;
           direction = i;
         }
       }
     }
     cDir[0] = direction;
   }
   
    public void out(int dir){
     float shortest = 10000; //placeholder, no distance can be greater than 10000 in the game
     int direction = dir;
     int nextGridX = 0;
     int nextGridY = 0;
     float temp = 0;
     if(cy == 368+shiftDown && cx == 464){
       cinSpawn = false;
     } 
     for (int i = 0; i < 4; i++) {
       if (i != cRevDir[0] && gCanGoThere2(i)) {
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
         temp = dist(cx+nextGridX,(cy-shiftDown)+nextGridY,464,336+shiftDown);
         if (temp < shortest) {
           shortest = temp;
           direction = i;
         }
       }
     }
     cDir[0] = direction;
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
   public void setSpawn(boolean spawn){
     cinSpawn = spawn;
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
   
   public int getDir() {
     return cDir[0];
   }
   public int getRevDir() {
     return cRevDir[0];
   }
   
   public void setDir(int d) {
     cDir[0] = d;
   }
   
   public void setRevDir(int d) {
     cRevDir[0] = d;
   }
}
