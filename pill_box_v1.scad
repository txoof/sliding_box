include <MCAD/boxes.scad>

//Pill box with sliding lid

/* [Box Dimensions] */
//Box Width (min: 5 x Wall Thickness)
bX=24; 
//Box Depth (min: 5 x Wall Thickness)
bY=40; 
//Box Height (min: 5 x Wall Thickness)
bZ=12;
//Corner Radius (radius of the corner fillet inside and outside)
corner=2.5; 

/* [Wall Thickness] */
//Wall Thickness (min: 2mm)
wall=2.6;

/* [Lid] */
//Lid Lip Width (min: 1mm)
lip=2;
//Snugness of Lid (values approaching 1.0 result in a snugger fit)
snug=.99; 

/* [Catch] */
//Catch Height (height over the lip for the catch)
catch=1;

/* [Hidden] */
boxDim=[bX, bY, bZ]; 

module drawBox () {
  innerBox=[bX-(2*wall), bY-(2*wall), bZ-(2*wall)+.22];
  echo("innerBox=", innerBox);
  difference() {
    roundedBox(boxDim, corner, sidesonly=1, $fn=36);
    roundedBox(innerBox, corner, sidesonly=1, $fn=20);
    translate([0, -wall, bZ/2+.1]) cutLid(0);
  }
}

module cutLid(shorten, catch) {
  //Create a trapezoid lid 

  insideLip=wall*1.2; //lip inside the box for the lid to rest upon
  lX=bX-(2*wall)+insideLip;
  lY=bY-shorten;

  echo("inside lip=", insideLip/2);

  p0=[0, 0];
  p1=[lX, 0];
  p2=[lX-lip, wall];
  p3=[lip, wall];

  // this needs to be less than 45 deg to be usable
  echo("Lip Overhang=", atan(lip/wall));
  
  difference() {
    rotate([90,0,0])
      translate([-lX/2, -wall, 0]) 
      linear_extrude(height=lY, center=true) polygon([p0, p1, p2, p3], paths=[[0,1,2,3]]);
    if (catch==1) {
      translate([0, lY/2-wall/2, -wall+catch/2]) cube([lX*.8, catch*1.5, catch*1.3], center=true);
      //Add an additional slot to make it easier to slide open the lid
      translate([0, -lY/2+wall, wall/3]) cube([lX*.6, catch*1.5, catch*5], center=true);
    } else {
      echo("catch=false");
    }

  }
}

module drawCatch() {
  rad=catch/2;
  lX=bX-2*(wall+.2);

  union() {
    translate([-lX/3, 0, 0]) sphere(r=rad, $fn=20);
    translate([ lX/3, 0, 0]) sphere(r=rad, $fn=20);
    rotate([0,90,0])cylinder(h=lX/1.5, r=rad, center=true, $fn=20);
  }
}

module assemble() {
    union() {
      drawBox();
      //move the catch to the front of the box
      translate([0, -(bY/2)+wall/2, bZ/2-wall]) drawCatch();
    }
  //draw the lid (wall, 1) - second paramater specifies to add a hole for a catch
  translate([bX+10, 0, (-bZ/2)]) rotate([180, 0, 0]) scale([snug, .97, snug]) cutLid(wall, 1);
}

assemble();
