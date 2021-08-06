import processing.sound.*;

final int h_side = 500;
final int v_side = 500;

final int dx_Limp = 2;
final float dy_Retro = 0.15;
final float dx_Haste = 0.15;
final float dy_Haste = 0.3;

int switch_Farol = 0;
int switch_PiscaEsq = 0;
int switch_PiscaDir = 0;
int switch_Alerta = 0;
int switch_Retrovisor = 0;
int switch_Limpador = 0;

int temp_PiscaEsq = 0;
int temp_PiscaDir = 0;
int temp_Alerta = 0;

int direcaoEsq = 0;
int direcaoDir = 0;

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

SoundFile motor;

void setup(){
  size(500, 500);
  frameRate(60);
  motor = new SoundFile(this, "MotorSound.mp3");
}

void keyTyped(){
  if(key == 'F' || key == 'f'){
    if(switch_Farol == 1) switch_Farol = 0;
    else switch_Farol = 1;
  }
  
  if(key == 'R' || key == 'r'){
    if(switch_Retrovisor == 1) switch_Retrovisor = 0;
    else switch_Retrovisor = 1;
  }
  
  if(key == 'L' || key == 'l'){
    if(switch_Limpador == 1) switch_Limpador = 0;
    else switch_Limpador = 1;
  }
  
  if(key == '4'){
    temp_PiscaEsq = millis();
    if(switch_PiscaEsq == 1){ 
      switch_PiscaEsq = 0;
    }
    else{ 
      switch_PiscaDir = 0;
      switch_Alerta = 0;
      switch_PiscaEsq = 1;
    }  
  }
  
  if(key == '6'){
    temp_PiscaDir = millis();
    if(switch_PiscaDir == 1){
      switch_PiscaDir = 0;
    }
    else{
      switch_PiscaEsq = 0;
      switch_Alerta = 0;
      switch_PiscaDir = 1;
    }  
  }
  
  if(key == 'a' || key == 'A'){
    temp_Alerta = millis();
    if(switch_Alerta == 1){
      switch_Alerta = 0;
    }
    else{
      switch_PiscaDir = 0;
      switch_PiscaEsq = 0;
      switch_Alerta = 1;
    }  
  }
  
  if(key == 'm' || key == 'M'){
    motor.play();
  }
}

Limpador limpaEsq = new Limpador(240);
Limpador limpaDir = new Limpador(240);
Retrovisor retro = new Retrovisor(0);
Haste haste = new Haste(0, 0);

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
  if(switch_Limpador == 0 && limpaEsq.getLimpX() == 240) linhaSupEsq.display();
  translate(115,85);
  LinhaReflexo linhaInfEsq = new LinhaReflexo();
  if(switch_Limpador == 0 && limpaEsq.getLimpX() == 240) linhaInfEsq.display();
  popMatrix();
  
  //Linhas de reflexo janela da direita
  pushMatrix();
  translate(160,0);
  LinhaReflexo linhaSupDir = new LinhaReflexo();
  if(switch_Limpador == 0 && limpaEsq.getLimpX() == 240) linhaSupDir.display();
  translate(115,85);
  LinhaReflexo linhaInfDir = new LinhaReflexo();
  if(switch_Limpador == 0 && limpaEsq.getLimpX() == 240) linhaInfDir.display();
  popMatrix();
  
//--------------------------------------------------------

//Retrovisores
//--------------------------------------------------------
  //Espelhos
  pushMatrix();
  stroke(black);
  fill(gray);
  if(switch_Retrovisor == 1){
    if(retro.getRetroY() <= 10)
       retro.move(1);
  }
  else{
    if(retro.getRetroY() > 0)
       retro.move(2);
  }
  retro.display();
  
  translate(2*wid_lataria, 0);
  if(switch_Retrovisor == 1){
    if(retro.getRetroY() <= 10)
       retro.move(1);
  }
  else{
    if(retro.getRetroY() > 0)
       retro.move(2);
  }
  retro.display();
  popMatrix();
  
  if(switch_Retrovisor == 1){
    if(retro.getRetroY() <= 10)
       haste.move(1);
    }
  else{
    if(retro.getRetroY() > 0)
       haste.move(2);
  }
  haste.display();
//--------------------------------------------------------

