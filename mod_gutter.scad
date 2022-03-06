/// @file mod_gutter.scad
///
/// @brief A gutter module
//
/// @author © Dave Harris 2022
///

$fa = 1;   // Fragment angle
$fs = 0.1; // Fragment size resolution


// local test

translate(
  [ 0, -2, 0 ]
) mod_gutter(
        length = 35
      , width  = 1.75
      , pipeEnd = "right"
  );

translate(
  [ 0, 2, 0 ]
) mod_gutter(
        profile = "square"
      , length = 35
      , width  = 1.75
  );


module mod_gutter(
         length
       , width
       , profile = "round"
       , pipeEnd = "left"
       , thickness = 0.2
      )
{
 innerLen = length - (thickness *2);
 halfWidth = width /2;

 pe = pipeEnd == "left"
    ? width - (innerLen /2)
    : (innerLen /2) - width ;   

 difference()
 {    
   if( profile == "round")
   {
    difference()
    {
      cylinder(
          h = length
        , r = halfWidth
        , center = true
      );

      cylinder(
          h = innerLen
        , r = halfWidth - thickness
        , center = true
      );

      translate( // remove half
         [ halfWidth
         , 0
         , 0 ]
      ) cube(
           [ width
           , width
           , length +0.01  ]
          , center = true
        );
    }
   }
   else // square profile
   {
    translate(
      [ - halfWidth /2
      , 0
      , 0  ]
    ) difference()
      {
        cube(
          [ halfWidth
          , width
          , length ]
         , center = true
        );
            
        translate( // remove half
          [ thickness /2
          , 0
          , 0  ]
        ) cube(
             [ halfWidth
             , width - (thickness *2)
             , innerLen ]
            , center = true
          );
      }   
   }

   translate( // hole for down pipe 
     [ -width
     , 0
     , pe  ]
   ) rotate( [ 0
             , 90
             , 0  ]
     ) cylinder( h = width
               , r = width /6 );
 }
 
 translate( // support plate
   [ -(( width /3) + (thickness /2))
   , (width /2) - thickness
   , - (innerLen /2) ]
 ) cube( 
     [ width /3 
     , thickness
     , innerLen  ]
   );
}



// eof
