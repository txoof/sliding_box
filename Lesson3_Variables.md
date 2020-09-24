# Variables
This section is a little dry and doesn't have a lot of practical things to do. It is pretty important though so this might be a good time to stretch your legs and get a cookie or an apple before you continue.

The changes you were making under the [ Outside Dimensions ] sections were to 'variables.'Variables in OpenSCAD are containers that can hold integers (1, 2, -99999990002), real numbers (-1.123, 6.022, 99.4), boolean (true, false), arrays ([0, 5, 100], [[3, 4 5], [55, 0, 2]]) and text ('Hello world!').

Variables are a convenient way to store values in an easily identifiable package. This method also makes OpenSCAD projects easier to edit and make adjustable.  Compare the examples below:

Example 1:
```
    union() {
          cube([5, 5, 30], center = true);
          cube([5, 30, 5], center = true);
          cube([30, 5, 5], center = true);
     }
```

Example 2:

```
    short = 5;
    long = 30;
    union() {
           cube([short, short, long], center = true);
           cube([short, long, short], center = true);
           cube([long, short, short], center = true);
      }
```

![Example 1 & Example 2](Lesson_3_-_Ex1.png)

Both examples make exactly the same shape. Copy and paste example 1 into a new OpenSCAD file.  
1. Try and adjust Example 1 to match the image shown below. 
    - Hint the values are 2 and 40.
2. Now try with Example 2
  - If you're anything like me, you probably skipped the steps above and said, 'Yeah, yeah, I get it.'. I encourage you to give step 2 a try just so you can actually try out using variables in a clean space where you can't break too much.
  
![](Lesson_3_-_Ex2.png)