//Limpadores de Parabrisa
//--------------------------------------------------------
  pushMatrix();
  stroke(black);
  fill(gray);
  
  if(switch_Limpador == 1){
    if(limpaEsq.getLimpX() <= 240 && limpaEsq.getLimpX() >= 104 && direcaoEsq == 0){
       limpaEsq.move(2);
       if(limpaEsq.getLimpX() == 104) direcaoEsq = 1;
    }
    else{
      limpaEsq.move(1);
      if(limpaEsq.getLimpX() == 240) direcaoEsq = 0;
    }
  }
  else if (switch_Limpador == 0 && limpaEsq.getLimpX() != 240){
    if(limpaEsq.getLimpX() <= 240 && limpaEsq.getLimpX() >= 104 && direcaoEsq == 0){
       limpaEsq.move(2);
       if(limpaEsq.getLimpX() == 104) direcaoEsq = 1;
    }
    else{
      limpaEsq.move(1);
    }
  }
  else direcaoEsq = 0;
  limpaEsq.display();
  
  stroke(black);
  translate(wid_janela+10, 0);
  if(switch_Limpador == 1){
    if(limpaDir.getLimpX() <= 240 && limpaDir.getLimpX() >= 104 && direcaoDir == 0){
       limpaDir.move(2);
       if(limpaDir.getLimpX() == 104) direcaoDir = 1;
    }
    else{
      limpaDir.move(1);
      if(limpaDir.getLimpX() == 240) direcaoDir = 0;
    }
  }
  limpaEsq.display();
  popMatrix();
//--------------------------------------------------------

//Farois frontais
//--------------------------------------------------------
  //Pisca esquerdo
  pushMatrix();
  translate(110, 225);
  Pisca piscaEsq = new Pisca();
  if(switch_PiscaEsq == 1) piscaEsq.piscar(1, millis(), 1);
  if(switch_Alerta == 1) piscaEsq.piscar(1, millis(), 3);
  piscaEsq.display();
  
  //Pisca direito
  translate(280, 0);
  Pisca piscaDir = new Pisca();
  if(switch_PiscaDir == 1) piscaDir.piscar(1, millis(), 2);
  if(switch_Alerta == 1) piscaDir.piscar(1, millis(), 4);
  piscaDir.display();
  popMatrix();
  
  //Farol esquerdo
  pushMatrix();
  translate(140, 300);
  Farol farolEsq = new Farol();
  if(switch_Farol == 1) farolEsq.ligar();
  farolEsq.display();

  //Farol direito
  translate(220, 0);
  Farol farolDir = new Farol();
  if(switch_Farol == 1) farolDir.ligar();
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
  float amplitude;
  if(mouseX <= 100)
    amplitude = map(mouseX, 0, 100, 0.4, 0.2);
  else if(mouseX >= 400)
    amplitude = map(mouseX, 400, width, 0.2, 0.4);
  else
    amplitude = 0.2;
  motor.amp(amplitude);
}

class Haste{
  float x, y;
  
  Haste(float new_x, float new_y){
    x = new_x;
    y = new_y;
  }
  
  void move(int escolha){
    if(escolha == 1){
      x += dx_Haste;
      y += dy_Haste;
    }
    else{
      x -= dx_Haste;
      y -= dy_Haste;
    }
  }
  
  void display(){
    quad(45-x, 130+y, 55-x, 130+y, 90, 160, 80, 160);
    quad(445+x, 130+y, 455+x, 130+y, 420, 160, 410, 160);
    
    stroke(gray);
    line(44, 130+y, 56-x, 130+y);
    line(445+x, 130+y, 456, 130+y);
  } 
  
}

class Retrovisor{
  float y;
  
  Retrovisor(float new_y){
    y = new_y;
  }
  
  float getRetroY(){
    return y;
  }
  
  void move(int escolha){
    if(escolha == 1){
      y += dy_Retro;
    }
    else{
      y -= dy_Retro;
    }
  }
  
  void display(){
    stroke(black);
    ellipse(50, 130+y, wid_retrovisor-y, wid_retrovisor);
  } 
}

class Limpador{
  int x;
  
  Limpador(int new_x){
    x = new_x;
  }
  
  int getLimpX(){
    return x;
  }
  
  void move(int escolha){
    if(escolha == 1){
      x += dx_Limp;
    }
    else{
      x -= dx_Limp;
    }
  }
  
  void display(){
    ellipse(x, 110, wid_limpador, heig_limpador);
    quad(x-2, 116, x, 110, 170, 170, 175, 170);
    stroke(gray);
    line(170, 170, 175, 170);
  } 
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
  
  void piscar(int resp, int temp, int escolha){
    if (resp == 1){ 
      if(escolha == 1 && (temp - temp_PiscaEsq)%1000 <= 500){ 
        cor = light_orange;
      }
      if(escolha == 2 && (temp - temp_PiscaEsq)%1000 <= 500){ 
        cor = light_orange;
      }
      if(escolha == 3 && (temp - temp_Alerta)%1000 <= 500){ 
        cor = light_orange;
      }
      if(escolha == 4 && (temp - temp_Alerta)%1000 <= 500){ 
        cor = light_orange;
      }
    }
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
  
  void desligar(){
    corCircMaior = black;
    corCircMenor =  gray;
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
