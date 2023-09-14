PImage cat;
float catX, catY;
boolean isDragging = false;
float fallSpeed = 10;

void setup() {
  size(1000, 1000);
  cat = loadImage("cat.png");
  catX = width / 2;
  catY = height / 2;
}

void draw() {
  background(290);
  
  if (isDragging) {
    // If the image is being dragged
    catX = mouseX;
    catY = mouseY;
  } else if (catY < height) {
    //make it fall
    catY += fallSpeed;
  }
  
  imageMode(CENTER);
  image(cat, catX, catY);
}

void mousePressed() {
  float d = dist(mouseX, mouseY, catX, catY);
  if (d < cat.width / 2) {
    isDragging = true; 
  }
}

void mouseReleased() {
  if (isDragging) {
    //enable falling when released
    isDragging = false;
  }
}
