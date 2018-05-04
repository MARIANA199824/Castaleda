import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;


PImage fondo, fondo1, fondo2, hoyo, siguiente, empezar, seleccion, combate, nave, fan, com, qbe, ganador, nave2, bur, volver;
int value=0,value1=0, value2=0, value3=0, value4=0, value5=0, t=0, c=1, dibujo=0;
float v1, v2, a1, a2;
int j1, j2;
float i;
PFont font1;


NaveUno una;
NaveDos dos;

personajes fantasma,qbert,compu,fantasma2,qbert2,compu2;

Box2DProcessing box2d;

ArrayList <NaveUno> extra;
ArrayList <NaveDos> espa;

void setup()
{
size (900,600);

fondo = loadImage ("fondo.jpg");
fondo1 = loadImage ("pantallaUno.png");
siguiente = loadImage ("siguiente.png");
empezar = loadImage ("empezar.png");
seleccion = loadImage ("pantallaSeleccion.jpg");
combate = loadImage ("pantallaCombate.jpg");
nave = loadImage ("nave.png");
ganador = loadImage ("fondoGanador.jpg");
nave2 = loadImage ("nave2.png");
fan = loadImage ("fantasma.png");
com = loadImage ("zombie.png");
qbe = loadImage ("qbert.png");
bur = loadImage ("burbuja.png");
volver = loadImage ("volver.png");

fantasma = new personajes ("Ghost",1);
compu = new personajes ("Compu",2);
qbert = new personajes ("Qbert",3);
fantasma2 = new personajes ("Ghost",4);
compu2 = new personajes ("Compu",5);
qbert2 = new personajes ("Qbert",6);

 box2d = new Box2DProcessing(this);
 box2d.createWorld();
 box2d.setGravity(0,-10);
 
 espa = new ArrayList <NaveDos>();
 extra = new ArrayList <NaveUno>();
 
 
 for (int i=0; i<5; i++)
{
  extra.add (new NaveUno (random(400),random(400),random(5),random(10)));
}

if (random(1)<0.1)
{
  NaveDos p = new NaveDos (random(70,175),0,3,3);
  espa.add(p);
}

for (NaveDos a:espa)
{
  a.display();
}
for (int a=0; a<5; a++)
{
  espa.add (new NaveDos (random(400),random(400),random(5),random(10)));
}
  
}

void draw()
{
  box2d.step();
  
  fantasma.displayUno();
  qbert.displayUno();
  compu.displayUno();
  fantasma2.displayUno();
  qbert2.displayUno();
  compu2.displayUno();
  
  
  if (value==0)
  {
     pantallaUno();
  }
  
  if (mousePressed && (mouseX>=445) && (mouseX<=445+50) && (mouseY>=475) && (mouseY<=475+80))
  {
    value=1;
  }
  
  if (value==1)
  {
  pushMatrix();
  scale (2,2);
  image (fondo,0,0,width,height);
  popMatrix();
  pantallaDos();
  value1=1;
  }
  
  if (value1==1)
  {
  textoDos();
  }
  
  if (mousePressed && (mouseX>=410) && (mouseX<=410+70) && (mouseY>=390) && (mouseY<=390+70))
  {
    value2=1;
  }
  
  if (value2==1)
  {
    pantallaDos();
    textoTres();
  }
  
  if (keyPressed && (key=='Z' || key=='z'))
  {
    value3=1;
  }
  
  if (value3==1)
  {
  pushMatrix();
  scale (1,1);
  image (seleccion,450,300,width,height);
  popMatrix();
  }
  
  keyPressed();
  
  if ((j1!=0) && (j2!=0))
  {
    value4=1;
    println (value);
  }
  
  if (value4==1)
  {
  c=2;
  combate();
  if (v1<=0 || v2<=0)
      {
        value5=1;
      }
      
    if (value5==1)
    {
        if (v1>v2) {dibujo=j1; }
        else if (v2>v1) { dibujo=j2;}
        
       
       ganador();
       
       
       if (mousePressed && (mouseX>250) && (mouseX<250+90) && (mouseY>200) && (mouseY<200+50))
     {
       pantallaUno();
       value=0;
       value1=0;
       value2=0;
       value3=0;
       value4=0;
       value5=0;
       j1=0;
       j2=0;
     }
    }
  }
 
}


void pantallaUno()
{
  fill (random(255),random(255),random(255));
 
  rect (0,0,width,height);
  pushMatrix();
  imageMode(CENTER);
  translate (450,300);
  image (fondo1,0,0,width,height);
  popMatrix();
  
}

void pantallaDos()
{
  pushMatrix();
  imageMode(CENTER);
  hoyo = loadImage ("negro.png");
  translate(width/2, height/2);
  rotate(-i/2);
  image (hoyo,0,0, 700, 700);
  i = i + 0.01;
  popMatrix();
}

