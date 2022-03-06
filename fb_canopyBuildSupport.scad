/// @file fb_canopyBuildSupport.scad
///
/// @brief canopy build support
///
/// @author © Dave Harris 2022
/// 

include<fb_globals.scad>

use<fb_canopySpan2.scad>

//canopySpan2(Wplat = W_plat45 -1 );

difference()
{
  union()
  {
    translate(
      [ - (W_pillar /2) -1
      , - 4.5
      , 0  ]
    ) cube(
        [ 1
        , 9
        , H_door -1 ]
      );

   translate(
      [ - (W_pillar /2) -1
      , - 12
      , 0  ]
    ) cube(
        [ 1
        , 24
        , 2 ]
      );

    translate(
      [ - (W_pillar /2) -1
      , - (W_pillar /2) -1.1
      , 0  ]
    ) cube(
        [ 5.1
        , 1
        , H_door -1 ]
      );

    translate(
      [ - (W_pillar /2) -1
      , (W_pillar /2) +0.1
      , 0  ]
    ) cube(
        [ 5.1
        , 1
        , H_door -1 ]
      );

    translate(
      [ - (W_pillar /2) -1
      , (W_pillar /2) +0.9
      , 0  ]
    ) cube(
        [ 12
        , 1.5
        , 2 ]
      );

    translate(
      [ - (W_pillar /2) -1
      , -(W_pillar /2) -2.4
      , 0  ]
    ) cube(
        [ 12
        , 1.5
        , 2 ]
      );
  }
  cube([7, 6, 3], center=true );
  
}

// eof