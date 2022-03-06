/// @file fb_endWall.scad
///
/// @brief footbridge endWall
///
/// @author © Dave Harris 2022
///

include<fb_globals.scad>
use<mod_window.scad>

difference()
{
   cube(
     [ 35.5, 36.5, 1 ]
   );

  window(
       9.5
     , 15  // 48.7+15=63.7
     , W_window
     , 9 
   );

}