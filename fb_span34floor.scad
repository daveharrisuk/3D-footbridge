/// @file fb_spanFloor.scad
///
/// @brief footbridge span floor
///
/// @author © Dave Harris 2022
///

include<fb_globals.scad>
use<mod_prism.scad>


module spanFloor(
                  length
                , width
                , W_girder
                )
{
    cube(  // floor
      [ length +4
      , width - W_girder +0.01
      , 1  ], center = true
    );

    translate(  // chamfer edge
      [ -(length /2)
      , 1 - (width /2)
      , -0.5  ]
    ) rotate(
        [ 90
        , -90
        , 90  ]
      ) prism(
            lLH = 1
          , lRH = 0
          , w = length
          , h = 1
        );

    translate(  // chamfer edge
      [ -(length /2)
      , width /2 
      , 0.5  ]
    ) rotate(
        [ 90
        , 180
        , 90  ]
      ) prism(
            lLH = 1
          , lRH = 0
          , w = length
          , h = 1
        );

    translate( // side support 1
      [ 0
      , W_girder - (width /2)
      , 1.5  ]
    ) cube(
        [ length
        , 1
        , 4  ], center = true
      );

    translate( // side support 2
      [ 0
      , (width /2) - W_girder
      , 1.5  ]
    ) cube(
        [ length
        , 1
        , 4  ], center = true
      );
}

echo("span34", L_span34, W_walk );

spanFloor( L_span34, W_walk, 2 );

color("blue") cube(
    [ L_span34 +4.5
    , W_walk
    , 0.0001 ], center=true);

// eof   
    