/// @file fb_globals.scad
///
/// @brief project footbridge globals
///
/// @author © Dave Harris 2022
///
/// Included in all project files.


$fa = 1;   // Fragment angle
$fs = 0.4; // Fragment size resolution

// global constants
//------------------

H_canopy = 47;

H_bridge = 49.5; // platform<>bridge
W_bridge = 36;   // width of bridge
                 // > walkway
W_walk   = 34.5; // width
H_walk   = 36;   // height of walkway


Steps    = 27;   // number of steps
W_stairs = 32;   // width ~ 9'6" @ H0
L_tread  = 3.5;  // tread ~ 12" @ H0
L_stairs = L_tread * (Steps +1);
H_rise   = H_bridge / (Steps +1); 
  // rise is 1.7678, not H0 1.75 (6")

W_lift   = 34;

W_build  = W_stairs +2;
L_build  = L_stairs+W_bridge+W_lift +2;

W_pillar = 4;

L_spacing = L_build /2;

Spans = 6;

L_canopy = ((Spans -1) * L_spacing) + W_pillar;

echo("len",L_canopy);

H_door   = 28;
W_door   = 18;

H_window = 6;
W_window = 16;


W_plat45  = 93.9;
W_track34 = 87.9;
W_plat23  = 93.8;
W_track12 = 87.9;

W_plat23edge =
   ( W_plat23 - W_stairs +2 ) /2 ;
W_plat45edge =
   ( W_plat45 - W_stairs +2 ) /2 ;
   
L_span34 = W_track34 + W_plat45edge + W_plat23edge;

L_span12 = 136.5;

W_grider = 2.2;

W_LEDstrip = 7.5;



// eof
