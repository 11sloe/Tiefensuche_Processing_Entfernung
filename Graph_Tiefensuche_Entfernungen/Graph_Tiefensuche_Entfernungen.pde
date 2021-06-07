Graph g;

void setup()
{
  size(600,600);
  g = new Graph(6);
  
  // Knoten einfuegen
  g.knotenEinfuegen("A", 150, 350);
  g.knotenEinfuegen("DAH", 250, 400);
  g.knotenEinfuegen("IN", 300, 300);
  g.knotenEinfuegen("M", 300, 500);
  g.knotenEinfuegen("N", 300, 100);
  g.knotenEinfuegen("R", 450, 250);
  
  // Kanten einfuegen
  g.kanteEinfuegen("A", "DAH", 48);
  g.kanteEinfuegen("A", "R", 130);
  g.kanteEinfuegen("DAH", "IN", 63);
  g.kanteEinfuegen("DAH", "M", 18);
  g.kanteEinfuegen("IN", "M", 75);
  g.kanteEinfuegen("IN", "N", 95);
  g.kanteEinfuegen("N", "R", 99);
}

void draw()
{
   background(200);
   g.zeichnen();
}

void mousePressed()
{
  // Falls die Maus über einem Knoten steht, 
  // wird der Tiefensuchealgorithmus mit diesem 
  // Knoten als Startknoten ausgeführt
  g.mousePressed();
}
