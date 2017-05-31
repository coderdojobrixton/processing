// array lists of obstacles and cherries
ArrayList<Wall> walls = new ArrayList<Wall>();
ArrayList<Cherry> cherries = new ArrayList<Cherry>();

// A variable to store a reference to a PacMan object
// The type is the same as the class name
PacMan pacMan;

void setup() {
  
  size(800, 600);

  initializeWalls();
  initializeCherries();
  
  // add initialized cherries and obstacles lists into the pacman
  // so it knows what to eat and what to collide against
  pacMan = new PacMan(120, 150, 100, walls, cherries);
}

void initializeWalls() {
  
  walls.add(new Wall(0, 0, width, 50));
  walls.add(new Wall(0, 0, 50, height));
  walls.add(new Wall(0, height - 50, width, height));
  walls.add(new Wall(width - 50, 0, width, height));
  walls.add(new Wall(200, 0, 50, 400));
  walls.add(new Wall(400, 350, 50, 200));
  walls.add(new Wall(600, 200, width, 50));
  
}

void initializeCherries() {
  
  cherries.add(new Cherry(120, 500, 50));
  cherries.add(new Cherry(400, 150, 50));
  cherries.add(new Cherry(600, 400, 50));
  cherries.add(new Cherry(700, 100, 50));
  
}

void draw() {
  background(255);  // white background

  pacMan.updateState();
  pacMan.draw();


  for (Wall w : walls) {
    w.draw();
  }
  
  for (Cherry c : cherries) {
    c.draw();
  }
}

void keyPressed() {
  if (key == 'r') { // refresh cherries
    initializeCherries();
  }
  if (keyCode == UP) {
    pacMan.up();
  }
  if (keyCode == DOWN) {
    pacMan.down();
  }
  if (keyCode == LEFT) {
    pacMan.left();
  }
  if (keyCode == RIGHT) {
    pacMan.right();
  }
  if (key == ' ') {
    pacMan.stop();
  }
}