Walker[] bob;
th ee;
int tx = 250;
int ty = 250;
void setup(){
  size(500,500);
  ee = new th();
  bob = new Walker[200];
  for(int i = 0; i < bob.length; i++){
    bob[i] = new Walker();
  }
}
void draw(){
  ee = new th();
  background(0);
  ee.show();
  for(int i = 0; i < bob.length; i++){
    bob[i].show();
    bob[i].walk();
  }
}

class Walker{
  int myX, myY, col;
  Walker(){
    myX = myY = 250;
    col = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  void walk(){
    int speed = 5;
    int change = (int)(speed/3);
    if(dist(tx, ty, myX, myY) < 100){
      speed *= 2;
    }
    if(tx < myX){
      myX = myX + (int)(Math.random()*speed)-change;
    }else{
      myX = myX - (int)(Math.random()*speed)+change;
    }
    if(ty < myY){
      myY = myY + (int)(Math.random()*speed)-change;
    }else{
      myY = myY - (int)(Math.random()*speed)+change;
    }
    if(myX >= 500 || myX <= 0 || myY >= 500 || myY <= 0){
      myX = 250;
      myY = 250;
    }
  }
  void show(){
    ellipse(myX, myY, 15, 15);
    fill(col);
  }
}

class th{
  int myX, myY;
  th(){
    myX = tx;
    myY = ty;
  }
  void show(){
    fill(#ffffff);
    rect(myX-15, myY-15, 30, 30);
  }
}

void mousePressed(){
  tx = mouseX;
  ty = mouseY;
  redraw();
}
