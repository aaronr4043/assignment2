class HighScores
{
  String name;
  float highscore;
  
  HighScores(String lines)
  {
    String[] parts = lines.split(",");
    name = parts[0];
    highscore = parseInt(parts[2]);
  }
}
    