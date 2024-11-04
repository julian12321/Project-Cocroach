ArrayList<Cokroach2> coks;
ArrayList<Blood> bloods;
import processing.sound.*;

PImage imgCokroach, imgBlood;
int spawnInterval = 5000;  
int lastSpawnTime = 0;
int score = 0;  


SoundFile Muncul;
SoundFile Hilang;

void setup() {
  size(800, 800);
  coks = new ArrayList<Cokroach2>();
  bloods = new ArrayList<Blood>();
  imgCokroach = loadImage("kecoa.png");
  imgBlood = loadImage("darah.png");
  Muncul = new SoundFile(this,"Powerup3.wav");
  Hilang = new SoundFile(this,"Hit_Hurt15.wav");
}

void draw() {
  background(255);

  
  if (millis() - lastSpawnTime > spawnInterval) {
    float x = random(width);
    float y = random(height);
    coks.add(new Cokroach2(imgCokroach, x, y));
    lastSpawnTime = millis();
    Muncul.play();
  }

  
  for (int i = coks.size() - 1; i >= 0; i--) {
    Cokroach2 c = coks.get(i);
    c.live();
  }

  
  for (int i = bloods.size() - 1; i >= 0; i--) {
    Blood b = bloods.get(i);
    b.display();
    if (b.isExpired()) {
      bloods.remove(i);  
    }
  }

 
  fill(51);
  textSize(16);
  text("Jumlah kecoak: " + coks.size(), 50, 750); 
  text("Skor: " + score, 50, 720); 
}

void mouseClicked() {
  for (int i = coks.size() - 1; i >= 0; i--) {
    Cokroach2 c = coks.get(i);
     if (c.isHit(mouseX, mouseY)) {

      bloods.add(new Blood(imgBlood, c.pos.x, c.pos.y, imgCokroach.width, imgCokroach.height));
      coks.remove(i);
      Hilang.play();
      score += 10;    
      break;
    }
  }
}
