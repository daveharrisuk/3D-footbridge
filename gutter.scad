/* file: gutter.scad
***************************

OpenSCAD gutter module

Author: Dave Harris

20-Jan-2022 DH  v1

*/

module gutter(l)
{
rotate([0, 90, 0])
{
    difference()
     {
      cylinder(h=l, r=1.5);
      translate([0, 0, 0.2])
        cylinder(h= l -0.5, r=1.4);
      translate([-4, -2 , -0.1])
        cube([4, 4, l +0.2])  ;
     }
    }
  difference()
  {
    translate([1.5, 0, -2.7])
      cylinder(h=1.5, r=1);
    translate([1.5, 0, -3])
      cylinder(h=3.9, r=0.75);
    
  }
}

//gutter(25);

// eof
