Walker fella;
Walker fella2;
Walker[] walkers;

void setup(){
  size(500,500);
  background(0);
  stroke(255);
  noFill();
  fella = new Walker(int(random(width)), int(random(height)));
  fella2 = new Walker(int(random(width)), int(random(height)));
}

void draw(){
  fella.walk();
  fella.display();
  fella2.walk();
  fella2.display();
}

class Walker{
  int xPos;
  int yPos;
  boolean[][] visited;
  Walker(int x, int y){
    xPos= x;
    yPos = y;
    visited = new boolean[width + 1][height +1];
  }
  void walk(){
    char direction = int(random(2)) == 0? 'x': 'y';
    int magnitude = int(random(2)) == 0? 1:-1;
    magnitude = int(random(500)) ==0? magnitude*50 : magnitude;
    if(direction == 'x'){
      xPos += magnitude;
    }else{
      yPos += magnitude;
    }
    magnitude = magnitude / abs(magnitude);
    xPos = numWrap(xPos, 'x');
    yPos = numWrap(yPos, 'y');
    while(visited[xPos][yPos]){
      if(direction == 'x'){
        xPos += magnitude;
      }else {
        yPos += magnitude;
      }
      xPos = numWrap(xPos, 'x');
      yPos = numWrap(yPos, 'y');
    }
    visited[xPos][yPos] = true;
  }
  void display(){
    ellipse(float(xPos),float(yPos), 2.0,2.0);
  }
}

int numWrap(int num, char direction){
  int bound = direction=='x'? width: height;
  if (num >= bound){
    return num % bound;
  }else if (num <= 0){
    return bound + num;
  }
  return num;
}




