/// @file fb_maintdoor.scad
///
/// @brief footbridge maintenance door
///
/// @author © Dave Harris 2022
/// 


include <fb_globals.scad>;


cube( // backing
  [ 12 +2
  , H_door - 4 +2
  , 0.5  ]
);

color("blue")
{
    translate( // door
      [ 1.0
      , 1
      , 0
    ]
    ) cube(
          [ 12 -0.3
          , H_door - 4 -0.3
          , 1.4  ]
       ); 
}

translate( // knob
  [ 11
  , H_door/2 -2
  , 0  ]
) cylinder( h=2.2, r=0.5 );
 
translate( // lock plate
  [ 10.5
  , H_door/2 -5
  , 1  ]
) cube(
    [ 1
    , 1
    , 0.5 ]
  );
 
translate( // hinge #1
  [ 1.2
  , 2
  , 1  ]
) cube(
    [ 0.4
    , 1
    , 0.7 ]
  );
translate( // hinge #2
  [ 1.2
  , 12
  , 1  ]
) cube(
    [ 0.4
    , 1
    , 0.7 ]
  );
translate( // hinge #3
  [ 1.2
  , 22
  , 1  ]
) cube(
    [ 0.4
    , 1
    , 0.7 ]
  );
 
