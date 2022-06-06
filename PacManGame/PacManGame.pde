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
int[] nextMove;
int duration = 1200;//duration of powerup
int killCount;//to help calculate the point value for a ghost kill
PImage gameover;
int HIGHSCORE = 0;
boolean intro;
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
                      {1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1},
                      {1,2,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,2,1},
                      {1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1},
                      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                      {1,0,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,0,1},
                      {1,0,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,0,1},
                      {1,0,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0,1},
                      {1,1,1,1,1,1,0,1,1,1,1,1,9,1,1,9,1,1,1,1,1,0,1,1,1,1,1,1},
                      {9,9,9,9,9,1,0,1,1,1,1,1,9,1,1,9,1,1,1,1,1,0,1,9,9,9,9,9},
                      {9,9,9,9,9,1,0,1,1,9,9,9,9,9,9,9,9,9,9,1,1,0,1,9,9,9,9,9},
                      {9,9,9,9,9,1,0,1,1,9,1,1,1,8,8,1,1,1,9,1,1,0,1,9,9,9,9,9},
                      {1,1,1,1,1,1,0,1,1,9,1,9,9,9,9,9,9,1,9,1,1,0,1,1,1,1,1,1},
                      {3,9,9,9,9,9,0,9,9,9,1,9,9,9,9,9,9,1,9,9,9,0,9,9,9,9,9,3},
                      {1,1,1,1,1,1,0,1,1,9,1,9,9,9,9,9,9,1,9,1,1,0,1,1,1,1,1,1},
                      {9,9,9,9,9,1,0,1,1,9,1,1,1,1,1,1,1,1,9,1,1,0,1,9,9,9,9,9},
                      {9,9,9,9,9,1,0,1,1,9,9,9,9,9,9,9,9,9,9,1,1,0,1,9,9,9,9,9},
                      {9,9,9,9,9,1,0,1,1,9,1,1,1,1,1,1,1,1,9,1,1,0,1,9,9,9,9,9},
                      {1,1,1,1,1,1,0,1,1,9,1,1,1,1,1,1,1,1,9,1,1,0,1,1,1,1,1,1},
                      {1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1},
                      {1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1},
                      {1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1},
                      {1,2,0,0,1,1,0,0,0,0,0,0,0,9,9,0,0,0,0,0,0,0,1,1,0,0,2,1},
                      {1,1,1,0,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,0,1,1,1},
                      {1,1,1,0,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,0,1,1,1},
                      {1,0,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0,1},
                      {1,0,1,1,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,1,1,0,1},
                      {1,0,1,1,1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,1,1,0,1},
                      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                      {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}};
  level = 1;
  points = 0;
  direction = new int[]{3};
  nextMove = new int[]{-1}; //-1 is for placeholder
  killCount = 0;
  lives = 3;
  ghosts.clear();
  pacMan = new PacMan(432.0, 752+shiftDown,0,0);
  Ghost c = new Clyde(528,464+shiftDown,0,0);
  ghosts.add(c);
  Ghost b = new Blinky(432,368+shiftDown,0,0);
  ghosts.add(b);
  Ghost p = new Pinky(432,464+shiftDown,0,0);
  ghosts.add(p);
  Ghost i = new Inky(368,464+shiftDown,0,0);
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

void displayLives(){
  for(int i = 0;i<lives;i++){
    image(pacmanl,425+(i*45),33,32,32);
  }
}
void setup(){
  size(896, 1042);
  background(10);
  intro = true;
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
  gameover = loadImage("gameover.png");
  reset();
  pTimer = 0;
}

