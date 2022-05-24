int[][] board;
int points;
int level;
final int gridSize = 32;
final int shiftDown = 50;
int[] direction;
PacMan pacMan;
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
                      {1,1,1,1,1,1,0,1,1,9,9,9,9,1,1,9,9,9,9,1,1,0,1,1,1,1,1,1},
                      {1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1},
                      {1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1},
                      {1,2,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,2,1},
                      {1,1,0,0,0,0,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,0,0,0,0,1,1},
                      {1,0,0,1,1,1,1,1,1,0,0,0,0,1,1,0,0,0,0,1,1,1,1,1,1,0,0,1},
                      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                      {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}};
  level = 1;
  points = 0;
  direction = new int[]{3};
  pacMan = new PacMan(432.0, 592+shiftDown,0,0);
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
  reset();
}

void draw(){
  pacMan.display();
  display();
  pacMan.move();
  textSize(40);
  fill(0);
  text("Level: " + level, 5, 48);
  text("Score: " + points, 650, 48); //we can make it so that it will auto shift to the left when the number becomes too big. IT'S ALSO OVERLAPPING WITH OLD SCORES RIGHT NOW
}

void keyPressed () {
  if (key == 'w'||key=='W') {
    direction[0] = 0;
  } 
  
  if (key == 'a'||key=='A') {
    direction[0] = 1;
  }
  
  if (key == 's'||key=='S') {
    direction[0] = 2;
  }
  
  if (key == 'd'||key=='D') {
    direction[0] = 3;
  }
}
