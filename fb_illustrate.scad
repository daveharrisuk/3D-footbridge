/// @file fb_illustrate.scad
///
/// @brief footbridge illustration
///
/// @author © Dave Harris 2022
/// 
/// FOR ILLUSTRATION,
///  NOT PRINTING


include<fb_globals.scad>

use<fb_mod_RHwall.scad>
use<fb_mod_LHwall.scad>


fb_illustrate( seperation = 0 );


module fb_illustrate(
            seperation = 0
       )
{
    translate( // RH side
      [ 0
      , -(W_build /2) - seperation
      , 0  ]
    ) rotate([ -90, 0, 0 ]
      ) fb_mod_RHwall(
        );

    translate( // LH side
      [ 0
      , (W_build /2) + seperation
      , 0  ]
    ) rotate([ 90, 0, 0 ]
      ) fb_mod_LHwall(
        );
}


// eof fb_illustrate
