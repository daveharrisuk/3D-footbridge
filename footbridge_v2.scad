/* file: footbridge_v2.scad
******************************

OpenSCAD source script


Author Dave Harris


20-Jan-2022  DH  v2.0
*/


// // illustrate platform
//translate([0,-30,-1])
//  cube([94,250,0.1],center=true);

$fa = 1;
$fs = 0.2;

include<prism.scad>; // module gutter()

include<gutter.scad>; // module prism()


H_bridge = 49.5;
W_bridge = 36;
H_walk   = 36;
H_door   = 28;
W_door   = 18;
H_window = 6;
W_window = 16;

// corner pillars
//-------------------

translate([18, 18, 0])
  cube([3, 3, H_bridge + H_walk]);
translate([18,-18,0])  // corner pillar
  cube([3, 3, H_bridge + H_walk]);
translate([-18, 18, 0])  // corner pillar
  cube([3, 3, H_bridge + H_walk]);
translate([-18, -18, 0]) // corner pillar
  cube([3, 3, H_bridge + H_walk]);


// lift building
//----------------

difference() 
{
  translate([-15, 20, 0])   // shell
    cube([33,33,85.5]);
  translate([-14.2, 22, -0.01]) // shaft
    cube([31, 30, 85.52]);
  translate([-12, 19, 0]) // door #0
    cube([W_door, 3.1, H_door]);
  translate([-12, 19, H_bridge +1]) // door #1
    cube([W_door, 3.1, H_door]);
    
  translate([-7, 50.85, 21]) // window #0
    cube([W_window, 3.1, H_window]);
  translate([-8, 50.6, 20]) // win #0 rebate
    cube([W_window +2, 2, H_window +2]);
  
  translate([-7, 50.85, H_bridge+21]) // win #1
    cube([W_window, 3.1, H_window]);
  translate([-8, 50.6, H_bridge+20]) // rebate
    cube([W_window +2, 2, H_window +2]);

  translate([-5, 18, H_door +16.5]) //wire hole
    cube([9,6,5]);
    
  translate([17.5, 30, 0]) // maintence door
    cube([ 2, 10, H_door-2]);
}

translate([17.5, 17, H_bridge])
  cube([0.5, 3, H_walk]);
translate([17.5, -17, H_bridge])
  cube([0.5, 3, H_walk]);

translate([18, 30, H_door-2])
  cube([0.5, 10, 0.5]); 

translate([-13, 22, H_bridge +1])
  cube([2.5, 1, H_door+1]);

translate([7, 19.5, 12]) // lift button #0
  cube([2, 2, 2]);
translate([7, 19.5, H_bridge+12]) // button #1
  cube([2, 2, 2]);

translate([-15.25, 54.39, H_bridge+H_walk -0.5])
  gutter(33.7);
translate([-13.8, 53.76, 0])
  cylinder(h=H_bridge+H_walk-3, r=0.8);
  
// 

translate([20, -15.0, H_door +2]) // RH opening
  cube([1, 33.5, H_bridge - H_door -2]);

translate([-18, -15.0, H_door +2]) // LH opening
  cube([1, 33, H_bridge - H_door -2]);

translate([-14, 21, 0])  // closed lift door
  cube([22, 1, H_door +1]);


// 1st floor
//-----------

// sub floor

translate([ -W_bridge/2,  // LH
        -W_bridge/2,
        H_bridge -1 ])
  cube([5, W_bridge +3, 1 ]);
  
translate([ -W_bridge/2 +4,  // under step
        -W_bridge/2,
        H_bridge -1 ])
  cube([W_bridge -5, 3, 1 ]);
  
translate([ +W_bridge/2 -2,  // RH
        -W_bridge/2,
        H_bridge -1 ])
  cube([5, W_bridge +3, 1 ]);

 // main floor
 
difference()
{
  translate([ -W_bridge/2 +3,
        -W_bridge/2,
        H_bridge])
    cube([W_bridge -3, W_bridge +34, 1 ]);
    
  translate([10, 45, H_bridge -0.1])
    cube([  6,6,6]); // wires hole
};



translate([18, -116, 0])  // stair pillar
  cube([3, 3, H_bridge]);
translate([-18, -116, 0]) // stair pillar
  cube([3, 3, H_bridge]);

translate([-16.5, -116, H_door+4]) // crossstrut
  cube([W_bridge, 1, H_bridge-H_door-4]);

translate([-18, -116, H_bridge ])
  prism(W_bridge+3, 3, 1.102);

translate([-18.5, -117.35, H_bridge -0.5])
  gutter(40);