void textoDos()
{
  fill (255);
  font1 = loadFont ("bank.vlw");
  textFont (font1);
  text ("35 years ago the students waited",270,240);
  text ("the end of the school day ",310,255);
  text ("to run to the famous arcade",300,270);
  text ("and change their money for a lot",280,285);
  text ("of pac-man or space invader games. ",270,300);
  text ("But just when these machines",310,315);
  text ("arrive to their best moment,",310,330);
  text ("the smaller consoles was appear.",270,345);
  
  pushMatrix();
  scale (0.5,0.5);
  image (siguiente,900,850);
  popMatrix();
}

void textoTres()
{
  text ("INSTRUCTIONS",365,210);
  println ("5");
  
  text ("Click on the key that corresponds",270,240);
  text ("to you to launch an attack on your",310,255);
  text ("opponent (random value of 1-8)",300,270);
  text ("Rememeber that the attacks are in",280,285);
  text ("turn. The first player to end the",270,300);
  text ("life of the opponent will win.",310,315);
  text ("               ¡GOOD LUCK!             ",270,345);
  
  pushMatrix();
  scale (0.5,0.5);
  image (empezar,900,850);
  popMatrix();
}

void keyPressed()
{
  
  if (c==1)
  {
  
  switch (key)
  {
    //JUGADOR 1
    case 'A':
    j1=1;
    v1=15;
    a1= random (1,8);
    println ("j1");
    break;
    case 'B':
    j1=2;
    v1=15;
    a1= random (1,8);
    println ("j1");
    break;
    case 'C':
    j1=3;
    v1=15;
    a1= random (1,8);
    println ("j1");
    break;
    
    //JUGADOR 2
    case 'D':
    j2=4;
    v2=15;
    a2= random (1,8);
    println ("j2");
    break;
    case 'E':
    j2=5;
    v2=15;
    a2= random (1,8);
    println ("j2");
    break;
    case 'F':
    j2=6;
    v2=15;
    a2= random (1,8);
    println ("j2");
    break;
  }
  }

 if (t==0 && value4==1)
   {
     if (key=='b' || key=='B')
     {
       v2=v2-(a1*0.3);
       println (v2);
       t=1;
     }
   }
     
     if (t==1 && value4==1)
     {
       if (key=='n' || key=='N')
     {
       v1=v1-(a2*0.27);
       println (v1);
       t=0;
     }
     }
  
}

void combate()
{
  pushMatrix();
  scale (1,1);
  image (combate,450,300,width,height);
  popMatrix();
  
  noStroke();
  fill (random(255),random(255),random(255));
  rect (125,85,150,70);
  rect (625,85,150,70);
  fill (0);
  rect (130,90,140,60);
  rect (630,90,140,60);
  fill (255);
  text ("PLAYER 1: b ||B",100,175);
  text ("PLAYER 2: n || N",590,175);
  
  switch (j1)
  {
    case 1:
    fantasma.displayUno();
    break;
    case 2:
    compu.displayUno();
    break;
    case 3:
    qbert.displayUno();
    break;
  }
  
  switch (j2)
  {
    case 4:
    fantasma2.displayUno();
    break;
    case 5:
    compu2.displayUno();
    break;
    case 6:
    qbert2.displayUno();
    break;
  }
  fill (255);
  text (v1,160,125);
  text (v2,660,125);
  
  for (NaveUno p: extra)
  {
    p.display();
    p.movimiento();
    p.rebota();
  }
  
  for (NaveDos d: espa)
  {
    d.display();
    d.movimiento();
    d.rebota();
  }
   
}

void ganador()
{
  pushMatrix();
  image (ganador,435,300,width, height);
  popMatrix();
  switch (dibujo)
  {
    case 1:
    pushMatrix();
    translate (470,360);
    scale (0.7,0.7);
    image (fan,0,0);
    popMatrix();
    break;
    
    case 2:
    pushMatrix();
    translate (470,420);
    scale (0.9,0.9);
    image (com,0,0);
    popMatrix();
    break;
    
    case 3:
    pushMatrix();
    translate (470,370);
    scale (1.5,1.5);
    image (qbe,0,0);
    popMatrix();
    break;
    
    case 4:
    pushMatrix();
    translate (470,360);
    scale (0.7,0.7);
    image (fan,0,0);
    popMatrix();
    break;
    
    case 5:
    pushMatrix();
    translate (470,420);
    scale (0.9,0.9);
    image (com,0,0);
    popMatrix();
    break;
    
    case 6:
    pushMatrix();
    translate (470,370);
    scale (1.5,1.5);
    image (qbe,0,0);
    popMatrix();
    break;
  }
  
    pushMatrix();
    translate (490,160);
    scale (0.6,0.6);
    image (bur,0,0);
    popMatrix();
    
    pushMatrix();
    translate (50,500);
    scale (0.2,0.2);
    image (volver,0,0);
    popMatrix();
    
     if (mousePressed && (mouseX>=20) && (mouseX<=20+60) && (mouseY>=470) && (mouseY<=470+60))
  {
    pantallaUno();
    value=0;
    value1=0;
    value2=0;
    value3=0;
    value4=0;
    value5=0;
    j1=0;
    j2=0;
    t=0;
    c=1;
    dibujo=0;
   

  }
   
  }