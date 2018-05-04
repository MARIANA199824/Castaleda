interface Nave
{
  void movimiento();
  void display();
  void rebota();
  
}

class NaveUno implements Nave
{
  float x,y,dx,dy;
  
  NaveUno(float x_, float y_, float dx_, float dy_)
  {
    x = x_;
    y = y_;
    dx = dx_;
    dy = dy_;
  }
  
  void movimiento()
  {
    x += dx;
    y += dy;
  }
  
  void display()
  {
    pushMatrix();
    translate (x,y);
    scale(0.3,0.3);
    image (nave,0,0);
    popMatrix();
  }
  
  void rebota()
  {
    if (x > width)
    {
      x = width;
      dx= dx* -1;
    }
    if (x<0){
      x = 0;
      dx= dx* -1;
    }
    if (y<0){
      y = 0;
      dy*= -1;
    }
    if (y>height){
      y = height;
      dy*= -1;
    }
  }  
}


class NaveDos implements Nave
{
  float x,y,dx,dy;
  
  NaveDos(float x_, float y_, float dx_, float dy_)
  {
    x = x_;
    y = y_;
    dx = dx_;
    dy = dy_;
    
    
  }
  
  void movimiento()
  {
    x += dx;
    y += dy;
  }
  
  void display()
  {
    pushMatrix();
    translate (x,y);
    scale(0.2,0.2);
    image (nave2,0,0);
    popMatrix();
  }
  
  void rebota()
  {
    if (x > width)
    {
      x = width;
      dx= dx* -1;
    }
    if (x<0){
      x = 0;
      dx= dx* -1;
    }
    if (y<0){
      y = 0;
      dy*= -1;
    }
    if (y>height){
      y = height;
      dy*= -1;
    }
  }  
}