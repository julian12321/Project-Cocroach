class Cokroach2 {
  PVector pos;
  PVector vel;
  PImage img;
  float heading;

  Cokroach2(PImage _img, float _x, float _y) {
    pos = new PVector(_x, _y);
    vel = PVector.random2D();
    img = _img;
  }

  void live() {
    pos.add(vel);

    if (pos.x <= 0 || pos.x >= width) vel.x *= -1;
    if (pos.y <= 0 || pos.y >= height) vel.y *= -1;

    heading = atan2(vel.y, vel.x);
    pushMatrix();
    imageMode(CENTER);
    translate(pos.x, pos.y);
    rotate(heading + 0.5 * PI);
    image(img, 0, 0);
    popMatrix();
  }

  boolean isHit(float mx, float my) {
    float d = dist(mx, my, pos.x, pos.y);
    return d < img.width / 2; 
  }
}
