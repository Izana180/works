let mic;
let angle=0;
let dist=5;

function setup(){
  createCanvas(600, 600);
  background(0);
  mic=new p5.AudioIn();
  mic.start();
}

function draw(){
  background(0);

  let volume=mic.getLevel();
  let range=map(volume, 0, 0.1, 10, 1000);

//   noStroke();
//   fill(255);
//   textSize(12);
//   textAlign(RIGHT, TOP);
//   text(nf(volume, 0, 3), width-10, 10);

  translate(width/2, height/2);
  for(let i=0; i<range; i++){
    let r=dist*sqrt(i);
    let x=r*cos(angle);
    let y=r*sin(angle);

    fill(255);
    noStroke();
    ellipse(x, y, 3, 3);

    angle += 0.1;
  }
}
