int pMode;//0 = normal
float x;
float y;
float dx;
float dy;
int lives;
PImage pacmanl;
PImage pacmanr;
PImage pacmanu;
PImage pacmand;
public class PacMan{
  public PacMan(){}
  public PacMan (float startx, float starty, float sdx,float sdy){
    x = startx;
    y = starty;
    lives = 3;
    pMode = 0;
    dx = sdx;
    dy = sdy;
  }
  
   public float getX(){
     return x;
   }
   public float getY(){
     return y;
   }
   public float getDx(){
     return dx;
   }
   public float getDy(){
     return dy;
   }
   public void setDx(float newDx){
     dx = newDx;
   }
   public void setDy(float newDy){
     dy = newDy;
   }
   
   public void setX (float newX) {
     x = newX;
   }
   
   public void setY (float newY) {
     y = newY;
   }
   public boolean sameGrid(float gx, float gy){
     if (yToCor(y) == yToCor(gy) && xToCor(x) == xToCor(gx)){
       return true;
     }
     return false;
   }
   public void die(){
     lives --;
     x = 432;
     y = 752 + shiftDown;
     direction[0] = 3;
     ghosts.get(0).setX(528);
     ghosts.get(0).setY(464+shiftDown);
     ghosts.get(0).setSpawn(true);
     ghosts.get(1).setX(432);
     ghosts.get(1).setY(368+shiftDown);
     ghosts.get(1).setSpawn(true);
     ghosts.get(2).setX(432);
     ghosts.get(2).setY(464+shiftDown);
     ghosts.get(2).setSpawn(true);
     ghosts.get(3).setX(368);
     ghosts.get(3).setY(464+shiftDown);
     ghosts.get(3).setSpawn(true);
   }
   public void kill(int i){
     if (ghosts.get(i).isAlive()==true){
       killCount++;
       fill(0,255,255);
       textSize(30);
       text("" + 200 * killCount, ghosts.get(i).getX(),ghosts.get(i).getY());
       ghosts.get(i).setAlive(false);
       //ghosts.get(i).setDTimer(300);
       //ghosts.get(i).setSpawn(true);
       //ghosts.get(i).setX(ghosts.get(i).getSpawnX());
      // ghosts.get(i).setY(ghosts.get(i).getSpawnY());
       points+=(200*killCount);

     }
   }
   public void touchGhost(int i){
     if(pacMan.sameGrid(ghosts.get(i).getX(),ghosts.get(i).getY())){
       if (pTimer > 0){
         kill(i);
      }
      else{
        try{
        Thread.sleep(1000);
        pacMan.die();
        }catch(InterruptedException e){}
      }
    }
   }
   public void display(){
     imageMode(CENTER);
     if(frameCount%60 > 30){
       fill(255,204,0);
       ellipse(x,y,32,32);
     }else{
       if(direction[0] == 0){
         image(pacmanu,x,y,32,32);
       }
       if(direction[0] == 1){
         image(pacmanl,x,y,32,32);
       }
       if(direction[0] == 2){
         image(pacmand,x,y,32,32);
       }
       if(direction[0] == 3){
         image(pacmanr,x,y,32,32);
       }
     }
   }
   public int xToCor(float x){
     return (int)(x / gridSize);
   }
   public int yToCor(float y){
     return (int)((y-shiftDown) / gridSize);
   }
   void move(){
     if (!canGoThere(nextMove[0])) {
     if (direction[0] == 0) {
       pacMan.wMove();
     } else if (direction[0] == 1) {
       pacMan.aMove();
     } else if (direction[0] == 2) {
       pacMan.sMove();
     } else {
       pacMan.dMove();
  }
     } else {
       direction[0] = nextMove[0];
       if (nextMove[0] == 0) {
       pacMan.wMove();
     } else if (nextMove[0] == 1) {
       pacMan.aMove();
     } else if (nextMove[0] == 2) {
       pacMan.sMove();
     } else {
       pacMan.dMove();
  }
     }
    
     x+=dx;
     y+=dy;
   }
   void wMove(){
     int ycor = yToCor(y - dy - (gridSize / 2)-1.5);//checks if cord + 16 is wall
     int xcor = xToCor(x - dx);

     //centers when turning
    if(x%gridSize!=gridSize/2){
       x = xToCor(x)*gridSize+16;
     }
     
     if (!(board[ycor][xcor] == 1 || board[ycor][xcor] == 8)){
       if(level<3){
          dy = -((level+1)/2*2*gridSize) / 64;
          dx = 0;
       }else{
          dy = -(2*2*gridSize)/64;
          dx = 0;
       }
        
       if (board[yToCor(y)][xToCor(x)] == 0) {
         dotsEaten ++;
       points += 10;
       board[yToCor(y)][xToCor(x)] = 9;
     } else if (board[yToCor(y)][xToCor(x)] == 2) {
       for (int i = 0; i < ghosts.size(); i ++) {
       ghostRevDir(ghosts.get(i));
       }
       
       dotsEaten ++;
       points += 50;
       board[yToCor(y)][xToCor(x)] = 9;
       if(duration - (level*120) > 0){
         pTimer = (duration - (level*120));
       }
     }
     
     
     }
     
   }
   void aMove(){
     int xcor = xToCor(x - dx - (gridSize / 2) - 1.5);
     int ycor = yToCor(y - dy);
    // println(xcor);
    if((y-shiftDown)%gridSize!=gridSize/2){
       y = yToCor(y)*gridSize+shiftDown+16;
     }
     //exits
     if (!(board[ycor][xcor] == 1 || board[ycor][xcor] == 8)){
       if(level<3){
          dy = 0;
          dx = -((level+1)/2*2*gridSize) / 64;
       }else{
          dy = 0;
          dx = -(2*2*gridSize) / 64;
       }
        
        //I tossed this code inside so that nothing will happen if you give an improper direction
       if (board[yToCor(y)][xToCor(x)] == 0) {
         dotsEaten ++;
       points += 10;
       board[yToCor(y)][xToCor(x)] = 9;
     } else if (board[yToCor(y)][xToCor(x)] == 2) {
       for (int i = 0; i < ghosts.size(); i ++) {
       ghostRevDir(ghosts.get(i));
       }
       dotsEaten ++;
       points += 50;
       board[yToCor(y)][xToCor(x)] = 9;
       if(duration - (level*120) > 0){
         pTimer = (duration - (level*120));
       }
     }
     
     
     }
     
     

   }
   
   
   void sMove(){
     int ycor = yToCor(y + dy + (gridSize / 2)+1.5);
     int xcor = xToCor(x - dx);
     
     if(x%gridSize!=gridSize/2){
       x = xToCor(x)*gridSize+16;
     }
     
     if (!(board[ycor][xcor] == 1 || board[ycor][xcor] == 8)){
       if(level<3){
          dy = ((level+1)/2*2*gridSize) / 64;
          dx = 0;
       }else{
          dy = (2*2*gridSize)/64;
          dx = 0;
       }
        
       if (board[yToCor(y)][xToCor(x)] == 0) {
         dotsEaten ++;
       points += 10;
       board[yToCor(y)][xToCor(x)] = 9;
     } else if (board[yToCor(y)][xToCor(x)] == 2) {
       for (int i = 0; i < ghosts.size(); i ++) {
       ghostRevDir(ghosts.get(i));
       }
       dotsEaten ++;
       points += 50;
       board[yToCor(y)][xToCor(x)] = 9;
       if(duration - (level*120) > 0){
         pTimer = (duration - (level*120));
       }
     }
     
     
     }
  }
  
  
   void dMove(){
     int xcor = xToCor(x + dx + (gridSize / 2)+1.5);
     int ycor = yToCor(y - dy);
     
     if((y-shiftDown)%gridSize!=gridSize/2){
       y = yToCor(y)*gridSize+shiftDown+16;
     }
     //exits
     if (!(board[ycor][xcor] == 1 || board[ycor][xcor] == 8)){
       if(level<3){
          dy = 0;
          dx = (2*(level+1)/2*gridSize) / 64;
       }else{
          dy =0;
          dx = (2*2*gridSize)/64;
       }

        
       if (board[yToCor(y)][xToCor(x)] == 0) {
         dotsEaten ++;
       points += 10;
       board[yToCor(y)][xToCor(x)] = 9;
     } else if (board[yToCor(y)][xToCor(x)] == 2) {
       for (int i = 0; i < ghosts.size(); i ++) {
       ghostRevDir(ghosts.get(i));
       }
       dotsEaten ++;
       points += 50;
       board[yToCor(y)][xToCor(x)] = 9;
       if(duration - (level*120) > 0){
         pTimer = (duration - (level*120));
       }
     }
     
     
     }
     
   }
   
   
   
   boolean canGoThere (int dir) {

     if (dir == 0) {
       return board[yToCor(y) - 1][xToCor(x)] != 1 && board[yToCor(y) - 1][xToCor(x)] != 8;
     } else if (dir == 1 && xToCor(x) - 1>-1) {
       return board[yToCor(y)][xToCor(x) - 1] != 1 && board[yToCor(y)][xToCor(x) - 1] != 8;
     } else if (dir == 2) {
       return board[yToCor(y) + 1][xToCor(x)] != 1 && board[yToCor(y) + 1][xToCor(x)] != 8;
     } else if (dir == 3 && xToCor(x) + 1 < 28) {
       return board[yToCor(y)][xToCor(x) + 1] != 1 && board[yToCor(y)][xToCor(x) + 1] != 8;
     }     
     return false;
   }
   
   void ghostRevDir(Ghost g) {
     int direct = g.getDir();
     int revDirect = g.getRevDir();
     g.setDir(revDirect);
     g.setRevDir(direct);
   } 
}
