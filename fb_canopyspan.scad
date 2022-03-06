/// @file fb_canopyspan.scad
///
/// @brief platform canopy span
///
/// @author © Dave Harris 2022
/// 




include<fb_globals.scad>

use<mod_prism.scad>


canopySpan(
            Xpos = 0
            , Wplat = W_plat45
            , Wcenter = W_build
);



// a full width canopy span
//--------------------------

module canopySpan(
          , Xpos
          , Wplat
          , Wcenter
          , Wgully = 3
       )
{
  difference()
  {
    union()
    {
      translate( // cross member
        [ Xpos
        , - (W_plat45 /2)
        , H_canopy  ]
      ) cube(
         [ 2
         , W_plat45
         , 2.01 ] 
        );
      
      translate( // central pitch
        [ Xpos
        , -(Wcenter /2)
        , H_canopy +2 ] 
      ) rotate(
         [ 90
         , 0
         , 90  ]
        ) prism(
            h = 2
          , lLH = (Wcenter /2)
          , lRH = (Wcenter /2)
          , w = 2
         );

      translate( // offside pitch
        [ Xpos
        , (Wcenter /2) +Wgully
        , H_canopy +2 ] 
      ) rotate(
         [ 90
         , 0
         , 90  ]
        ) prism(
           h = 3
           , lLH =
          ((Wplat-Wcenter)/2) -Wgully
          , lRH = 0
          , w = 2
         );
      
      translate( // nearside pitch
        [ Xpos
        , -(Wplat /2)
        , H_canopy +2 ] 
      ) rotate(
         [ 90
         , 0
         , 90  ]
        ) prism(
          h = 3
          , lRH =
          ((Wplat-Wcenter)/2) -Wgully
          , lLH = 0
          , w = 2
         );
    } // end union
 
    translate( // hollow nearside
        [ Xpos -0.01
        , -(Wplat /2) +1
        , H_canopy +1 ] 
    ) rotate(
         [ 90
         , 0
         , 90  ]
      ) prism(
         h = 2.5
       , lRH =
        ((Wplat-Wcenter)/2) -Wgully -1
       , lLH = 0
       , w = 2.5
        ); 
  
    translate( // hollow offside
        [ Xpos -0.01
        , (Wcenter /2) +Wgully
        , H_canopy +1 ] 
    ) rotate(
         [ 90
         , 0
         , 90  ]
      ) prism(
         h = 2.5
       , lLH =
        ((Wplat-Wcenter)/2) -Wgully -1
       , lRH = 0
       , w = 2.5
       );
       
    translate( // hollow central
        [ Xpos -0.1
        , -(Wcenter /2)
        , H_canopy + 1 ] 
    ) rotate(
         [ 90
         , 0
         , 90  ]
      ) prism(
           h = 2
         , lLH = (Wcenter /2) 
         , lRH = (Wcenter /2)
         , w = 2.5
        );
        
    translate( // vert hole nearside
      [ Xpos +1
      , - (W_build /2) -1
      , H_canopy -1 ]
    ) cylinder(
         h = 3
       , r = 0.3 
      );

    translate( // vert hole offside
      [ Xpos +1
      , (W_build /2) +1
      , H_canopy -1 ]
    ) cylinder(
         h = 3
       , r = 0.3 
      );

    translate( // hollow nearside gully
      [ Xpos -1
      , - (W_build /2) -3
      , H_canopy +1.3 ]
    ) cube(
        [ 5
        , 3
        , 1.0  ] 
      );

    translate( // hollow offside gully
      [ Xpos -1
      , (W_build /2) 
      , H_canopy +1.3  ]
    ) cube(
        [ 5
        , 3
        , 1.0 ] 
      );
      
    translate( // light support
      [ Xpos -0.8
      , - (W_build /2) - 9
      , H_canopy -0.02  ]
    ) cube(
        [ 3 ,5, 0.6 ]
      );
    
    translate( // light support
      [ Xpos -0.8
      , (W_build /2) +4
      , H_canopy -0.02  ]
    ) cube(
        [ 3 ,5, 0.55 ]
      );
    
  } // end difference  
  
    translate( // central upright
      [ Xpos
      , -0.25
      , H_canopy  ]
    ) cube(
      [ 2
      , 0.5
      , 3.2 ] 
      );

    translate( //fill nearside accute
      [ Xpos 
      , - (Wcenter /2) -10
      , H_canopy +0.8 ]
    ) cube(
        [ 2, 7, 1.1 ]
      ); 
    translate( //fill nearside accute
      [ Xpos
      , - (Wcenter /2)
      , H_canopy +0.8 ]
    ) cube(
        [ 2, 2, 1.1 ]
      ); 
      
    translate( //fill offside accute
      [ Xpos
      , (Wcenter /2) -2
      , H_canopy +0.8 ]
    ) cube(
        [ 2, 2, 1.2 ]
      ); 
    translate( //fill offside accute
      [ Xpos
      , (Wcenter /2) +3
      , H_canopy +0.9  ]
    ) cube(
        [ 2, 7, 1.1  ]
      ); 

} // end module canopySpan


// eof
