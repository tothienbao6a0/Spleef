void winner(int player)//check if the player is a winner
{
  if (player==1)
  {
    background(255);
    text("Player 1 Wins", 400, 400);
    text("Press Space to Play Again", 400, 450);
    textAlign(CENTER);
    p1score++;
    gameOn=false;
  }

  else if (player==2)
  {
    background(255);
    text("Player 2 Wins", 400,400);
    text("Press Space to Play Again", 400, 450);
    textAlign(CENTER);
    p2score++;
    gameOn=false;//turns off the game --> stop
  }
}


void gameOver()//check which player is the winner
{
  if (player1.level==0)
  {
    winner(2);
  }
  else if (player2.level==0)
  {
    winner(1);
  }
}

void scoreBoard()
{
  text("Player 1: "+p1score, 950,450);
  text("Player 2: "+p2score,1250,450);//shows the scores on the score board
}
