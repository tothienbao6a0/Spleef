class SpleefMatch { //reset the maps and contains all the methods to edit the arrays and stuff idk
  int[][][] mapArray= new int[10][10][3];
  SpleefMatch() {
    // mapArray = new int[10][10][3];
    gameReset();
  }
  void gameReset() {
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        for (int k = 0; k < 3; k++) {
          mapArray[i][j][k] = 0;
        }
      }
    }
  }

  //test method: 
  void testMethod() {
    //mapArray[1][1][2]=1;//manipulate these values at each location to know that theres an item there (set a range of numbers to decide if an item has spawned there)
  }

  //breakBlocks - we cannot do a switch statement because they change different parts of the array, and checks for different prevkeys
  //it also depends on which player moves, so if player 2 doesn't move then nothing should be checked -> switch shouldnt run 
  void breakBlock1() {//breaks the block in the direction that player is looking at
    if (prevKey1=='a')mapArray[player1.x-1][player1.y][player1.level]=2; // mapArray value is 2 means that the block at that place is broken. 
    if (prevKey1=='d')mapArray[player1.x+1][player1.y][player1.level]=2;
    if (prevKey1=='s')mapArray[player1.x][player1.y+1][player1.level]=2;
    if (prevKey1=='w')mapArray[player1.x][player1.y-1][player1.level]=2;
  }
  void breakBlock2() {//Breaking the block in the direction the player is looking at
    if (prevKey2=='j')mapArray[player2.x-1][player2.y][player2.level]=2;
    if (prevKey2=='l')mapArray[player2.x+1][player2.y][player2.level]=2;
    if (prevKey2=='k')mapArray[player2.x][player2.y+1][player2.level]=2;
    if (prevKey2=='i')mapArray[player2.x][player2.y-1][player2.level]=2;
  }

  void useBowPlayer1() {//uses bow -- we wrote separate methods because of the same reason as the breaking blocks method
    if (prevKey1=='a')mapArray[player1.x-2][player1.y][1]=2;
    if (prevKey1=='d')mapArray[player1.x+2][player1.y][1]=2;
    if (prevKey1=='s')mapArray[player1.x][player1.y+2][1]=2;
    if (prevKey1=='w')mapArray[player1.x][player1.y-2][1]=2;
  }   
  
  void useBowPlayer2() {//uses bow for player 2
    if (prevKey2=='j')mapArray[player2.x-2][player2.y][1]=2;
    if (prevKey2=='l')mapArray[player2.x+2][player2.y][1]=2;
    if (prevKey2=='k')mapArray[player2.x][player2.y+2][1]=2;
    if (prevKey2=='i')mapArray[player2.x][player2.y-2][1]=2;
  }
  
  void useSnowBallP1(){//throw snowball -- we wrote separate methods because of the same reason as the breaking blocks method
    if (prevKey1=='a')mapArray[player1.x-2][player1.y][2]=2;
    if (prevKey1=='d')mapArray[player1.x+2][player1.y][2]=2;
    if (prevKey1=='s')mapArray[player1.x][player1.y+2][2]=2;
    if (prevKey1=='w')mapArray[player1.x][player1.y-2][2]=2;
  }
  
  void useSnowBallP2(){//throws snowball for player 2
    if (prevKey2=='j')mapArray[player2.x-2][player2.y][2]=2;
    if (prevKey2=='l')mapArray[player2.x+2][player2.y][2]=2;
    if (prevKey2=='k')mapArray[player2.x][player2.y+2][2]=2;
    if (prevKey2=='i')mapArray[player2.x][player2.y-2][2]=2;
  }



void colorAllBrokenBlocks(){//after void reset is called, which redraws the map over the existing map, redraw all broken blocks
  for (int level=0; level< 3; level++)//goes through rows
  {
    for (int row = 0; row < 10; row++)//goes through columns
    {
      for (int col = 0; col < 10; col++)
      {
        //print("  "+ mapArray[row][col][level]); //print out array // PUT THE DRAW BLUE BLOCK
        if (mapArray[row][col][level]==2) colorBlock(row*80, col*80, level);
        //if (mapArray[row][col][level]==1) colorBlock(row*80, col*80, level);
      
      }
    }
  } 
}

void colorBlock(int xcoor, int ycoor, int level)//change the color of the block
{
  if (level==2)
  {
    noFill();
    stroke(0, 0, 255);
    rect(xcoor, ycoor, 80, 80);
  } 
  else if (level==1)
  {
    fill(0);
    if (mapArray[(xcoor-40)/80][(ycoor-40)/80][2]==2)
    {
      stroke(0, 0, 255);
      rect(xcoor, ycoor, 80, 80);
    } else 
    {
      stroke(255, 0, 0);
      rect(xcoor, ycoor, 80, 80);
    }
  }
}


//Check if player is on a broken block
void playerOn() {// RECHECK THIS & REWRITE & CLEAN CODE
  if (mapArray[player1.x][player1.y][player1.level]==2 && player1.level==2) 
  {
    println("player 1 standing on broken block");
    player1.level=1;
  }
  if (mapArray[player2.x][player2.y][player2.level]==2 && player2.level==2) 
  {
    println("player 2 standing on broken block"); 
    player2.level=1;
  }//CHANGE THIS TO CHECK IF PLAYER IS ON A BROKEN BLOCK

  if (mapArray[player1.x][player1.y][player1.level]==2 && player1.level==1)  // Player dies
  {
    player1.level=0;
    println("Player 1 died");
  }

  if (mapArray[player2.x][player2.y][player2.level]==2 && player2.level==1)
  {
    player2.level=0;
    println("Player 2 died");
  }
}

void layerChange() {//check if value at a block is 0, if it is then change the color of that block to 2 and change the k value to -1)
}

/* void bowOn()//in 
 {
 //passing the method an int and then return a boolean 
 //for example if there's a bow there, we change the value at that block to 2 or sth
 }*/

void snowBallOn()
{
}

void bowBlock() { // checks if there is an item on a block, then moves it off the map
  if (mapArray[(bow1.xcoor-40)/80][(bow1.ycoor-40)/80][2] !=2) {
    bow1.xcoor = bow1.xcoor;
  } else {
    bow1.xcoor = -25;//moves snowball/bow off the screen
  }
}
void snowBlock(Snowball snowball) {// checks if there is an item on a block, then moves it off the map
  if (mapArray[(snowball.xcoor-40)/80][(snowball.ycoor-40)/80][2] !=2) {
    snowball.xcoor = snowball.xcoor;
  } else {
    snowball.xcoor = -25;
  }
}

void printOut() {
  for (int level=0; level< 3; level++)//goes through rows
  {
    for (int row = 0; row < 10; row++)//goes through columns
    {
      for (int col = 0; col < 10; col++)
      {
        print("  "+ mapArray[row][col][level]); //print out array // PUT THE DRAW BLUE BLOCK
       // if (mapArray[row][col][level]==2) colorBlock(row*80, col*80, level);
      }
      println();
    }
    println(); //Makes a new row
  }
  println();
}
}
