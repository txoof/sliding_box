# Appendix and Solutions
## Solution for sliding top box `yDividers`:
```
    module yDividers(innerBoxDim) {
    // paste below this point.  Be careful that you pay attention to the curly brackets

      echo ("This is the xDividers module");
      echo ("innerBoxDim=", innerBoxDim);
      // the number of dividers is always one less than the number of compartments
      cols = yCompartments - 1;

      // calculate the spacing of the dividers based on the dimensions of the inner box
      // element 0 of the innerBoxDim variable contains the X dimension
      // element 1 of the innerBoxDim variable contains the Y dimension
      increment = innerBoxDim[1]/yCompartments;

      // if the number of y compartments is bigger than 1, do this:
      if ( yCompartments > 1) {
        // this loops several times to make each divider from 1 to the number of columns
        for ( i = [1 : cols]) {
          // move each divider into place
          // The translate statement needs to be updated so it moves in the Y axis
            translate([0, -innerBoxDim[1]/2+i*increment, 0])
              // draw a cube - this needs to draw the cube in an orientation 90
              // degrees from the xDividers
              cube([innerBoxDim[0], ,dividerThick, innerBoxDim[2]], center =true);

        } // this bracket is the end of the "for" loop
      } // this bracket is the end of the IF statement
    } // end module
```

## Name Tag Solution
A final version of the [name tag](http://www.thingiverse.com/thing:1204005) can be found on the Thingiverse for reference and download.
