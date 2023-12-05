// the number of rows to draw
int numRows;
// the number of rectangles in the starting (bottom) row
int rowLength;
// the X coordinate of the first rectangle in the bottom row
int startX;
// the Y coordinate of the first rectangle in the bottom row
int startY;
// the width of each rectangle
int rectWidth;
// the height of each rectangle
int rectHeight;
// when isColour is false, all rectangles are filled in white
// otherwise a random fill colour is chosen
boolean isColour;

void setup() {
  size(900, 400);
  stroke(0); // pen colour black
  numRows = 0;  // initially one row of rectangles is drawn
  rowLength = 10; // 10 rectangles in the first row
  startX = 50;
  startY = 350;
  rectWidth = 75; // each rectangle 75 pixels wide
  rectHeight = 30; // each rectangle 30 pixels wide
  isColour = false; // no colour to start with
}

void draw() {
  background(255);
  // don't change the line above
  float rectX; // local variable to store x-coordinate of rectangle
  rectX = 0;
  float rectY;
  rectY = 0;
  float rowLengthDec; // don't touch
  rowLengthDec = 0; // starts at 0 bc no rectangles are removed in the first row
  int multiplier;
  multiplier = 1;
  
  for (int count2 = 0; count2 < numRows; count2 = count2 + 1) { // handles rows
    
    for (int count = 0; count < rowLength-rowLengthDec; count = count + 1) { // handles rectangles
      rect(startX+rectX, startY-rectY, rectWidth, rectHeight); // creates rectangles
      rectX = rectX + 75; // next rectangle to be drawn
    }
    
    rowLengthDec = rowLengthDec + 1;
    rectX = rectWidth/2 * multiplier; // alternate between the half of the rectangles
    multiplier = multiplier + 1; // has to be after so it multiplies by 1 first
    rectY = rectY + 30; 
    
  }
  
}

void mousePressed() {
  if (numRows <= 9) {
    numRows = numRows + 1;
    println(numRows);
  } else {
      numRows = 0;
      isColour =! isColour;
      
  }
  
  if (isColour == true) {
    fill(random(0,255), random(0,255), random(0,255));
  } else {
    fill(255);
  }
}
