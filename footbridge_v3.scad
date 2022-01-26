/// @file footbridge_v3.scad
///
/// @brief footbridge_v3
///
/// @author © Dave Harris 2022
/// 
/// 
///

include <triangle.scad>;
include <stairsLH.scad>;
//include <stairsRH.scad>;

$fa = 1;   // Fragment angle
$fs = 0.4; // Fragment size resolution

H_bridge = 49.5;
W_bridge = 36;
H_walk   = 36;

Steps    = 27;
W_stairs = 32;  // approx 9'6" in H0
L_tread  = 3.5; // approx 12" in H0
L_stairs = L_tread * (Steps +1);
H_rise   = H_bridge/(Steps +1); 
// rise=1.76786 not H0 scale 1.75 (6")

H_door   = 28;
W_door   = 18;

H_window = 6;
W_window = 16;

Ybase = 2;
Xbase = 2;


// stair wall
//------------------------

difference() // lower stair wall
{
    translate( // wall
       [0, Ybase, 0]
    )
      cube(
        [L_stairs +0.01, H_bridge +0.01, 1.01]
      );

    translate( // window 1 rebate
      [ 59, Ybase +18, 0.5]
    )
      cube(
        [ W_window+2, H_window +2, 2]
      );
    translate( // window 1
      [ 60, Ybase +19, -0.01]
    )
      cube(
        [ W_window, H_window, 2]
      );
      
    translate( // window 2 rebate
      [ W_window + 62, Ybase +18, 0.5]
    )
      cube(
        [ W_window+2, H_window +2, 2]
      );
    translate( // window 2
      [ W_window + 63, Ybase +19, -0.01]
    )
      cube(
        [ W_window, H_window, 2]
      );
}

translate( // floor level strength
   [0, 2, 0]
) 
  cube(
   [L_stairs +0.01, 1, 2]
  );


difference() // upper stair wall
{
    translate( // wall
       [0, H_bridge + Xbase, 0]
    )
      triangle( 
        lLH=L_stairs, lRH= 0, w=1.01, h=54
      );
    
    // window 1
    translate( // rebate
      [ 34, Ybase + H_bridge +0, 0.5]
    )
      cube(
        [ W_window+2, H_window +2, 2]
      );
    translate( // opening
      [ 35, Ybase +H_bridge +1, -0.01]
    )
      cube(
        [ W_window, H_window, 2]
      );
    
    // window 2
    translate( // rebate
      [ 62, Ybase + H_bridge +14, 0.5]
    )
      cube(
        [ W_window+2, H_window +2, 2]
      );
    translate( // opening
      [ 63, Ybase +H_bridge +15, -0.01]
    )
      cube(
        [ W_window, H_window, 2]
      );
    
}

translate( // infill under bridge opening
   [L_stairs, Ybase + H_door +4, 0]
)
  cube(
    [W_bridge +0.01, H_bridge -H_door -5, 1.01]
  );

translate( // infill over bridge opening
  [L_stairs -0.01, H_bridge + H_walk +Ybase, 0]
)
  cube(
   [W_bridge +0.01, 18, 1.01]
  );



// lift walls
//---------------

translate(  // lift wall
  [W_bridge +L_stairs, Ybase, 0]
)
  cube(
   [W_bridge +0.01, H_bridge + H_walk +0.01, 1.01]
  );

translate( // floor level strength
   [ L_stairs + W_bridge +1, 2, 0]
) 
  cube(
   [35, 1, 2]
  );
  

difference() // inner lower lift wall
{
  translate(
    [W_bridge + L_stairs +1, Ybase, 0]
  )
    cube(
     [1.5, H_bridge -1, (W_stairs/2) +1]
    );

    translate( // punch lift door
      [W_bridge +L_stairs, Ybase -0.1, 10]
    )
      cube(
        [3, H_door, 10]
      );

    translate( // punch wire hole
     [W_bridge + L_stairs,
      Ybase +H_bridge-6, W_stairs/2 -3]
    )
      cube(
       [3, 4.5, 5]
      );
}

translate( // close floor slot
   [W_bridge +L_stairs +2, Ybase +H_bridge -1.5, 0]
)
  cube(
    [0.8, H_door +2, W_stairs/2 +1]
  );

difference() // inner upper lift wall 
{
    translate( // wall
     [W_bridge +L_stairs +1, Ybase + H_bridge +0.1, 0]
    )
      cube(
        [1.01, H_walk +1, W_stairs/2 +1]
      );

    translate( // punch lift door
      [W_bridge +L_stairs, Ybase + H_bridge -0.1, 10]
    )
      cube(
        [3, H_door, 10]
      );
}


translate(
   [W_bridge + L_stairs +34.999, Ybase, 0]
  )
  // end lift wall
  cube(
    [1, H_bridge +H_walk +0.01, W_stairs/2 +1]
  );

translate( // lower end wall tab
  [W_bridge + L_stairs +34, Ybase, 0]
)
  cube(
    [1, 1, W_stairs/2 + 2]
  );

translate( // lower lift wall
  [W_bridge + L_stairs +2.1, Ybase, 0]
)
  cube(
   [1, H_door +1, W_stairs/2 + 1]
  );

