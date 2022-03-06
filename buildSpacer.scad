/// @file buildSpacer.scad
///
/// @brief footbridge span floor
///
/// @author © Dave Harris 2022
///

include<fb_globals.scad>


difference()
{
  translate(
    [ 0, 0.0001, 0 ]  
  ) cube(
      [ 30.5
      , 34
      , 1  ]
    );

  translate(
    [ -0.1, -0.01, -0.1 ]  
  )     cube(
      [ 3.1
      , 3.1
      , 2  ]
    );

  translate(
    [ 28, -0.01, -0.1 ]  
  ) cube(
      [ 3.1
      , 3.1
      , 2  ]
    );
}

  translate(
    [ 14, 0, 0 ]  
  ) cube(
      [ 2
      , 2
      , 4  ]
    );
