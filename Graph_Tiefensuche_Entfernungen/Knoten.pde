class Knoten
{
  private String inhalt;
  private float x;
  private float y;
  private color farbe;
  private boolean besucht;
  
  public Knoten(String inhalt_, float x_, float y_)
  {
    inhalt = inhalt_;
    x = x_;
    y = y_;
    farbe = color(0,0,255);
    besucht = false;
  }
  
 
  public String getInhalt()
  {
    return inhalt;
  }
  
  float getX()
  {
    return x;
  }
  
  float getY()
  {
    return y;
  }
  
  int getFarbe()
  {
    return farbe;
  }
  
  void setFarbe(int farbe_)
  {
    farbe = farbe_;
  }
  
  void setBesucht(boolean wert)
  {
    besucht = wert;
    if (wert)
    {
      farbe = color(255,255,0);
    }
    else
    {
      farbe = color(0,0,255);
    }
  }
  
  boolean getBesucht()
  {
    return besucht;
  }
}
