class Bow{
  PImage imgbow;
  int bow;
  int level;
  int x,y;
  int xcoor,ycoor;
  Bow(int x, int y, int platform)//constructor
  {
    
    xcoor = (x*80)-40;
    ycoor = (y*80)-40;
    imgbow = loadImage("bow.png");
    level=platform;
  }
   void display()//displays the bow
   {
     stroke(0);
     fill(200,0,0);
     image(imgbow,xcoor-25,ycoor-25,50,50);
     //circle(xcoor,ycoor,25);
   }
   void bowOn()//in 
  {
    //passing the method an int and then return a boolean 
    //for example if there's a bow there, we change the value at that block to 2 or sth
  }
  void getRandom(){//gets a random value for the coords of the bow so that it can respawn in a different location every 30 turns
      xcoor = int(random(1,10))*80-40;
      ycoor = int(random(1,10))*80-40;
   }
}
