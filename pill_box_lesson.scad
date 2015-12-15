/* [Outside Dimensions] */
boxX = 40; // width
boxY = 60; // depth
boxZ = 25; // height
cornerRad = 3; // radius of curved corners
wallThick = 2; // thickness of box walls

/* [Compartments] */
xCompartments = 3; // number of columns
yCompartments = 2; // number of rows
dividerThick = 1; // thickness of divider walls

/* [Lid] */
// amount of play in the lid in mm - the lid can't be the exact same size as the opening
lidSnugness = 0.1;

/* 
  This section is "hidden" from the customizer and is used for calculating
  variables based on those that the user inputs above
*/

/* [Hidden] */
// define the amount that needs to be subtracted to account for wall thicknesses
wallSub = 2 * wallThick;

// to avoid "z fighting" where surfaces line up exactly, add a bit of fudge
fudge = .001; 




/*
  OpenSCAD Parametric Box Lesson

  ADD LESSON HERE

  Activities:
  * Adjust the size of the box using configurator
  * Adjust the size of the box using the editor
  * Add the lid to the right of the box (+X)
  * Adjust the number of columns
    - Why can you not adjust the number of rows?
  * Add the row dividers by following example in column dividers
    - Why is there a variable name in the module statement?
    - Why is there an if statement in the module?

 
  Challenge Activities:
  * Make the lid slot customizable
  * Give the lid raised ridges instead of a slot
    - Hint: this is no longer a difference() opperation
  * add text to the lid
    - Hint: https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/The_OpenSCAD_Language#Text
    - Requires version > 2015.03
  * play with the "fudge" variable in the hidden section 
    - Explain what it does.
    - Why is it not negative?
 
    

  ADD LICENSE

  Style Notes:
    * Indentation is used to show nested calls:

      union() {
        // one indention to show that all calls are part of the union call
        cube([x, y, z], center = true)
        sphere(r = radius, center = true)
      }

    * cammelCaps are used to name variables to make them readable:
      - this allows more descriptive and readable variable names
      
      lidLength = 5 versus lidlength or lidl
      boxCutOut = 4 versus boxcutout boxc
    
    * Long commands are split over multiple lines using indenation
      - this makes code more readable in all editors and makes relationships
        more clear

      translate([0, lY/2-wall/2, -wall+catch/2]) 
        cube([lX*.8, catch*1.5, catch*1.3], center=true);

*/



/* 
  Add a ready made library for making rounded boxes
  Learn more about the MCAD libraries here: http://reprap.org/wiki/MCAD
*/
include <MCAD/boxes.scad>


/*
  Create the lid trapezoidal lid
  This sub creates both a lid and is used for cutting out the lid shape in the basic box
*/
module lid(cutter = false) {
  /*
    Lid profile

       boxX - 2* wall thickness + 2*(wall thickness/tan(trap angle))
    p0 ---------------- p1
       \) trap angle  /
        \            /
    P3   ------------   p2
         boxX - 2* wall thickness
         
  */
    

  // define how snug the fit should be on the lid
  // when this sub is used to "cut" enlarge the dimensions to make the opening larger
  snugness = cutter==false ? 1 : lidSnugness;

  // define the lid width (X)
  lidX = boxX - wallSub + snugness;

  // define the length of the lid (Y) 
  lidY = boxY - wallThick + snugness;

  // define the thickness of the lid
  lidZ = wallThick + snugness;

  // define slot dimensions
  slotX = lidX*.9;
  slotY = lidY*.05;


  // define the angle in the trapezoid; this needs to be less than 45 for most printers
  trapAngle = 70;
  lidAdd = wallThick/tan(trapAngle);
  // define points for the trapezoidal lid
  p0 = [0, 0];
  p1 = [lidX, 0];
  p2 = [lidX + lidAdd, lidZ];
  p3 = [0 + -lidAdd , lidZ];
  
  //center the lid
  translate([-lidX/2, -lidZ/2, snugness])
    // rotate the lid -90 degrees 
    rotate([-90])
    difference() {
      // draw a polygon using the points above and then extrude
      // linear extrude only works in the Z axis so everything has to be rotated after
      linear_extrude(height = lidY, center = true) 
        polygon([p0, p1, p2, p3], paths = [[0, 1, 2, 3]]); 


      // add a fingernail slot for making opening the lid easier
      // the variable names are a bit wonky because the lid is drawn rotated -90 degrees
      if ( cutter == false) {
        translate([lidX/2, lidZ, lidY/2-slotY*2])
          roundedBox([slotX, lidZ, slotY], radius = slotY/2, $fn=36);
      }
    }
}

/*
  create the dividers for the columns
*/
module xDividers(innerBoxDim) {
  echo ("This is the xDividers module");
  echo ("innerBoxDim=", innerBoxDim);
  // the number of dividers is always one less than the number of compartments
  cols = xCompartments - 1;

  // calculate the spacing of the dividers based on the dimensions of the inner box
  // notice that element 0 of the innerBoxDim variable contains the X dimension  
  increment = innerBoxDim[0]/xCompartments;
  if ( xCompartments > 1) {
    for ( i = [1 : cols]) {
      // move each divider into place
        translate([-innerBoxDim[0]/2+i*increment, 0, 0])
          cube([dividerThick, innerBoxDim[1], innerBoxDim[2]], center =true);
      
    }
  }
  

}


/*
  create the dividers for the rows
  You should be able to copy most of the xDiviers module into this module
  and make only minor changes. 
  
  Think about the following things:
  * box/cube modules accept variables as arrays [X, Y, Z] 
  * the first element of an array is called 0, the second 1, etc.
  * use '#' to help debug: 
    https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/The_OpenSCAD_Language#Chapter_8_--_Debugging_aids
*/
module yDividers() {
 
}


/*
  create the basic box
*/
module basicBox(outerBox, innerBox) {
  // Set the curve refinement
  $fn = 36;


  // Create the box then subtract the inner volume and make a cut for the sliding lid
  difference() {
    // call the MCAD rounded box command imported from MCAD/boxes.scad
    // size = dimensions; radius = corner curve radius; sidesonly = round only some sides

    // First draw the outer box
    roundedBox(size = outerBox, radius = cornerRad, sidesonly = 1);
    // Then cut out the inner box
    roundedBox(size = innerBox, radius = cornerRad, sidesonly = 1);
    // Then cut out the lid
    translate([0, 0, boxZ/2])
      lid(cutter = true); 
  }
}

/*
  This module will call all of the other modules and assemble the final box
*/
module dividedBox() {
  echo ("This is the dividedBox module");
  // Define the volume that will be the outer box
  outerBox = [boxX, boxY, boxZ];

  // Define the volume that will be subtracted from the box
  // a "fudge factor" is added to avoid Z fighting when faces align perfectly
  innerBox = [boxX-wallSub, boxY-wallSub, boxZ-wallSub+fudge*2];
  // call the basic box module


  basicBox(outerBox, innerBox);

  echo ("innerBox=", innerBox);
  xDividers(innerBox);
  yDividers();
  translate([-boxX, 0, -boxZ/2+wallThick/2])
    rotate([0, 180, 0])
    lid();
}

// call the dividedBox module
dividedBox();

