final int h_side = 500;
final int v_side = 500;

color white = color(255, 255, 255);
color almost_white = color(230, 230, 230);
color gray = color(150, 150, 150);
color black = color(0, 0, 0);
color glass_blue = color(148, 213, 251);
color dark_cyan = color(37, 189, 177);
color cyan = color(0, 253, 255);
color turquoise = color(52, 161, 173);
color beige = color(197, 158, 129);
color light_orange = color(255, 193, 0);
color orange = color(246, 99, 4);
color dark_orange = color(208, 81, 0);
color darkgray = color(71, 68, 75);

// Dimensoes da roda
int wid_roda = 50;
int heig_roda = 55;

//Dimensoes do para-choque
int wid_parachq = 380;
int heig_parachq = 30;

//Dimensoes da placa da kombi
int wid_placa = 86;
int heig_placa = 40;

//Dimensoes da lataria
int wid_lataria = 200;
int heig_lataria = 220;

//Dimensoes do topo
int wid_topo = 300;
int heig_topo = 20;

//Dimensoes barra topo
int wid_barra_topo = 310;
int heig_barra_topo = 9;

//Dimensoes Janela
int wid_janela = 145;
int heig_janela = 110;

//Dimensoes Retrovisor
int wid_retrovisor = 35;

//Dimensoes Limpador de Parabrisa
int wid_limpador = 3;
int heig_limpador = 80;

//Dimensoes dos farois pequenos e grandes
int d_farolP = 32;
int d_farolG = 72;

//Dimensoes das listras do farol pequeno
int heig_listra = 8;
int heig_listG = 3*heig_listra/2;

void setup(){
  size(500, 500);
  frameRate(60);
}

void draw(){
  background(255-(0.25*mouseX), 150, 150+(0.25*mouseY));

//Rodas
//--------------------------------------------------------
  //Roda esquerda
  pushMatrix();
  translate(80,410);
  Roda rodaEsq = new Roda();
  rodaEsq.display();
  
  //Roda direita
  translate(290, 0);
  Roda rodaDir = new Roda();
  rodaDir.display();
  popMatrix();
//--------------------------------------------------------

//Para-choque da kombi
//--------------------------------------------------------
  pushMatrix();
  translate(h_side-70, v_side-95);
  stroke(black);
  fill(gray);
  circle(0, 0, heig_parachq+10);
  popMatrix();
  
  pushMatrix();
  stroke(black);
  fill(gray);
  translate(60, v_side-105);
  circle(10, 10, heig_parachq+10);
  rect(0, 0, wid_parachq, heig_parachq, 10);
  
  noStroke();
  rect(0, 0, 10, 29, 10);
  rect(wid_parachq-10, 0, 11, 29, 10);
  
  stroke(black);
  fill(white, 200);
  rect(10, heig_parachq/2-7, 100, 14, 60);
  stroke(black, 200);
  fill(black, 200);
  rect(15, heig_parachq/2-3, 90, 6, 60);
  
  translate(wid_parachq/2+69, 0);
  stroke(black);
  fill(white, 200);
  rect(10, heig_parachq/2-7, 100, 14, 60);
  stroke(black, 200);
  fill(black, 200);
  rect(15, heig_parachq/2-3, 90, 6, 60);
  popMatrix();
//--------------------------------------------------------
  
//Parte de cima da lataria da kombi
//--------------------------------------------------------
  pushMatrix();
  stroke(black);
  fill(black);
  translate(60, v_side-105);
  rect(0, 0, wid_parachq, -heig_lataria);
//--------------------------------------------------------

//Frente da Kombi - Lataria
//--------------------------------------------------------
  stroke(black);
  fill(dark_cyan);
  arc(0, 0, 2*wid_lataria, 2*heig_lataria, TWO_PI-HALF_PI, TWO_PI);
  line(0, 0, 0, -heig_lataria);
  line(0, 0, wid_parachq, 0);
  
  translate(wid_parachq, 0);
  arc(0, 0, 2*wid_lataria, 2*heig_lataria, PI, TWO_PI-HALF_PI);
  line(0, 0, 0, -heig_lataria);
  
  noStroke();
  rect(-wid_lataria-5, -46, 10, 46);
  rect(-wid_lataria+5, -66, 10, 20);
  popMatrix();
//--------------------------------------------------------

//Topo da Kombi
//--------------------------------------------------------
  stroke(black);
  fill(black);
  ellipse(250, 45, wid_topo, heig_topo);
  quad(100, 45, 400, 45, 440, 175, 60, 175);
  
  fill(gray);
  rect(95, 45, wid_barra_topo, heig_barra_topo, 50);
//--------------------------------------------------------

//Janelas
//--------------------------------------------------------
  pushMatrix();
  //Janela 1
  stroke(gray);
  fill(glass_blue);
  rect(100, 60, wid_janela, heig_janela, 7);
  
  translate(155,0); 
  
  //Janela 2
  rect(100, 60, wid_janela, heig_janela, 7);
  popMatrix();
  
  //Linhas de reflexo janela da esquerda
  pushMatrix();
  LinhaReflexo linhaSupEsq = new LinhaReflexo();
  linhaSupEsq.display();
  translate(115,85);
  LinhaReflexo linhaInfEsq = new LinhaReflexo();
  linhaInfEsq.display();
  popMatrix();
  
  //Linhas de reflexo janela da direita
  pushMatrix();
  translate(160,0);
  LinhaReflexo linhaSupDir = new LinhaReflexo();
  linhaSupDir.display();
  translate(115,85);
  LinhaReflexo linhaInfDir = new LinhaReflexo();
  linhaInfDir.display();
  popMatrix();
  
//--------------------------------------------------------

//Retrovisores
//--------------------------------------------------------
  //Espelhos
  pushMatrix();
  stroke(black);
  fill(gray);
  if((keyPressed == true) && ((key == 'L') || (key == 'l'))){
      circle(60, 140, wid_retrovisor);
  }
  else circle(50, 130, wid_retrovisor);
  
  translate(2*wid_lataria, 0);
  if((keyPressed == true) && ((key == 'L') || (key == 'l'))){
      circle(40, 140, wid_retrovisor);
  }
  else circle(50, 130, wid_retrovisor);
  popMatrix();
  
  //Hastes
  quad(45, 130, 55, 130, 90, 160, 80, 160);
  quad(445, 130, 455, 130, 420, 160, 410, 160);
  
  stroke(gray);
  line(44, 130, 56, 130);
  line(445, 130, 456, 130);
//--------------------------------------------------------

//Limpadores de Parabrisa
//--------------------------------------------------------
  pushMatrix();
  stroke(black);
  fill(gray);
  ellipse(240, 110, wid_limpador, heig_limpador);
  translate(20,0);
  ellipse(240, 110, wid_limpador, heig_limpador);
  popMatrix();
  quad(238, 116, 240, 110, 190, 170, 195, 170);
  quad(258, 110, 260, 116, 305, 170, 310, 170);
  
  stroke(gray);
  line(190, 170, 195, 170);
  line(305, 170, 310, 170);
//--------------------------------------------------------

//Farois frontais
//--------------------------------------------------------
  //Pisca esquerdo
  pushMatrix();
  translate(110, 225);
  Pisca piscaEsq = new Pisca();
  if((keyPressed == true) && ((key == '4') || (key == 'a') || (key == 'A'))) piscaEsq.piscar(1);
  piscaEsq.display();
  
  //Pisca direito
  translate(280, 0);
  Pisca piscaDir = new Pisca();
  if((keyPressed == true) && ((key == '6') || (key == 'a') || (key == 'A'))) piscaDir.piscar(1);
  piscaDir.display();
  popMatrix();
  
  //Farois
  pushMatrix();
  translate(140, 300);
  Farol farolEsq = new Farol();
  if((keyPressed == true) && ((key == 'F') || (key == 'f'))) farolEsq.ligar();
  farolEsq.display();

  //Farol direito
  translate(220, 0);
  Farol farolDir = new Farol();
  if((keyPressed == true) && ((key == 'F') || (key == 'f')))farolDir.ligar();
  farolDir.display();
  popMatrix();
//--------------------------------------------------------

//Placa
//--------------------------------------------------------
  stroke(black, 150);
  fill(gray);
  pushMatrix();
  translate(h_side/2-50, v_side-104);
  rect(-120, -13, 10, 12);
  rect(210, -13, 10, 12);
  rect(-120, -21, 340, 10, 65);
  
  stroke(gray);
  rect(-119, -13, 9, 2);
  rect(210, -13, 9, 2);
  
  stroke(black, 150);
  rect(-21, -36, 18, heig_parachq+35, 60);
  translate(100, 0);
  rect(2, -36, 18, heig_parachq+35, 60);
  
  translate(-49, 0);
  stroke(black);
  fill(gray);
  rect(-wid_placa/2, -11, wid_placa-1, heig_placa);
  popMatrix();
//--------------------------------------------------------
  
  save("Kombi2D.png");
}

