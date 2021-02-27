//Project Name: Spleef
//Contributors: Bao To, Daniel Sung, Adithya Kaylan
//Course name: Algorithms and Data Structures (Fall & Winter)
//Block: E
PFont f;
PImage img;
SpleefMatch map;
Snowball snowball1;
Snowball snowball2;
Player player1;
Player player2; 
Bow bow1;
int counter=0;
int p1score=0;
int p2score=0;
boolean gameOn=true;
void reset() {//redraw and reset everything when new game starts or space is pressed
  //map UI and value resets
  fill(255);
  strokeWeight(5);
  rect(0, 0, 1400, 1000);
  fill(0);
  stroke(255, 0, 0);

  for (int x=0; x<=800; x+=800/10) {//draws the map of the game
    line(0, x, 800, x);
  }
  for (int y=0; y<=800; y+=800/10) {
    line(y, 0, y, 800);
  }
  stroke(0);
  f=createFont("Arial", 100, true);
  textAlign(CENTER, CENTER);
  text("SPLEEF 2D", 1100, 600);
  
}
//Bao: Game Map
void setup() {
  size(1400, 800);//create background
  strokeWeight(10);
  f=createFont("Arial", 100, true);
  textFont(f, 30);
  player1 = new Player(1, 0, 0, 2, 2);
  player2 = new Player(2, 9, 9, 2, 2);

  //initialise the map UI 
  map= new SpleefMatch();//create a new array every time game restarts
  snowball1 = new Snowball(1, int(random(1, 10)), int(random(1, 10)), 2);//create new snowballs and bows
  snowball2 = new Snowball(1, int(random(1, 10)), int(random(1, 10)), 2);
  bow1= new Bow(int(random(1, 10)), int(random(1, 10)), 2);
  reset();  
  map.gameReset();//reset the array to original values
  //public char prevKey1='f';
}

