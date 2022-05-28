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
     ghosts.get(1).setX(432);
     ghosts.get(1).setY(368+shiftDown);
   }
   public void kill(int i){
     if (ghosts.get(i).isAlive()==true){
       killCount++;
       ghosts.get(i).setAlive(false);
       ghosts.get(i).setDTimer(120);
       ghosts.get(i).setX(ghosts.get(i).getSpawnX());
       ghosts.get(i).setY(ghosts.get(i).getSpawnY());
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
     if (direction[0] == 0) {
       pacMan.wMove();
     } else if (direction[0] == 1) {
       pacMan.aMove();
     } else if (direction[0] == 2) {
       pacMan.sMove();
     } else {
       pacMan.dMove();
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
       if(level<4){
          dy = -(level*2*gridSize) / 64;
          dx = 0;
       }else{
          dy = -(4*2*gridSize)/64;
          dx = 0;
       }
        
       if (board[yToCor(y)][xToCor(x)] == 0) {
       points += 10;
       board[yToCor(y)][xToCor(x)] = 9;
     } else if (board[yToCor(y)][xToCor(x)] == 2) {
       points += 50;
       board[yToCor(y)][xToCor(x)] = 9;
       if(duration - (level*60) > 0){
         pTimer = (duration - (level*60));
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
       if(level<4){
          dy = 0;
          dx = -(level*2*gridSize) / 64;
       }else{
          dy = 0;
          dx = -(4*2*gridSize) / 64;
       }
        
        //I tossed this code inside so that nothing will happen if you give an improper direction
       if (board[yToCor(y)][xToCor(x)] == 0) {
       points += 10;
       board[yToCor(y)][xToCor(x)] = 9;
     } else if (board[yToCor(y)][xToCor(x)] == 2) {
       points += 50;
       board[yToCor(y)][xToCor(x)] = 9;
       if(duration - (level*60) > 0){
         pTimer = (duration - (level*60));
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
       if(level<4){
          dy = (level*2*gridSize) / 64;
          dx = 0;
       }else{
          dy = (4*2*gridSize)/64;
          dx = 0;
       }
        
       if (board[yToCor(y)][xToCor(x)] == 0) {
       points += 10;
       board[yToCor(y)][xToCor(x)] = 9;
     } else if (board[yToCor(y)][xToCor(x)] == 2) {
       points += 50;
       board[yToCor(y)][xToCor(x)] = 9;
       if(duration - (level*60) > 0){
         pTimer = (duration - (level*60));
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
       if(level<4){
          dy = 0;
          dx = (2*level*gridSize) / 64;
       }else{
          dy =0;
          dx = (2*4*gridSize)/64;
       }

        
       if (board[yToCor(y)][xToCor(x)] == 0) {
       points += 10;
       board[yToCor(y)][xToCor(x)] = 9;
     } else if (board[yToCor(y)][xToCor(x)] == 2) {
       points += 50;
       board[yToCor(y)][xToCor(x)] = 9;
       if(duration - (level*60) > 0){
         pTimer = (duration - (level*60));
       }
     }
     
     
     }
     
   }
   
   
   
   boolean canGoThere (int dir) {

     if (dir == 0) {
       return board[yToCor(y) - 1][xToCor(x)] != 1 && board[yToCor(y) - 1][xToCor(x)] != 8;
     } else if (dir == 1) {
       return board[yToCor(y)][xToCor(x) - 1] != 1 && board[yToCor(y)][xToCor(x) - 1] != 8;
     } else if (dir == 2) {
       return board[yToCor(y) + 1][xToCor(x)] != 1 && board[yToCor(y) + 1][xToCor(x)] != 8;
     } else {
       return board[yToCor(y)][xToCor(x) + 1] != 1 && board[yToCor(y)][xToCor(x) + 1] != 8;
     }     
     
   }
}
