/// @file fb_centreroof.scad
///
/// @brief footbridge central roof
///
/// @author © Dave Harris 2022
/// 
///


include <fb_globals.scad>;
include <mod_prism.scad>;

translate(
  [ 0
  , 0
  , -0.00 ]
) cube(
    [ W_bridge +2
    , W_stairs +2
    , 0.5  ]
  );

rotate(
 [ -90
 , 0
 , 0 ]
) prism(
    h   = 3
  , w   = W_stairs +2
  , lLH = W_bridge/2 +1
  , lRH = W_bridge/2 +1
);

translate(
  [ W_bridge/2 +1
  , 0
  , -2.8  ]
) rotate(
     [ -90
     , 0
     , 0  ]
  ) cylinder(
        h = W_stairs +2
      , r = 0.5
    );

translate(
  [ 0
  , 0
  , -0.2 ]
) rotate(
     [ -90
     , 0
     , 0 ]
    ) prism(
        h   = 3.1
      , w   = 0.5
      , lLH = W_bridge/2 +1
      , lRH = W_bridge/2 +1
    );

translate(
  [ 0
  , W_stairs + 1.5
  , -0.1 ]
) rotate(
     [ -90
     , 0
     , 0 ]
    ) prism(
        h   = 3.2
      , w   = 0.5
      , lLH = W_bridge/2 +1
      , lRH = W_bridge/2 +1
    );

translate(
  [ 0
  , 0
  , -0.3 ]
) cube(
    [ W_bridge +2
    , 0.5
    , 0.6  ]
  );
translate(
  [ 0
  , W_stairs +1.5
  , -0.3 ]
) cube(
    [ W_bridge +2
    , 0.5
    , 0.6  ]
  );

// eof