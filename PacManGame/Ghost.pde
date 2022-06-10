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
  public void setRevDir(int d){}
  public int getRevDir() {
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
  void setSpawn(boolean spawn){}
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
   
    void wGMove(){}
    void aGMove(){}
    void sGMove(){}
    void dGMove(){}
  
  void Gmove(){
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
   
   public void reverseDir () {
     int direct = getDir();
     int revDirect = getRevDir();
     setDir(revDirect);
     setRevDir(direct);
   }
}
