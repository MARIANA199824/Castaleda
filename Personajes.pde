class personajes
{
  String nombre;
  int display;
  
  personajes (String nombre_, int display_)
  {
    nombre = nombre_;
    display = display_;
  }
  
  void displayUno()
  {
    switch (display)
    {
      //fantasma
      case 1:
      pushMatrix();
      translate (200,360);
      scale (0.40,0.40);
      image (fan,0,0);
      popMatrix();
      break;
      
      //computadora
      case 2:
      pushMatrix();
      translate (200,340);
      scale (0.50,0.50);
      image (com,0,0);
      popMatrix();
      break;
      
      //qbert
      case 3:
      pushMatrix();
      translate (220,370);
      scale (0.65,0.65);
      image (qbe,0,0);
      popMatrix();
      break;
      
      //fantasma
      case 4:
      pushMatrix();
      translate (700,360);
      scale (0.40,0.40);
      image (fan,0,0);
      popMatrix();
      break;
      
      //computadora
      case 5:
      pushMatrix();
      translate (680,345);
      scale (0.50,0.50);
      image (com,0,0);
      popMatrix();
      break;
      
      //qbert
      case 6:
      pushMatrix();
      translate (700,360);
      scale (0.65,0.65);
      image (qbe,0,0);
      popMatrix();
      break;
    }
    
  }
  
}