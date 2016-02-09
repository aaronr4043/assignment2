class HighScores
{
  String name;
  int highscore;
  
  HighScores(String lines)
  {
    String[] parts = lines.split(",");
    name = parts[0];
    highscore = Integer.parseInt(parts[1]);
  }
}
    