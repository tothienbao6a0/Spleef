class Snowball{
  PImage imgsnowball;
  int snowball;
  int x,y;
  int xcoor,ycoor;
  boolean red;
  int player;
  int level;
  Snowball(int playNum, int x, int y, int platform)
  {
    player=playNum;
    level=platform;
    xcoor = (x*80)-40;
    ycoor = (y*80)-40;
    imgsnowball = loadImage("snowball.jpg.jpeg");
  }
   void display()//displays the item in the game
   {
     fill(255);
     //circle(xcoor,ycoor,10);
     image(imgsnowball,xcoor-20,ycoor-20,40,40);//displays snowball on the grid
   }
   void getRandom(){//gets a random value for the coords of the snowball so that it can respawn in a different location every 30 turns
      xcoor = int(random(1,10))*80-40;
      ycoor = int(random(1,10))*80-40;
   }
}