class Roda{  
    Roda(){
    }
    
    void display(){
      stroke(black);
      fill(black);
      rect(0, 0, wid_roda, heig_roda, 0, 0, 12, 12);
    }
  }
  
class LinhaReflexo{
    LinhaReflexo(){
    }
    
    void display(){
      line(110, 65, 105, 73);
      line(116, 63, 104, 82);
      line(120, 67, 113, 78);
    }
  }

class Pisca{
  color cor;
  
  Pisca(){
   cor = orange;
  }
  
  void piscar(int resp){
    if (resp == 1) cor = light_orange;
    else cor = orange;
  }
  
  void display(){
    stroke(black, 180);
    fill(white);
    circle(0, 0, d_farolP);
    
    stroke(dark_orange);
    strokeWeight(3.5);
    line(0, -heig_listG, 0, heig_listG);
    line(-heig_listra, -heig_listra, -heig_listra, heig_listra);
    line(heig_listra, -heig_listra, heig_listra, heig_listra);
    strokeWeight(1);
    
    stroke(black);
    fill(cor, 210);
    circle(0, 0, d_farolP-6);
  }
}

class Farol{
  color corCircMaior, corCircMenor;
  
  Farol(){
    corCircMaior = black;
    corCircMenor =  gray;
  }
  
  void ligar(){
    corCircMaior = almost_white;
    corCircMenor = white;
  }
  
  void display(){
    
    fill(white, 150);
    circle(14, -6, 13);
    
    stroke(black, 180);
    fill(white);
    circle(0, 0, d_farolG);
    
    stroke(black, 150);
    fill(corCircMaior, 150);
    circle(0, 0, d_farolG-8);
    
    stroke(corCircMenor);
    fill(corCircMenor);
    circle(0, 0, 27);
  }
}
