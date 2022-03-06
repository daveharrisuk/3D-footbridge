/// @file fb_span12Floor.scad
///
/// @brief footbridge span 1/2 floor
///
/// @author © Dave Harris 2022
///

include<fb_globals.scad>

use<mod_prism.scad>


spanFloor( L_span12
         , W_walk -0.2
         , W_girder = 1.9
         );

//color( "blue" // show centerline
//) cube(
//    [ L_span12 +4.1
//    , W_walk -0.2
//    , 0.0001 ], center=true
//  );



module spanFloor( length
                , width
                , W_girder = 2.2
                , W_tab    = 1.0
                , H_tab    = 3.0
                , thick    = 1.0
                , endHang  = 2.0
       )
{
  echo("span12Floor", length, width );


    cube(  // floor plate
      [ length + (endHang *2)
      , width - (thick *2) +0.001
      , thick  ], center = true
    );

    translate(  // chamfer edge 1
      [ -(length /2)
      , thick - (width /2)
      , -(thick /2)  ]
    ) rotate(
        [ 90
        , -90
        , 90  ]
      ) prism(
            lLH = thick
          , lRH = 0
          , w =   length
          , h =   thick
        );

    translate(  // chamfer edge 2
      [ -(length /2)
      , (width /2)
      , (thick /2)  ]
    ) rotate(
        [ 90
        , 180
        , 90  ]
      ) prism(
            lLH = thick
          , lRH = 0
          , w =   length
          , h =   thick
        );

    translate( // side tab support 1
      [ -(length /2)
      , -(width /2) + W_girder
      , -(thick /2)  ]
    ) cube(
        [ length
        , W_tab
        , thick + H_tab  ]
      );

    translate( // side tab support 2
      [ -(length /2)
      , (width /2) - W_girder - W_tab
      , -(thick /2)  ]
    ) cube(
        [ length
        , W_tab
        , thick + H_tab  ]
      );
}


// eof   
