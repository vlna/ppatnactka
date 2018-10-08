int[] win ={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0};
int[] desk;

void setup() {
  background(192);
  size(600,600);
  stroke(64);
  fill(192);
  rect(95,95,410,410,20);
  desk=win;
  shuffle();
}

void draw() {
   for (int i=0;i<desk.length;i++) {
     drawStone(100+100*(i%4),100+100*(i/4),str(desk[i]));
   }  
}

void shuffle() {
  for (int i=0;i<100 || !isSolvable();i++) {
    int p1 = int(random(0,16));
    int p2 = int(random(0,16));
    int temp = desk[p1];
    desk[p1] = desk[p2];
    desk[p2] = temp;
  }
}

void drawStone(int x, int y, String value) {
  if(!value.equals("0")) {
    stroke(0);
    fill(255);
    rect(x+2,y+2,96,96,20);
    fill(50);
    textSize(48);
    textAlign(CENTER,CENTER);
    text(value,x+50,y+44);
  } else {
    stroke(192);
    fill(192);
    rect(x,y,100,100);
  }
}

void keyPressed() {
  int e=empty();
  //println(keyCode);
  switch (keyCode) {
    //left
    case 37:
      if (e%4!=3) {
        desk[e] = desk[e+1];
        desk[e+1] = 0;
      }
      break;
    //right
    case 39:
      if (e%4!=0) {
        desk[e] = desk[e-1];
        desk[e-1] = 0;
      }
      break;
    //up
    case 38:
      if (e/4!=3) {
        desk[e] = desk[e+4];
        desk[e+4] = 0;
      }
      break;
    //down
    case 40:
      if (e/4!=0) {
        desk[e] = desk[e-4];
        desk[e-4] = 0;
      }
      break;
  }
  //println(isSolvable());
}

int empty() {
  int result = -1;
  for (int i=0;i<desk.length;i++) {
     if (desk[i]==0) {
       result = i;
     }
  }
  return result;
}

boolean isSolvable(){
  int inversions=0;
  int zero=0;
  for (int i = 0; i < desk.length;i++) {
    if (desk[i] == 0) {
      zero = i/4;
    } 
    for (int j = i + 1; j < desk.length; j++) {
            if (desk[i] > desk[j] && desk[j] != 0) {
                inversions++;
            }
        }
  }
  //println(zero);
  //println(inversions);
  if (zero % 2 == 0) {
    return !(inversions % 2 == 0);
  } else {
    return inversions % 2 == 0;
  }
}
