class Player {
  int player;
  int x, y;
  int level;
  int itemName;
  PImage Player1;
  PImage Player2; 
  Player(int plnum, int xcoor, int ycoor, int platform, int item)  // stores player num, spawn x coordinate and y coordinate
  {
    player = plnum;
    x = xcoor;
    y = ycoor;
    level=platform;
    itemName=item;
    Player1=loadImage("steve.jpg.jpeg");//loads in character images
    Player2=loadImage("alex.png");
  }

  void display()
  {
    image(Player1,900,300,100,100);
    image(Player2,1200,300,100,100);
    if (level==2)
    {
      stroke(0);
      fill(255, 0, 0);
      circle((x+1)*80-40, (y+1)*80-40, 50);
    } else if (level==1)
    {
      stroke(0);
      fill(0, 0, 255);
      circle((x+1)*80-40, (y+1)*80-40, 50);
    }
  }
  
  public boolean haveItem=false;
  public boolean toggleItemOn(Player player){
    if (player.itemName==0||player.itemName==1)return true;
    else return false;
  }
  
  public void testItem(Player player){
    if(haveItem==false){
      if ((player.x==snowball1.xcoor/80)&&(player.y==snowball1.ycoor/80))
    {
    println("have ball 1"); // fix this
    snowball1.xcoor=-25;//moves item out of the map --> disappears
    player.itemName=0;//0 is a ball
    haveItem=true;
 
    }
    if ((player.x==snowball2.xcoor/80)&&(player.y==snowball2.ycoor/80))
    {
    println("have ball2");
    snowball2.xcoor=-25;
    player.itemName=0;//0 is a ball
    haveItem=true;
    
  
    }
    if ((player.x==bow1.xcoor/80)&&(player.y==bow1.ycoor/80))
    {
    println("have bow 1");
    bow1.xcoor=-25;
    player.itemName=1;//1 is a bow
    haveItem=true;

    }
    }
  }
  public boolean checkItem(Player player){//checks if the player have the item or not by checking if they are standing on the same block as the item 
  // do a switch statement instead if have time
  if (haveItem==false)return false;
  else return true;
  }
  /*if (haveItem==false){
    if ((player.x==snowball1.xcoor/80)&&(player.y==snowball1.ycoor/80))
    {
    println("have ball 1"); // fix this
    snowball1.xcoor=-25;
    player.itemName=0;//0 is a ball
    haveItem=true;
    return true;
    }
    if ((player.x==snowball2.xcoor/80)&&(player.y==snowball2.ycoor/80))
    {
    println("have ball2");
    snowball2.xcoor=-25;
    player.itemName=0;//0 is a ball
    haveItem=true;
    return true;
  
    }
    if ((player.x==bow1.xcoor/80)&&(player.y==bow1.ycoor/80))
    {
    println("have bow 1");
    bow1.xcoor=-25;
    player.itemName=1;//1 is a bow
    haveItem=true;
    return true;
    }
    else return false;
  }
    
    else return false;
  }*/
  
  int itemUsed(){
    int a=2; 
    return a;
  }
  
  void useItem(Player player, char direction){
  {
        if (player.itemName==1) 
        {
          if (player==player1)
          map.useBowPlayer1();
          if (player==player2)
          map.useBowPlayer2();
          player.itemName=player.itemUsed();
          haveItem=false;
        }
        if (player.itemName==0) 
        {
          if (player==player1)
          map.useSnowBallP1();
          if (player==player2)
          map.useSnowBallP2();
          player.itemName=player.itemUsed();
          haveItem=false;
          
        }
        switch(direction){
          case 'd':
          map.colorBlock((player.x+2)*80, (player.y)*80, 1);//this is 1 BECAUSE THIS IS FIXED FOR USING ITEM NOT BARE HANDS
          break;
          case 'a':
          map.colorBlock((player.x-2)*80, (player.y)*80, 1);
          break;
          case 's':
          map.colorBlock((player.x)*80, (player.y+2)*80, 1);
          break;
          case 'w':
          map.colorBlock((player.x)*80, (player.y-2)*80, 1);
          break;
          case 'j':
          map.colorBlock((player.x-2)*80, (player.y)*80, 1);
          break;
          case 'k':
          map.colorBlock((player.x)*80, (player.y+2)*80, 1);
          break;
          case 'l':
          map.colorBlock((player.x+2)*80, (player.y)*80, 1);
          break;
          case 'i':
          map.colorBlock((player.x)*80, (player.y-2)*80, 1);
          break;
                   
        }
        if(direction=='d')
        map.colorBlock((player.x+2)*80, (player.y)*80, 1);
        if(direction=='s')
        map.colorBlock((player.x)*80, (player.y+2)*80, 1);
        if(direction=='a')
        map.colorBlock((player.x-2)*80, (player.y)*80, 1);
        if(direction=='w')
        map.colorBlock((player.x)*80, (player.y-2)*80, 1);
      }

}
  
  
}
