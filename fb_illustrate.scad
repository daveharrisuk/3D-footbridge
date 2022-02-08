/// @file fb_illustrate.scad
///
/// @brief footbridge illustration
///
/// @author © Dave Harris 2022
/// 
/// FOR ILLUSTRATION,
///  NOT FOR PRINTING


include <fb_globals.scad>;
include <fb_mod_RHwall.scad>;
include <fb_mod_LHwall.scad>;


translate( // RH side
  [ 0
  , 0
  , - (W_stairs/2) -2  ]
)
  fb_RHwall();


translate( // LH side
  [ 0
  , 0
  , (W_stairs/2) +2  ]
) rotate([ 180, 0, 0])
    fb_LHwall();


// eof fb_illustrate
