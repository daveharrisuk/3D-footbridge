/// @file fb_span34.scad
///
/// @brief footbridge span 3 & 4
///
/// @author © Dave Harris 2022
///

include <fb_globals.scad>;

include <mod_prism.scad>;


echo("L_span34 ", L_span34 );

translate( // bottom beam
  [ 0
  , 0
  , 0  ]
) cube(
  [ L_span34 +2
  , 4.5
  , 2.2  ]
);

translate( // top beam
  [ 0
  , H_walk -1.5 -2
  , 0  ]
) cube(
  [ L_span34 +2
  , 1.5
  , 2.2  ]
);

translate( // upright #1  LH
  [ 0
  , 0
  , 0  ]
) cube(
    [ 2
    , H_walk -2
    , 2.2  ]
  );
  
translate( // upright #5 RH
  [ L_span34
  , 0
  , 0  ]
) cube(
    [ 2
    , H_walk -2
    , 2.2  ]
  );
  
translate( // upright #2
  [ (L_span34 /4 ) +0.25
  , 0
  , 0  ]
) cube(
    [ 1.5
    , H_walk -2
    , 2.2  ]
  );
  
translate( // upright #3
  [ (L_span34 /2 ) +0.25
  , 0
  , 0  ]
) cube(
    [ 1.5
    , H_walk -2
    , 2.2  ]
  );
  
translate( // upright #4
  [ 3* (L_span34 /4 ) +0.25
  , 0
  , 0  ]
) cube(
    [ 1.5
    , H_walk -2
    , 2.2  ]
  );

difference() // cross beams 1/2
{
  translate( // base prism
    [ 0
    , 4.5
    , 0  ]
  ) prism(
        h = H_walk - 4.5 -2
      , w = 2.2
      , lLH = ( L_span34 /4 ) +1
      , lRH = ( L_span34 /4 ) +1
    );
  translate( // sub prism
    [ 0
    , 4.5 -2.5
    , -1  ]
  ) prism(
        h = H_walk - 4.5 -1.5 
      , w = 2.2 +2
      , lLH = ( L_span34 /4 ) +1
      , lRH = ( L_span34 /4 ) +1
    );
}

difference() // cross beams 3/4
{
  translate( // base prism
    [ ( L_span34 /2 )
    , 4.5
    , 0  ]
  ) prism(
        h = H_walk - 4.5 -2
      , w = 2.2
      , lLH = ( L_span34 /4 ) +1
      , lRH = ( L_span34 /4 ) +1
    );
  translate( // sub prism
    [  ( L_span34 /2 )
    , 4.5 -2.5
    , -1  ]
  ) prism(
        h = H_walk - 4.5 -1.5 
      , w = 2.2 +2
      , lLH = ( L_span34 /4 ) +1
      , lRH = ( L_span34 /4 ) +1
    );  
}

// eof
