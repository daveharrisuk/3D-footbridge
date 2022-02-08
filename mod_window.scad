/// @file mod_window.scad
///
/// @brief module- standard window opening
///
/// @author © Dave Harris 2022
/// 

module window(x, y, w, h)
{
    translate( // glazing rebate
      [ x -1
      , y -1
      , 0.5  ]
    ) cube(
        [ w +2
        , h +2
        , 2  ]
      );
    
    translate( // punch opening
      [ x
      , y
      , -0.5  ]
    ) cube(
        [ w
        , h
        , 2.5  ]
      ); 
    
}; // end module window

// eof
