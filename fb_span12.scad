/// @file fb_span12.scad
///
/// @brief footbridge span 1 & 2
///
/// @author © Dave Harris 2022
///

include <fb_globals.scad>;

use <mod_prism.scad>;


echo("L_span12 ", L_span12 );

translate( // bottom beam
  [ 0
  , 0
  , 0  ]
) cube(
  [ L_span12 +2
  , 4.5
  , 2  ]
);

translate( // top beam
  [ 0
  , H_walk -1.5 -2
  , 0  ]
) cube(
  [ L_span12 +2
  , 1.5
  , 2  ]
);

translate( // upright #1  LH
  [ 0
  , 0
  , 0  ]
) cube(
    [ 2
    , H_walk -2
    , 2  ]
  );
  
translate( // upright #5 RH
  [ L_span12
  , 0
  , 0  ]
) cube(
    [ 2
    , H_walk -2
    , 2  ]
  );
  
translate( // upright #2
  [ (L_span12 /4 ) +0.25
  , 0
  , 0  ]
) cube(
    [ 1.5
    , H_walk -2
    , 2  ]
  );
  
translate( // upright #3
  [ (L_span12 /2 ) +0.25
  , 0
  , 0  ]
) cube(
    [ 1.5
    , H_walk -2
    , 2  ]
  );
  
translate( // upright #4
  [ 3* (L_span12 /4 ) +0.25
  , 0
  , 0  ]
) cube(
    [ 1.5
    , H_walk -2
    , 2  ]
  );

difference() // cross beams 1/2
{
  translate( // base prism
    [ 0
    , 4.5
    , 0  ]
  ) prism(
        h = H_walk - 4.5 -2
      , w = 2
      , lLH = ( L_span12 /4 ) +1
      , lRH = ( L_span12 /4 ) +1
    );
  translate( // sub prism
    [ 0
    , 4.5 -2.5
    , -1  ]
  ) prism(
        h = H_walk - 4.5 -1.5 
      , w = 2 +2
      , lLH = ( L_span12 /4 ) +1
      , lRH = ( L_span12 /4 ) +1
    );
}

difference() // cross beams 3/4
{
  translate( // base prism
    [ ( L_span12 /2 )
    , 4.5
    , 0  ]
  ) prism(
        h = H_walk - 4.5 -2
      , w = 2
      , lLH = ( L_span12 /4 ) +1
      , lRH = ( L_span12 /4 ) +1
    );
  translate( // sub prism
    [  ( L_span12 /2 )
    , 4.5 -2.5
    , -1  ]
  ) prism(
        h = H_walk - 4.5 -1.5 
      , w = 2 +2
      , lLH = ( L_span12 /4 ) +1
      , lRH = ( L_span12 /4 ) +1
    );  
}

// eof