void draw(){
  if(intro){
    background(10);
    fill(255);
    textAlign(CENTER);
    textSize(36);
    text("CHARACTER / NICKNAME",width/2,height/8);
    //BLINKY
    image(b,width/2-250,height/8+25,75,75);
    textSize(30);
    fill(238,40,37);
    text(" - SHADOW     \"BLINKY\"", width/2,height/8+75);
    //PINKY
    fill(248,184,208);
    image(p,width/2-250,height/8+125,75,75);
    text(" - SPEEDY     \"PINKY\"", width/2,height/8+175);
    //INKY
    fill(0,255,223);
    image(i,width/2-250,height/8+225,75,75);
    text(" - BASHFUL     \"INKY\"", width/2,height/8+275);
    //CLYDE
    fill(252,183,74);
    image(c,width/2-255,height/8+325,90,90);
    text(" - POKEY     \"CLYDE\"", width/2,height/8+375);
    
    fill(252, 195, 5);
    ellipse(width/2-100,height/8+665,20,20);
    fill(255);
    text(" 10 POINTS",width/2,height/8+675);
    
    fill(252, 195, 5);
    ellipse(width/2-100,height/8+715,35,35);
    fill(255);
    text(" 50 POINTS",width/2,height/8+725);
    if(frameCount%60>30){
      textSize(60);
      text("PRESS SPACE TO PLAY", width/2,height/8+800);
    }
  }
  else if(lives>0 && intro == false){
    background(10);
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
        pacMan.move();
      }
    }
    
    if(direction[0]==3){
      if(pacMan.xToCor(x)>=27){
         x = 1;
       }
      if(!pacMan.canGoThere(3) && x%32==16){
        stop = true;
        pacMan.move();
      }
    }
    
    if(direction[0]==0){
      if(!pacMan.canGoThere(0) && (y-shiftDown)%32==16){
        stop = true;
        pacMan.move();
      }
    }
    if(direction[0]==2){
      if(!pacMan.canGoThere(2) && (y-shiftDown)%32==16){
        stop = true;
        pacMan.move();
      }
    }
  
  lvlUp();
  if (pTimer>0){
    pTimer--;
  }
  if (pTimer == 0){
    killCount=0;
  }
  for (int i = 0;i<ghosts.size();i++){
    ghosts.get(i).display();
    ghosts.get(i).Gmove();
    pacMan.touchGhost(i);
    if (ghosts.get(i).getDTimer()>0){
      ghosts.get(i).setDTimer(ghosts.get(i).getDTimer()-1);
    }
    if (ghosts.get(i).getDTimer()==0){
      ghosts.get(i).setAlive(true);
    }
  }
  }else{
    if (points > HIGHSCORE) {
      HIGHSCORE = points;
    }
    background(0);
    fill(255);
    text("HIGHSCORE:" + HIGHSCORE,width/2 - 150,height/2 - 400);
    imageMode(CENTER);
    image(gameover,width/2,height/2-100,500,300);
    textAlign(CENTER);
    if(frameCount%60 > 30){
       fill(255);
       text("PRESS SPACEBAR TO RESTART",width/2,(height/2)+100);
    }
  }
  if(intro == false){
  textSize(40);
  fill(255);
  textAlign(LEFT);
  text("Level: " + level, 5, 48);
  text("Score: " + points, 650, 48); 
  text("Lives",300,48);//temp lives
  displayLives();
  }
}

void keyPressed () {
  
  if (key == 32){
    reset();
    intro = false;
  }
  if (key == 'w'||key=='W') {
    if (pacMan.canGoThere(0)) {
    direction[0] = 0;
    nextMove[0] = 0;
    stop = false;
    } else {
      nextMove[0] = 0;
    }
  } 
  
  if (key == 'a'||key=='A') {
    if (pacMan.canGoThere(1)) {
    direction[0] = 1;
    nextMove[0] = 1;
    stop = false;
    } else {
      nextMove[0] = 1;
    }
  }
  
  if (key == 's'||key=='S') {
    if (pacMan.canGoThere(2)) {
    direction[0] = 2;
    nextMove[0] = 2;
    stop = false;
    } else {
      nextMove[0] = 2;
    }
  }
  
  if (key == 'd'||key=='D') {
    if (pacMan.canGoThere(3)) {
    direction[0] = 3;
    nextMove[0] = 3;
    stop = false;
    } else {
      nextMove[0] = 3;
    }
  }
}
