# Customizing in Open SCAD
Using OpenSCAD to edit an OpenSCAD file is very similar to the customizer at the Thingiverse. The biggest difference is you have access to all the lines and elements. You can change anything and everything.  If you are not careful in your edits, you may find that the code will no longer run properly. If you manage to completely break things, just delete the file and download a fresh copy.

1. Download [the OpenSCAD source](https://www.thingiverse.com/download:3451533) for this thing and open it up in OpenSCAD. 
    * You may need to click *View > Hide Customizer* to display the customizer pannel (seen on the right side)
![OpenSCAD Customizer](https://github.com/txoof/sliding_box/raw/master/Lessons/L1_OpenScad_Customizer.png)
2. Try changing the values in the customizer box on the right side of the window
    * You should see the dimensions and properties of the box changing. You are temporarily 'rewriting' the code that generates this design.
3. Now look in the left hand pannel with the code and find the `[ Outside Dimensions ]` section
    - Locate the line that looks like: boxX = 40;
    - Change the line to match this: boxX = 50;
    - Press F5 to render a preview (fn-F5 on a Mac)
    - try adjusting the X, Y and Z values; hit F5 to render the model again. Make sure each line you edited ends with a `;`!

### Questions:
* What could you customize here?
* Which sections did not seem to work?
* How is this different than using the customizer at Thingiverse?
* What advantages/disadvantages does this method have over working at Thingiverse?

[<< Lesson 1 - Thingiverse Customizer](./Lesson1_Customizer.md) | [Lesson 3 - Variables >>](Lesson2_Variables.md)
