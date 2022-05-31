PImage b;
PImage c;
PImage i;
PImage p;
PImage s;
public class Ghost{
  public Ghost(){}
  void move(){}
  public float getX(){
    return 0;
  }
  public float getY(){
    return 0;
  }
  public float getDx(){
    return 0;
  }
  public float getDy(){
    return 0;
  }
  public void setDir(int d){}
  public int getDir(){}
  public void setAlive(boolean a){
  }
  public boolean isAlive(){
    return true;
  }
  void setX(float x){}
  void setY(float y){}
  void setDx(float dx){}
  void setDy(float dy){}
  void display(){}
  void setDTimer(int s){}
  public int xToCor(float x){
     return (int)(x / gridSize);
   }
   public int yToCor(float y){
     return (int)((y-shiftDown) / gridSize);
   }
  boolean gCanGoThere(int dir){
    if (dir == 0) {
       return board[yToCor(y) - 1][xToCor(x)] != 1;
     } else if (dir == 1) {
       return board[yToCor(y)][xToCor(x) - 1] != 1;
     } else if (dir == 2) {
       return board[yToCor(y) + 1][xToCor(x)] != 1;
     } else if (dir == 3) {
       return board[yToCor(y)][xToCor(x) + 1] != 1;
     }     
     return false;
   }
  }
  int getDTimer(){
    return 0;
  }
   public float getSpawnX(){
     return 0;
   }
   public float getSpawnY(){
     return 0;
   }
}
