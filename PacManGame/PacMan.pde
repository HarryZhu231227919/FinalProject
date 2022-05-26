int pMode;//0 = normal
float x;
float y;
float dx;
float dy;
int lives;
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
   public boolean sameGrid(float gx, float gy){
     if (yToCor(y) == yToCor(gy) && xToCor(x) == xToCor(gx)){
       return true;
     }
     return false;
   }
   public void die(){
     lives --;
     x = 432;
     y = 592 + shiftDown;
   }
   public void kill(int i){
     ghosts.get(i).setAlive(false);
     ghosts.get(i).setDTimer(120);
     ghosts.get(i).setX(ghosts.get(i).getSpawnX());
     ghosts.get(i).setY(ghosts.get(i).getSpawnY());
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
     noStroke();
     fill(206, 27, 27);
     ellipse(x,y, 28, 28);
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
     int ycor = yToCor(y - dy - (gridSize / 2));//checks if cord + 16 is wall
     int xcor = xToCor(x - dx);
     //centers when turning
    if(x%gridSize!=gridSize/2){
       x = xToCor(x)*gridSize+16;
     }
     
     if (board[ycor][xcor] == 1 || board[ycor][xcor] == 8){
        dx = 0;
        dy = 0;
     }else{
        dy = -gridSize/32;
        dx = 0;
     }
     
    if (board[yToCor(y)][xToCor(x)] == 0) {
       points += 10;
       board[yToCor(y)][xToCor(x)] = 9;
     } else if (board[yToCor(y)][xToCor(x)] == 2) {
       points += 50;
       board[yToCor(y)][xToCor(x)] = 9;
       pTimer = duration;
     }
     
   }
   void aMove(){
     int xcor = xToCor(x - dx - (gridSize / 2));
     int ycor = yToCor(y - dy);
    // println(xcor);
   /* if(y%gridSize!=gridSize/2){
       y = yToCor(y)*gridSize+16;
     }*/
     //exits
     if(xToCor(x)<=0){
       x = 895;
     }
     
     
     /*
     Why does the dx and dy become 0 when the board is at an exit
     if (board[ycor][xcor] == 1 || board[ycor][xcor] == 8){
        dy = 0;
        dx = 0;
     }else{
         dy = 0;
         dx = -gridSize / 32;
     }
     
     The following code implements the movement of pacman better I think
     */
     if (!(board[ycor][xcor] == 1 || board[ycor][xcor] == 8)){
        dy = 0;
        dx = -gridSize / 32;
        
        
        
        
        //I tossed this code inside so that nothing will happen if you give an improper direction
       if (board[yToCor(y)][xToCor(x)] == 0) {
       points += 10;
       board[yToCor(y)][xToCor(x)] = 9;
     } else if (board[yToCor(y)][xToCor(x)] == 2) {
       points += 50;
       board[yToCor(y)][xToCor(x)] = 9;
       pTimer = duration;
     }
     
     
     }
     
     

   }
   
   
   void sMove(){
     int ycor = yToCor(y + dy + (gridSize / 2));
     int xcor = xToCor(x - dx);
     
     if(x%gridSize!=gridSize/2){
       x = xToCor(x)*gridSize+16;
     }
     
     if (board[ycor][xcor] == 1 || board[ycor][xcor] == 8){
        dy = 0;
        dx = 0;
     }else{
        dy = gridSize / 32;
        dx = 0;
     }
     
    if (board[yToCor(y)][xToCor(x)] == 0) {
       points += 10;
       board[yToCor(y)][xToCor(x)] = 9;
     } else if (board[yToCor(y)][xToCor(x)] == 2) {
       points += 50;
       board[yToCor(y)][xToCor(x)] = 9;
       pTimer = duration;
     }
  }
  
  
   void dMove(){
     int xcor = xToCor(x + dx + (gridSize / 2));
     int ycor = yToCor(y - dy);
     
     //exits
     if(xToCor(x)>=27){
       x = 1;
     }
     if (board[ycor][xcor] == 1 || board[ycor][xcor] == 8){
        dy = 0;
        dx = 0;
     }else{
        dy = 0;
        dx = gridSize / 32;}
     
     if (board[yToCor(y)][xToCor(x)] == 0) {
       points += 10;
       board[yToCor(y)][xToCor(x)] = 9;
     } else if (board[yToCor(y)][xToCor(x)] == 2) {
       points += 50;
       board[yToCor(y)][xToCor(x)] = 9;
       pTimer = duration;
     }
     
   }
}