void draw()//displays players, items and scoreboard
{
  if (gameOn==true) {
    player1.display();
    player2.display();
    snowball1.display();
    snowball2.display();
    bow1.display();
    scoreBoard();
  }
}
//Daniel: Player's movement
char prevKey1=' ';
char prevKey2=' ';//initialise prevKeys
void keyPressed()
{ //test
  if (gameOn==false)
  {
    if (key==' ')
    {
      gameOn=true;//game is happening
      reset();
      setup();
    }
  } else if (gameOn==true)
  {
    reset();
    //map.printOut(); --> prints out 3d array into console if needed
    counter++;
    if (counter % 30==0) {
      bow1.getRandom(); 
      snowball1.getRandom();
      snowball2.getRandom();
    }
    reset();
    //map.printOut();
    map.bowBlock();//checks if bow is on a broken block
    map.snowBlock(snowball1);//checks if snowball is on a broken block
    map.snowBlock(snowball2);
    map.colorAllBrokenBlocks(); //recolor all broken blocks because the nature of processing will cause the broken blocks to disappear if not redrawn
    //map.printOut();
    player1.testItem(player1);
    player2.testItem(player2);

    //check if the value at that point is 2, if yes then give that block a color blue. 
    //for 
   
   //PLAYER 1's MOVEMENT/KEYBINDS
    if (key=='d' && player1.x>=0 && player1.x<=8)
    {
      player1.x+=1;//moves the player in the direction of the key 
      prevKey1='d';// save the key so that we know what direction the players were previously looking at. 
    }

    if (key=='a' && player1.x>=1 && player1.x<=9)
    {
      player1.x-=1;
      prevKey1='a';
    }

    if (key=='w' && player1.y>=1 && player1.y<=9)
    {
      player1.y-=1;
      prevKey1='w';
    }

    if (key=='s' && player1.y>=0 && player1.y<=8)
    {
      player1.y+=1;
      prevKey1='s';
    }
//Bao do this part next class
    if (key=='e')//if the e key is pressed, the player 1 either breaks a block or uses the item in their hand
    {
      if (prevKey1=='d' && player1.x>=0 && player1.x<=8)// We used prevKey here because we need to know what direction the player was previously looking at in order to know in which direction they will break the block 
      {
        println("breaking in d");
        //add a boolean here to see if the player is holding the item.
        if (player1.checkItem(player1)==true)//if the player is actually holding an item, use it
        {
          player1.useItem(player1, 'd');//useItem allows the user to use the item they are holding. 
        } else {
          map.breakBlock1();//breaks the block in that direction normally, since the player is not holding an item
          map.colorBlock((player1.x+1)*80, player1.y*80, player1.level);//change the color, showing that the block is broken in that direction
        }
      }
      if (prevKey1=='s'&& player1.y>0 && player1.y<8)
      {
        println("breaking in s");
        if (player1.checkItem(player1)==true)
        {
          player1.useItem(player1, 's');
        } else {
          map.breakBlock1();
          map.colorBlock((player1.x)*80, (player1.y+1)*80, player1.level);
        }
      }
      if (prevKey1=='a'&&player1.x>1 && player1.x<9)
      {
        println("breaking in a");
        if (player1.checkItem(player1)==true)
        {
          player1.useItem(player1, 'a');
        } else {
          map.breakBlock1();
          map.colorBlock((player1.x-1)*80, (player1.y)*80, player1.level);
        }
      }
      if (prevKey1=='w'&& player1.y>1 && player1.y<9)
      {
        println("breaking in w");//CHECK THE REST PREV KEYS
        if (player1.checkItem(player1)==true)
        {
          player1.useItem(player1, 'w');
        } else {
          map.breakBlock1();
          map.colorBlock((player1.x)*80, (player1.y-1)*80, player1.level);
        }
      }
    }

    // PLAYER 2's MOVEMENT/KEYBIND - we could not do a switch/shortened if because the keys for movements and actions are too complex. - SIMILAR CODE TO PLAYER 1 
    if (keyCode==RIGHT && player2.x>=0 && player2.x<=8)
    {
      player2.x+=1;
      prevKey2='l';
    }

    if (keyCode==LEFT && player2.x>=1 && player2.x<=9)
    {
      player2.x-=1;
      prevKey2='j';
    }

    if (keyCode==UP && player2.y>=1 && player2.y<=9)
    {
      player2.y-=1;
      prevKey2='i';
    }

    if (keyCode==DOWN && player2.y>=0 && player2.y<=8)
    {
      player2.y+=1;
      prevKey2='k';
    }

    if (keyCode=='/')//if the l key is pressed, the player 1 either breaks a block or uses the item in their hand
    {
      if (prevKey2=='l'&& player2.x>0 && player2.x<8) // for this class we did not check for the UP DOWN LEFT RIGHT keys because they cannot be saved as characters. So we attached the keys i,j,k,l to UP DOWN LEFT RIGHT, so that it works like the player 1
      {
        println("p2 right");

        if (player2.checkItem(player2)==true) {
          player2.useItem(player2, 'l');
        } else {
          map.breakBlock2();//fix this to make the blocks save when you redraw the map.
          map.colorBlock((player2.x+1)*80, player2.y*80, player2.level);
        }
      } //CHECK THE REST PREV KEYS
      if (prevKey2=='k'&& player2.y>0 && player2.y<8)
      {
        println("p2 down");
        if (player2.checkItem(player2)==true) {
          player2.useItem(player2, 'k');
          //The problem is that the code returns false if none of the conditions are met, so we have to somehow allow the players to hold the items after they picked them up
        } else {
          map.breakBlock2();
          map.colorBlock((player2.x)*80, (player2.y+1)*80, player2.level);
        }
      } //CHECK THE REST PREV KEYS
      if (prevKey2=='j'&& player2.x>1 && player2.x<9)
      {
        println("p2 left");
        if (player2.checkItem(player2)==true) {
          player2.useItem(player2, 'j');
        } else {
          map.breakBlock2();
          map.colorBlock((player2.x-1)*80, player2.y*80, player2.level);
        }
      } //CHECK THE REST PREV KEYS
      if (prevKey2=='i'&& player2.y>1 && player2.y<9)
      {
        println("p2 up");
        if (player2.checkItem(player2)==true) {
          player2.useItem(player2, 'i');
        }
        //add a boolean here to see if the player is holding the item.
        else {
          map.breakBlock2();
          map.colorBlock((player2.x)*80, (player2.y-1)*80, player2.level);
        }
      } //CHECK THE REST PREV KEYS
    }
    gameOver();//CHECK IF ANYONE WON, IF YES THEN GAME OVER
    map.testMethod();//Method to test in case we need it --> enter the test cases
    map.playerOn();//checks if the player is standing on a broken block
   
  }
}
