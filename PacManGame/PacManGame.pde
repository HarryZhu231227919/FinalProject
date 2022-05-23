int[][] board;
int points;
int level;

void reset(){
  //1 = walls
  //0 = orbs
  board = new int[][]{{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
                      {1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1},
                      {1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1}};
  level = 1;
  points = 0;
  
}
void display(){
  for (int r  = 0;r<board.length;r++){
    for (int c = 0;c<board[0].length;c++){
      if (board[r][c] == 1){
        fill(100);
        rect(c*8,r*8,8,8);
        fill(255);
      }
    }
  }
}
void setup(){
  size(1000,800);
  background(255);
  reset();
}

void draw(){
  display();
}
