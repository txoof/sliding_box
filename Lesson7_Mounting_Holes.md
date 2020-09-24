# Add Mounting Holes
You should have code that looks something like this now:
```
    /* [Base] */
    xSize = 45; // lenght of name tag
    ySize = 15; // height of name tag
    zSize = 3;  // thickness of name tag

    module base() {
      cube([xSize, ySize, zSize], center = true)
    }

    module base()
```

![Base Example](Lesson_7_-_img_7.0.png)

  1. Add a variable under the [Base] configuration for the hole diameter.
  2. Create a new module that makes two holes in the corners of the base. Start with the code provide below and try to move the holes so they are both 1/2 of the diameter from the edge. Copy and paste this just above the `base()` module.
```
    module holes() {
      translate([-xSize/2, ysize/2, 0])
        // create a cylinder with 36 segments that is 2 times the thicknes of the base
        translate([-xSize/2+holeDia, ySize/2, 0])
          #cylinder(r = holeRad, h = 2*zSize, $fn = 36, center = true);
        translate([xSize/2-holeDia, ySize/2, 0])
          #cylinder(r = holeRad, h = 2*zSize, $fn = 36, center = true);
    }
```
  3. Add a call just below the `base()` call to make the holes appear. Your code should look like this:
  ![Base with Holes](Lesson_7_-_img_7.1.png)

## Questions:
* What did you do to make sure the holes were 1/2 of the diameter from the edge?
* Why is this method better than hard-coding in a number for the placement of the holes?
* How does using a formula or equation help make this thing more customizable?

[<< Lesson 6 - Begin your own Customizable Project](./Lesson6_Customizable_Project.md) | [Lesson 8 - Add Extruded Text >>](./Lesson8_Add_Text.md)
