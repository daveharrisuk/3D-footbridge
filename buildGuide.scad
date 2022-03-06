/// @file buildGuide.scad
///
/// @brief footbridge build guide
///
/// @author © Dave Harris 2022
///

include<fb_globals.scad>


buildGuide(W_plat45, W_build);

color("blue")
{
    cube(
      [ 3
      , W_build 
      , 0.1 ], center=true
    );
    cube(
      [ 3
      , W_plat45 
      , 0.01 ], center=true
    );
}


module buildGuide(
        platform
        , building
      )
{
    cube(
      [ 2
      , platform + 1
      , 2  ] , center = true
    );

    translate(
      [ -1
      , (platform /2) +0.2
      , -1  ]
    ) cube(
        [ 2, 2, 4 ]
      );
      
    translate(
      [ -1
      , -(platform /2) -2.1
      , -1  ]
    ) cube(
        [ 2, 2, 4 ]
      );
      
     translate(
      [ -1
      , (building /2) +1.1
      , 0  ]
    ) cube(
        [ 3, 2, 2 ], center=true
      );
      
    translate(
      [ -1
      , -(building /2) -1.1
      , 0  ]
    ) cube(
        [ 3, 2, 2 ], center=true
      );
 }
 
 // eof
 