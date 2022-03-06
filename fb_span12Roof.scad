/// @file fb_span12roof.scad
///
/// @brief footbridge span 1 & 2 roof
///
/// @author © Dave Harris 2022
///

include <fb_globals.scad>;


spanFloor( L_span12 + 1, W_walk );



module spanFloor(
          length
        , width
        )
{
    cube(  // floor plate
      [ length +2 
      , width +1 
      , 0.6 ], center = true
    );

  translate(
    [ -length/2, (width /2) -3, -0.25 ]
  ) cube(
      [ length, 1, 1.1 ]
    );

//  translate(
//    [ -length/2, -0.5, -0.3 ]
//  ) cube(
//      [ length, 1, 0.8 ]
//    );


  translate(
    [ -length/2, -(width /2) +2 , -0.25 ]
  ) cube(
      [ length, 1, 1.1 ]
    );
}

// eof