translate([-16.98, -116.7, 0])
  cylinder(h=H_bridge -3, r=.75);



// stairs
//----------

for (dy = [0 : 1 : 27]) 
{
  y = dy *3.5 -116;
  h = dy *1.75;
  translate([-15.5, y, h]) // step
    cube([34, 6, 1.75]); 
  if(dy % 4 == 0)
  {
  translate([1, y, h]) // post
    cube([1, 1, 11]);
  }
}
translate([1, -18, H_bridge]) // top post
  cube([1, 1, 10.5]);

translate([-15.5, -56, 0]) // under stair wall
  cube([34, 2, H_door]);

rotate([26.7, 0, 0])  // center hand rail
  translate([1, -99, 61])
    cube([1, 111, 1]);
  
rotate([26.7, 0, 0]) // Left hand rail
  translate([-15.5, -99, 61])
    cube([1, 111, 1]);
    
rotate([26.7, 0, 0]) // Right hand rail
  translate([17.5, -99, 61])
    cube([1, 111, 1]);
  
rotate([27, 0, 0])  // light support #0
  translate([-1, -32, 49])
    cube([6, 43, 1]);
    
rotate([20.15, 0, 0])  // light support #1
  translate([-1, -89, 85.4])
    cube([6, 123.5, 1]);

translate([5, -18, H_bridge+H_walk])
  prism(W_bridge/2-5, 5, 1.75);
translate([-14, -18, H_bridge+H_walk])
  prism(W_bridge/2-5, 5, 1.75);

  

// stair wall RH
//---------------

difference() // lower wall
{
  translate([18.5, -113, 0])
    cube([2, 95, H_bridge]);
    
  translate([18, -41, 15])
    cube([3, W_window, H_window]); // apature
    
  translate([17, -42, 14])
    cube([3, W_window+2, H_window+2]); // rebate
}

difference() // upper wall
{
  translate([18.5, -116, H_bridge])
    prism( 2, 98, H_walk);

  translate([18, -71, H_bridge +1])
    cube([3, W_window, H_window]); // apature
    
  translate([17, -72, H_bridge +0])
    cube([3, W_window+2, H_window+2]); // rebate
}

// stair wall LH
//----------------

difference() // lower wall
{
  translate([-17.5, -113, 0])
    cube([2, 95, H_bridge]);
    
  translate([-18, -41, 15])
    cube([3, W_window, H_window]); // apature
    
  translate([-16.5, -42, 14])
    cube([3, W_window+2, H_window+2]); // rebate
}
    
difference() // upper wall
{
  translate([-17.5, -116, H_bridge])
    prism( 2, 98, H_walk); 

  translate([-18, -71, H_bridge +4])
    cube([3, 16, 6]); // win apature
    
  translate([-17, -72, H_bridge +3])
    cube([3, 18, 8]); // win rebate
}



rotate([20,0,0]) // cross strut above stairs
  translate([-17, -26, H_bridge +35.9])
    cube([W_bridge, 4, 1]);

rotate([20,0,0]) // cross strut above stairs
  translate([-17, -62, H_bridge+35.75])
    cube([W_bridge, 4, 1]);


// building roof
//-----------------

translate([-18, -18, H_bridge+H_walk])
  prism(4, 39, 14.3);
  
translate([17, -18, H_bridge+H_walk])
  prism(4, 39, 14.3);
  
rotate([0, 0, 180])
  translate([13., -53, H_bridge+H_walk])
    prism(2, 32, 12);
    
rotate([0, 0, 180])
  translate([-18, -53, H_bridge+H_walk])
    prism(2, 32, 12);

difference()
{
  translate([-14, 20.5, H_bridge+H_walk])
    cube([W_bridge-5, .5, 13.5]);
  translate([-2, 18, H_bridge+H_walk-0.5])
    cube([8,4,6]); // wire cutout
}

translate([-14.5, 21, H_bridge + H_walk +10.65])
  cube([W_bridge -4, 1, 1]);

translate([-1, -0, H_bridge + H_walk +5.5])
  cube([6, 34, 1]);
translate([-13, 32.65, H_bridge + H_walk +5.5])
  cube([30, 3, 1]);

translate([-14.5, 33.835, H_bridge+H_walk +6.5])
  cube([W_bridge -4, 0.5, 0.5]);

translate([-14.5, 2.5, H_bridge+H_walk +6.5])
  cube([W_bridge -4, 2, 1]);


translate([-17, 18, H_bridge+H_walk+13.2])
  prism(W_bridge, 3, 1.1);

 
 // eof
 