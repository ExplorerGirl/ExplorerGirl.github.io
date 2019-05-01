/** 
The 4 controls below can be used to customize your coloring. 

For the paint width and height, you can make the number bigger or smaller to adjust the size. 

For the background color and paint color, click in the parentheses after the word "color", and a colored square surrounded by black will appear. Hover over this square and select whichever color you want. When you are done, click somewhere outside the square and it will go away.
**/


var backgroundColor = color(255, 255, 255);
var paintColor = color(97, 36, 171);
var paintWidth = 20;
var paintHeight = 20;








//define variables
{    
    var currentScene;
    var darkBlueColor = color(26, 64, 186);
    var whiteColor = color(255, 255, 255);
    var blackColor = color(0, 0, 0);
    var lightBlueColor = color(0, 168, 235);
    textAlign(CENTER, CENTER);
    textFont(createFont("cursive"));
}

//Button Code
{
var Button = function(btnColor, btnX, btnY, btnWidth, btnHeight, btnTextColor, btnTextSize, btnText){
    this.btnColor = btnColor;
    this.btnX = btnX;
    this.btnY = btnY;
    this.btnWidth = btnWidth;
    this.btnHeight = btnHeight;
    this.btnTextColor = btnTextColor;
    this.btnTextSize = btnTextSize;
    this.btnText = btnText;
};

Button.prototype.draw = function() {
    stroke(0, 0, 0);
    fill(this.btnColor);
    rect(this.btnX - this.btnWidth/2, this.btnY - this.btnHeight/2, this.btnWidth, this.btnHeight);
    fill(this.btnTextColor);
    textSize(this.btnTextSize);
    text(this.btnText, this.btnX, this.btnY);
    
};

Button.prototype.isMouseInside = function(){
    return  mouseX > (this.btnX - this.btnWidth/2) &&
            mouseX < (this.btnX + this.btnWidth/2) &&
            mouseY > (this.btnY - this.btnHeight/2) &&
            mouseY < (this.btnY + this.btnHeight/2);
};

var freeDrawButton = new Button(lightBlueColor, 105, 300, 150, 50, whiteColor, 25, "Free Draw");
var coloringPageButton = new Button(lightBlueColor, 295, 300, 150, 50, whiteColor, 21, "Coloring Page");
}

var drawMainPage = function(){
    currentScene = 1;
    background(darkBlueColor);
    freeDrawButton.draw();
    coloringPageButton.draw();
    fill(whiteColor);
    textSize(40);
    text("Drawing & Coloring", 200, 60);
    textSize(16);
    text("Click on one of the buttons below to either free draw or color a coloring page. In the code on the right, you can change 4 controls. To draw, press down and drag. If you would like to return to this page after clicking on a button, click the restart button below this screen.", 20, 70, 360, 200);

};
var drawFreeDrawPage = function(){
    currentScene = 2;
    background(backgroundColor);
};

var drawColoringPage = function(){
    currentScene = 3;
    background(backgroundColor);
    strokeWeight(7);
    fill(backgroundColor);
    
//draw border circles    
    for(var c = 60; c < 360; c += 70){
        ellipse(c, 380, 40, 20);
        ellipse(c, 20, 40, 20);
    }
    
    for(var t = 60; t < 360; t += 70){
        ellipse(20, t, 20, 40);
        ellipse(380, t, 20, 40);
    
    }
//draw triangles
    triangle(150, 350, 200, 300, 250, 350);
    triangle(50, 150, 100, 200, 50, 250);
    triangle(150, 50, 200, 100, 250, 50);
    triangle(350, 150, 300, 200, 350, 250);
    

//draw cross lines
    line(0, 0, 400, 400);
    line(400, 0, 0, 400);
    
//draw second, bigger, flower
    ellipse(250, 250, 100, 100);    
    ellipse(150, 150, 100, 100);
    ellipse(150, 250, 100, 100);
    ellipse(250, 150, 100, 100);

//draw center flower
    bezier(200, 200, 300, 100, 300, 300, 200, 200);
    bezier(200, 200, 100, 300, 300, 300, 200, 200);
    bezier(200, 200, 100, 100, 300, 100, 200, 200);
    bezier(200, 200, 100, 100, 100, 300, 200, 200);
    ellipse(200, 200, 30, 30);
    

 
};

//button clicking
mouseClicked = function(){
  if(currentScene === 1 && freeDrawButton.isMouseInside()){
    drawFreeDrawPage();
  }  
  else if(currentScene === 1 && coloringPageButton.isMouseInside()){
      drawColoringPage();
  }
};

//coloring code
mouseDragged = function() {
    if (currentScene === 2 || currentScene === 3) {
        noStroke();
        fill(paintColor);
        ellipse(mouseX, mouseY,paintWidth, paintHeight);
    }
};

drawMainPage();