translate( // mid end wall tab
  [W_bridge + L_stairs +34, Ybase +H_bridge -2, 0]
)
  cube(
    [1, 1, W_stairs/2 + 2]
  );

translate( // upper end wall tab
  [W_bridge +L_stairs +33, Ybase +85.5, 0]
)
  cube(
    [1, 1, W_stairs/2 + 2]
  );

translate( // RH upper wall
  [W_bridge +L_stairs, H_bridge + H_walk +Ybase, 0]
)
  triangle(
    lLH=0, lRH= 36, h=18, w=1.01
  );



// first floor supports
//------------------------

translate( // sub floor - top of stairs
  [L_stairs -0.01, Ybase+ H_bridge -2, 0]
) 
  cube(
    [2, 1, W_stairs/2 +1]
  );
  
translate( // sub floor - bridge opening
  [L_stairs -0.01, Ybase+ H_bridge -2, 0]
) 
  cube(
    [W_bridge +2, 1, 4]
  );
  
translate( // sub floor
  [L_stairs +W_bridge +1, Ybase+H_bridge-1.5, 0]
) 
  cube(
    [1.5, 2, 2]
  );



// stairs
//-------------

translate( // pilar stair entrance
  [0, Ybase, 1]
)
  cube(
    [2, H_bridge, 1]
  );

translate( // stairs
  [0, Ybase, 1]
)
  stairsLH(
    steps=Steps, rise=H_rise,
      tread=L_tread, width=W_stairs/2
  );

translate( // pillar top of stairs
  [L_stairs -1, Ybase, 0]
)
  cube(
    [1, H_bridge + H_walk +17, 2]
  );
   
translate( // under stair wall
  [56, Ybase, 0]
)
  cube(
    [1, H_door, W_stairs/2 +1]
  );
  
translate( // under stair wall tab
  [55, Ybase, 0]
)
  cube(
    [1, 1, W_stairs/2 + 2]
  );



// sundries
//------------

translate( // vertical strength 
  [56, Xbase, 0]
)
  cube(
    [2.1, 80.355, 2]
  );
  
translate( // over stairs
  [55.999, 82.357, 0]
)
  triangle( 
    lLH=2, lRH= 0, w=W_stairs/2 +1, h=1.099
  );
  
translate(
  [56.0, 78.357, 0]
)
  cube(
    [2, 4.001, W_stairs/2 +1]
  );
  
translate( // light support 
  [57.999, 78.358, 0]
)
  triangle(
    lLH=-2, lRH= 0, w=W_stairs/2 +1, h=-1.099
  );

translate( // light support 
  [27.999, 61.838, 0]
)
  triangle(
    lLH=-2, lRH= 0, w=W_stairs/2 +1, h=-1.099
  );

translate( // over stairs
  [25.999, 65.825, 0]
)
  triangle( 
    lLH=2, lRH= 0, w=W_stairs/2 +1, h=1.099
   );
   
translate(
  [26.0, 61.826, 0]
)
  cube(
    [2, 4.002, W_stairs/2 +1]
  );



// Lintels
//-----------

translate( // over lift wall
  [L_stairs -2 +W_bridge, Ybase+ H_bridge +H_door +16, 0]
)
  cube(
    [2, 10, W_stairs/2 +1]
  );

translate(
  [L_stairs +W_bridge, Ybase+ H_bridge +H_door +25, 0]
)
  triangle(  // over lift wall
    lLH=0, lRH= 2, w=W_stairs/2 +1, h=1
  );
    
translate( // over stairs
  [L_stairs -1.815, Ybase+ H_bridge +H_door +25, 0]
)
  triangle( 
    lLH=1.815, lRH= 0, w=W_stairs/2 +1, h=1 
  );

translate(  // over lift end wall
  [L_stairs +W_bridge + 34, Ybase+ H_bridge +H_walk, 0]
)
  triangle(
    lLH=0, lRH= 2.01, w=W_stairs/2 +1, h=1
  );
 
translate( // over top lift
 [L_stairs +W_bridge, Ybase+ H_bridge +H_door +24, 0]
)
  cube(
    [2, 1, W_stairs/2 +2]
  );

translate( // over top stairs
  [L_stairs -1.8, Ybase + H_bridge + H_door +24, 0]
)
  cube(
    [1.8, 1, (W_stairs/2) +2]
  );

translate( // over top stairs
  [L_stairs, Ybase + H_bridge + H_door +16, 0]
)
  cube(
    [2, 10, W_stairs/2 +1]
  );

translate( // tab over top stairs
  [L_stairs, Ybase + H_bridge + H_door +16, 0]
)
  cube(
    [2, 2, W_stairs/2 +2]
  );

translate( // over bottom stairs
  [0, Ybase+ H_door +4.5, 0]
)
  cube(
    [2, 17, W_stairs/2 +1]
  );

translate( // over bottom stairs
  [0, Ybase + H_bridge, 0]
)
  triangle(
    lLH=2, lRH= 0, w=W_stairs/2 +1, h=1.102
  );


//translate([2, -3.5, 2])
//  stairsRH(steps=27, rise=1.75, tread=3.5, width=16);



// eof
