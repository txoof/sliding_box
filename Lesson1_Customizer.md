# Introduction to the Customizer
The Thingiverse and Openscad offers users the ability to display their models and designs through a sort of gallery.  The gallery can contain images, pdfs, zipped files STL models, OpenSCAD source files and many other file types. 

Most models on the Thingiverse are STL files. These are sort of like loaves of bread; they have been made to a recipe with a program like Rhino, Sketchup, Blender or OpenSCAD. They are more-or-less immutable and cannot be changed without a special STL editor.

OpenSCAD files are more of a recipe than a finished product. The recipe can be tweaked and modified to suit a particular need. When OpenSCAD is instructed to 'render' a design, it runs the recipe and bakes the finished product.  Some OpenSCAD designs are more tweakable than others depending on how they are created.

Explore the design below and see what can be manipulated. Think about this might be useful.

1. Open [this thing at Thingiverse.com](http://www.thingiverse.com/thing:1201466/) and launch the customizer
   * Note: You will need a free Thingiverse account.  If you do not have/want a thingiverse account please skip to Lesson 2
2. Play around with the customizable elements.  Try to make a box that has the following dimensions:
   * X: 30, Y: 50, Z:25
   * Wall thickness: 2
   * xCompartments: 4
   * yCompartments: 1 
  
![Thingiverse Customizer](./Lessons/L1_customizer.png)

3. Create an STL and download it later by clicking on the "Create Thing" link.

### Questions:
* What could you customize on this box?
* Why is it useful to be able to customize objects?
* In what cases would a designer **not** want to provide a customizable object?
* What happened as you input different values?
* Which features did not seem to work properly?
* What features would you like to add to this object?

## Customizing in Open SCAD
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

[<< Introduction](Readme.md) | [Lesson 2: Variables >>](Lesson2_Variables.md)
