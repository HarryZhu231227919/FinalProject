int[][] board;
int points;
int level;
final int gridSize = 32;
final int shiftDown = 50;
int[] direction;
PacMan pacMan;
int pTimer;//timer for pacman powerup
ArrayList <Ghost> ghosts;//turn this into array/arraylist later
boolean stop = false;

int duration = 1200;//duration of powerup
int killCount;//to help calculate the point value for a ghost kill

/* 
0 is w
1 is a
2 is s 
3 is d
*/

void reset(){
  //9 = empty space
  //8 = ghost exit
  //3 = exit
  //2 = super orbs
  //1 = walls
  //0 = orbs
  board = new int[][]{{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
                      {1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1},
                      {1,2,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,2,1},
                      {1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1},
                      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                      {1,0,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,0,1},
                      {1,0,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0,1},
                      {1,1,1,1,1,1,0,1,1,1,1,1,9,1,1,9,1,1,1,1,1,0,1,1,1,1,1,1},
                      {9,9,9,9,9,1,0,1,1,1,1,1,9,1,1,9,1,1,1,1,1,0,1,9,9,9,9,9},
                      {9,9,9,9,9,1,0,1,1,9,9,9,9,9,9,9,9,9,9,1,1,0,1,9,9,9,9,9},
                      {1,1,1,1,1,1,0,1,1,9,1,1,1,8,8,1,1,1,9,1,1,0,1,1,1,1,1,1},
                      {3,9,9,9,9,9,0,9,9,9,1,9,9,9,9,9,9,1,9,9,9,0,9,9,9,9,9,3},
                      {1,1,1,1,1,1,0,1,1,9,1,1,1,1,1,1,1,1,9,1,1,0,1,1,1,1,1,1},
                      {9,9,9,9,9,1,0,1,1,9,9,9,9,9,9,9,9,9,9,1,1,0,1,9,9,9,9,9},
                      {9,9,9,9,9,1,0,1,1,9,1,1,1,1,1,1,1,1,9,1,1,0,1,9,9,9,9,9},
                      {1,1,1,1,1,1,0,1,1,9,1,1,1,1,1,1,1,1,9,1,1,0,1,1,1,1,1,1},
                      {1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1},
                      {1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1},
                      {1,2,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,2,1},
                      {1,1,0,0,0,0,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,0,0,0,0,1,1},
                      {1,0,0,1,1,1,1,1,1,0,0,0,0,1,1,0,0,0,0,1,1,1,1,1,1,0,0,1},
                      {1,0,0,1,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,1,0,0,1},
                      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                      {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}};
  level = 1;
  points = 0;
  direction = new int[]{3};
  killCount = 0;
  pacMan = new PacMan(432.0, 592+shiftDown,0,0);
  Ghost c = new Clyde(528,368+shiftDown,0,0);
  ghosts.add(c);
  Ghost b = new Blinky(432,304+shiftDown,0,0);
  ghosts.add(b);
  Ghost p = new Pinky(432,368+shiftDown,0,0);
  ghosts.add(p);
  Ghost i = new Inky(368,368+shiftDown,0,0);
  ghosts.add(i);
  
}

void lvlUp(){
  int cLvl = level;
  int cPoints = points;
  boolean clear = true;
  for (int i = 0;i<board.length;i++){
    for (int j = 0;j<board[0].length;j++){
      if (board[i][j] == 0 || board[i][j] == 2){
        clear = false;
      }
    }
  }
  if (clear == true){
    reset();
    level = cLvl+1;
    points = cPoints;
  }
}
void display(){
  for (int r = 0; r < board.length; r++){
    for (int c = 0; c < board[0].length; c++){
      if (board[r][c] == 1){
        noStroke();
        fill(2, 63, 183);
        rect(c * gridSize, r * gridSize + shiftDown, gridSize, gridSize);
        fill(255);
      }
      if (board[r][c] == 0){
        noStroke();
        fill(252, 195, 5);
        ellipse(c * gridSize + (gridSize / 2), r * gridSize + (gridSize / 2) + shiftDown, 10, 10);
        fill(255);
      }
      if (board[r][c] == 2){
        noStroke();
        fill(252, 195, 5);
        ellipse(c * gridSize + (gridSize / 2), r * gridSize + (gridSize / 2) + shiftDown, 20, 20);
        fill(255);
      }
      if (board[r][c] == 8){
        noStroke();
        fill(255, 188, 241);
        rect(c * gridSize, r * gridSize + shiftDown, gridSize, gridSize);
        fill(255);
      }
    }
  }  
}

void setup(){
  size(896, 850);
  background(255);
  ghosts = new ArrayList<Ghost>();
  pacmanl = loadImage("pacmanleft.png");
  pacmanr = loadImage("pacmanright.png");
  pacmand = loadImage("pacmandown.png");
  pacmanu = loadImage("pacmanup.png");
  b = loadImage("Blinky.png");
  c = loadImage("Clyde.png");
  i = loadImage("Inky.png");
  p = loadImage("Pinky.png");
  s = loadImage("scaredGhost.png");
  reset();
  pTimer = 0;
}

void draw(){
  background(255);
  pacMan.display();
  display();
  
  if (!stop) {
    pacMan.move();
  }
  if(direction[0]==1){
    if(pacMan.xToCor(x)<=0){
       x = 895;
     }
    if(!pacMan.canGoThere(1) && x%32==16){
      stop = true;
      pacMan.aMove();
    }
  }
  if(direction[0]==3){
    if(pacMan.xToCor(x)>=27){
       x = 1;
     }
    if(!pacMan.canGoThere(3) && x%32==16){
      stop = true;
      pacMan.dMove();
    }
  }
  if(direction[0]==0){
    if(!pacMan.canGoThere(0) && (y-shiftDown)%32==16){
      stop = true;
      pacMan.wMove();
    }
  }
  if(direction[0]==2){
    if(!pacMan.canGoThere(2) && (y-shiftDown)%32==16){
      stop = true;
      pacMan.sMove();
    }
  }
  /*
  if (!pacMan.canGoThere(direction[0]) && x % 32 == 16) {
  stop = true;
    if (direction[0] == 1) {
       pacMan.aMove();
    } else if (direction[0] == 3) {
   pacMan.dMove();
      }
      
  }
  
  if (!pacMan.canGoThere(direction[0]) && (y - shiftDown) % 32 == 16) {
    stop = true;
   if (direction[0] == 0) {
   pacMan.wMove();
  } else if (direction[0] == 2) {
      pacMan.sMove();
  }
  
  
  }*/
  
  
  
  
  
  
  lvlUp();
  if (pTimer>0){
    pTimer--;
  }
  if (pTimer == 0){
    killCount=0;
  }
  for (int i = 0;i<ghosts.size();i++){
    ghosts.get(i).display();
    pacMan.touchGhost(i);
    ghosts.get(i).display();
    if (ghosts.get(i).getDTimer()>0){
      ghosts.get(i).setDTimer(ghosts.get(i).getDTimer()-1);
    }
    if (ghosts.get(i).getDTimer()==0){
      ghosts.get(i).setAlive(true);
    }
  }
  textSize(40);
  fill(0);
  text("Level: " + level, 5, 48);
  text("Score: " + points, 650, 48); 
  text("Lives: " + lives,300,48);//temp lives
}

void keyPressed () {
  
  //we still  need to solve the issue of PacMan's movement
  
  if (key == 'w'||key=='W') {
    if (pacMan.canGoThere(0)) {
    direction[0] = 0;
    stop = false;
    }
  } 
  
  if (key == 'a'||key=='A') {
    if (pacMan.canGoThere(1)) {
    direction[0] = 1;
    stop = false;
    }
  }
  
  if (key == 's'||key=='S') {
    if (pacMan.canGoThere(2)) {
    direction[0] = 2;
    stop = false;
    }
  }
  
  if (key == 'd'||key=='D') {
    if (pacMan.canGoThere(3)) {
    direction[0] = 3;
    stop = false;
    }
  }
}
