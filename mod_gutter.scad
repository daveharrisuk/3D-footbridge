/// @file mod_gutter.scad
///
/// @brief Half a gutter module
//
/// @author © Dave Harris 2022
///

$fa = 1;   // Fragment angle
$fs = 0.4; // Fragment size resolution


module gutter( l )
{
    difference()
    {
      cylinder(
          h = l
        , r = 1.5
      );
      
      translate( // hollow out
        [ 0
        , 0
        , 0.2  ]
      ) cylinder(
            h = l
          , r = 1.3
        );
      
      translate( // cut in half
        [ -4
        , -2 
        , -0.1  ]
      ) cube(
          [ 4
          , 4
          , l +1  ]
        );
    }
}

//gutter(25);

// eof
