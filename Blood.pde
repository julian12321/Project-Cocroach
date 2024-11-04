class Blood {
  PVector pos;
  PImage img;
  int spawnTime;
  int duration = 500;  
  float imgWidth, imgHeight;

  Blood(PImage _img, float x, float y, float width, float height) {
    img = _img;
    pos = new PVector(x, y);
    imgWidth = width;    
    imgHeight = height;  
    spawnTime = millis();
  }

  void display() {
    if (millis() - spawnTime < duration) {
      pushMatrix();
      imageMode(CENTER);
      translate(pos.x, pos.y);
      image(img, 0, 0, imgWidth, imgHeight);  
      popMatrix();
    }
  }

  boolean isExpired() {
    return millis() - spawnTime > duration;
  }
}
