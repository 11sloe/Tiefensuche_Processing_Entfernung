public class Graph
{ 
  int maxAnzahl;
  int anzahl = 0;
  Knoten[] knotenliste;
  int[][] matrix;


  public Graph(int kAnzahl)
  {
    maxAnzahl = kAnzahl;
    knotenliste = new Knoten[maxAnzahl];
    matrix = new int[maxAnzahl][maxAnzahl];
    for (int i = 0; i < maxAnzahl; i++)
    {
      for (int j = 0; j < maxAnzahl; j++)
      {
        matrix[i][j] = -1;
      }
    }
  }
  
  public void tiefensucheStart(String ort)
  {
    println("Start bei Knoten " + ort);
    for (int i = 0; i < anzahl; i++)
    {
      knotenliste[i].setBesucht(false);
    }
    int startKnoten = knotennummerGeben(ort);
    knotenBearbeiten(startKnoten);
    println();
    println("Ende");
  }
  
  public void knotenBearbeiten(int nummer)
  {
    print(knotenliste[nummer].getInhalt() + " | ");
    knotenliste[nummer].setBesucht(true);
    knotenZeichnen(nummer);
    for (int i = 0; i < anzahl; i++)
    {
      if(matrix[nummer][i]!= -1 && matrix[nummer][i] < 100 && knotenliste[i].getBesucht()==false)
      {
        knotenBearbeiten(i);
      }
    }
  }
  
  
  public void knotenEinfuegen(String inhalt, float x, float y)
  {
    if (anzahl < maxAnzahl)
    {
      Knoten k = new Knoten(inhalt, x, y);
      knotenliste[anzahl] = k;
      anzahl++;
    } else
    {
      System.out.println("Maximale Knotenzahl erreicht!");
    }
  }

  public int knotennummerGeben(String inhalt)
  {
    for (int i = 0; i < anzahl; i++)
    {
      if (knotenliste[i].getInhalt().equals(inhalt))
      {
        return i;
      }
    }
    return -1;
  }


  public void kanteEinfuegen(String a, String b, int wert)
  {
    int knoten1 = knotennummerGeben(a);
    int knoten2 = knotennummerGeben(b);
    if ((knoten1 != -1) && (knoten2 != -1))
    {
      matrix[knoten1][knoten2] = wert;
      matrix[knoten2][knoten1] = wert;
    }
    else
    {
      println("Diese Kante kann nicht eingefügt werden");
    }
  }

  // **** Alles zum Zeichnen des Graphen ********
  public void zeichnen()
  {
    kantenZeichnen();
    alleKnotenZeichnen();
  }

  private void alleKnotenZeichnen()
  {
    ellipseMode(CENTER);
    for (int i = 0; i < anzahl; i++)
    {
       knotenZeichnen(i);
    }
  }
  
  private void knotenZeichnen(int nummer)
  {
      float x = knotenliste[nummer].getX();
      float y = knotenliste[nummer].getY();
      color farbe = knotenliste[nummer].getFarbe();
      String inhalt = knotenliste[nummer].getInhalt();
      float radius = 30;
      fill(255);
      stroke(farbe);
      strokeWeight(5);
      ellipse(x, y, 2*radius, 2*radius);
      fill(0);
      textSize(20);
      textAlign(CENTER, CENTER);
      text(inhalt, x, y);
  }

  private void kantenZeichnen()
  {
    for (int i = 0; i < anzahl; i++)
    {
      for (int j = 0; j < anzahl; j++)
      {
        if (matrix[i][j]!= -1)
        {
          float x1 = knotenliste[i].getX();
          float y1 = knotenliste[i].getY();
          float x2 = knotenliste[j].getX();
          float y2 = knotenliste[j].getY();
          stroke(0);
          line(x1, y1, x2, y2);
        }
      }
    }
  }
  
  public void mousePressed()
  {
    for (int i = 0; i < anzahl; i++)
    {
      knotenliste[i].setFarbe(color(0,0,255));
    }
    
    for (int i = 0; i < anzahl; i++)
    {
      
      if (dist(mouseX,mouseY,knotenliste[i].getX(),knotenliste[i].getY())<30)
      {
        knotenliste[i].setFarbe(color(255,0,0)); 
        tiefensucheStart(knotenliste[i].getInhalt());
      }
    }
  }
}
