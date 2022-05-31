PImage b;
PImage c;
PImage i;
PImage p;
PImage s;

public class Ghost{
  public Ghost(){}
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
  public int getDir(){
    return 0;
  }
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
     return false;
   }
  
  int changeDir(){
     return 0;
   }
   
    void wGMove(Ghost g){
     int ycor = yToCor(g.getY() - g.getDy() - (gridSize / 2)-1.5);//checks if cord + 16 is wall
     int xcor = xToCor(g.getX() - g.getDx());

     //centers when turning
    if(g.getX()%gridSize!=gridSize/2){
       g.setX(xToCor(g.getX())*gridSize+16);
     }
     
     if (!(board[ycor][xcor] == 1)){
       if(level<3){
          g.setDy(-(level*2*gridSize) / 64);
          g.setDx(0);
       }else{
          g.setDy(-(2*2*gridSize)/64);
          g.setDx(0);
       }
     }
   }
    void aGMove(Ghost g){
     int xcor = xToCor(g.getX() - g.getDx()- (gridSize / 2) - 1.5);
     int ycor = yToCor(g.getY() - g.getDy());
    if((g.getY()-shiftDown)%gridSize!=gridSize/2){
       g.setY(yToCor(g.getY())*gridSize+shiftDown+16);
     }
     //exits
     if (!(board[ycor][xcor] == 1)){
       if(level<3){
          g.setDy(0);
          g.setDx(-(level*2*gridSize) / 64);
       }else{
          g.setDy(0);
          g.setDx(-(2*2*gridSize) / 64);
       }
     }
   }
    void sGMove(Ghost g){
     int ycor = yToCor(g.getY() + g.getDy() + (gridSize / 2)+1.5);
     int xcor = xToCor(g.getX() - dx);
     
     if(x%gridSize!=gridSize/2){
       g.setX(xToCor(g.getX())*gridSize+16);
     }
     
     if (!(board[ycor][xcor] == 1)){
       if(level<3){
          g.setDy((level*2*gridSize) / 64);
          g.setDx(0);
       }else{
          g.setDy((2*2*gridSize)/64);
          g.setDx(0);
       }
     }
  }
     void dGMove(Ghost g){
     int xcor = xToCor(g.getX() + g.getDx() + (gridSize / 2)+1.5);
     int ycor = yToCor(g.getY() - dy);
     
     if((y-shiftDown)%gridSize!=gridSize/2){
       g.setY(yToCor(g.getY())*gridSize+shiftDown+16);
     }
     //exits
     if (!(board[ycor][xcor] == 1)){
       if(level<3){
          g.setDy(0);
          g.setDx((2*level*gridSize) / 64);
       }else{
          g.setDy(0);
          g.setDx((2*2*gridSize)/64);
       }
     }
   }
  
  void Gmove(Ghost g){
    /*  if(changeDir(g) == 0){
        wGMove(g);
      }
       if(changeDir(g) == 1){
        aGMove(g);
      }
       if(changeDir(g) == 2){
        sGMove(g);
      }
       if(changeDir(g) == 3){
        dGMove(g);
      }*/
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
