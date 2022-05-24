int pMode;//0 = normal
float x;
float y;
float dx;
float dy;
int lives;
public class PacMan{
  public PacMan (float startx, float starty){
    x = startx;
    y = starty;
    lives = 3;
    pMode = 0;
    dx = 0;
    dy = 0;
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
   public void move(){
     
   }
   public int xToCor(float x){
     return (int)(x / gridSize);
   }
   public int yToCor(float y){
     return (int)(y + shiftDown / gridSize);
   }
   public void wMove(){
     dy = gridSize / 256;
     dx = 0;
     int ycor = yToCor(y - dy - (gridSize / 2));
     int xcor = xToCor(x - dx);
     
     if (board[ycor][xcor] != 1){
       y -= dy;
     }
     
     if (board[ycor][xcor] == 0) {
       points += 10;
     } else if (board[ycor][xcor] == 2) {
       points += 50;
     }
     board[ycor][xcor] = 9;
     // we can implement the eating part after we make the images
     
   }
   public void aMove(){
     dy = 0;
     dx = gridSize / 256;
     int xcor = xToCor(x - dx - (gridSize / 2));
     int ycor = yToCor(y - dy);
     
     if (board[ycor][xcor] != 1){
       x -= dx;
     }
     if (board[ycor][xcor] == 0) {
       points += 10;
     } else if (board[ycor][xcor] == 2) {
       points += 50;
     }
     
     board[ycor][xcor] = 9;
   }
   
   
   public void sMove(){
     dy = gridSize / 256;
     dx = 0;
     int ycor = yToCor(y + dy + (gridSize / 2));
     int xcor = xToCor(x - dx);
     
     if (board[ycor][xcor] != 1){
       y += dy;
     }
     
     if (board[ycor][xcor] == 0) {
       points += 10;
     } else if (board[ycor][xcor] == 2) {
       points += 50;
     }
     
      board[ycor][xcor] = 9;
  }
  
  
   public void dMove(){
     dy = 0;
     dx = gridSize / 256;
     int xcor = xToCor(x + dx + (gridSize / 2));
     int ycor = yToCor(y - dy);
     
     if (board[ycor][xcor] != 1){
       x += dx;
     }
     
     if (board[ycor][xcor] == 0) {
       points += 10;
     } else if (board[ycor][xcor] == 2) {
       points += 50;
     }
     
     board[ycor][xcor] = 9;
   }
}
