/// @file fb_canopySpan2.scad
///
/// @brief platform canopy2 span
///
/// @author © Dave Harris 2022
/// 

include<fb_globals.scad>


// local test
 
canopySpan2(Wplat = W_plat45 -1 );


//wallSpan(85);

//stairSpan(Wplat = W_plat45);

//endFasia(Wplat = W_plat45);


color("blue") // constructlines
{
  {
    translate( // ends
      [ 0
      , W_plat45 /2
      , H_canopy /2 ]
    ) cube(
        [ W_pillar +0.1
        , 0.1
        , H_canopy ], center=true
      );
      
    translate( // ends
      [ 0
      , - W_plat45 /2
      , H_canopy /2 ]
    ) cube(
        [ W_pillar +0.1
        , 0.1
        , H_canopy ], center=true
      );
  }
  
  {
    translate( // lights
      [ 0
      , W_plat45/4
      , H_canopy/2  ]
    ) cube(
        [ W_pillar
        , 0.1
        , H_canopy ], center=true
      );

    translate( // lights
      [ 0
      , -W_plat45/4
      , H_canopy/2  ]
    ) cube(
        [ W_pillar
        , 0.1
        , H_canopy ], center=true
      );
  }

  { // W_build construction
    
    translate(
      [ 0
      , -(W_build /2)
      , H_canopy /2  ]
    ) cube(
        [ W_pillar +0.1
        , 0.1
        , H_canopy ], center=true
      );
    
    translate(
      [ 0
      , (W_build /2)
      , H_canopy /2  ]
    ) cube(
        [ W_pillar +0.1
        , 0.1
        , H_canopy ], center=true
      );
  }
}    


// a full width canopy2 span
//----------------------------

module canopySpan2(
          , Wplat
          , Wgully = 3
       )
{
  difference()
  {
    union()
    {
      translate( // center pillar
        [ 0
        , 0
        , H_door/2  ]
      ) cube(
          [ W_pillar
          , W_pillar
          , H_door ], center=true
        );
      
      { // offside
        translate( // upper
          [ -(W_pillar /2)
          , (Wplat /2) +1.03
          , H_canopy-W_pillar+0.13]
        ) rotate(
            [ 104
            , 0
            , 0  ]
          ) cube(
              [ W_pillar
              , W_pillar
              , 50 ]
            );
        
        translate( // lower
          [ - (W_pillar /2)
          , (Wplat /2) +1.32
          , H_canopy-W_pillar +0.2]
        ) rotate(
            [ 109
            , 0
            , 0  ]
          ) cube(
              [ W_pillar
              , W_pillar
              , 51 ]
            );
      }
      { // near side
        translate( // upper
          [ - (W_pillar /2) 
          , -(Wplat /2)
          , H_canopy  ]
        ) rotate(
            [ -104
            , 0
            , 0  ]
          ) cube(
              [ W_pillar
              , W_pillar
              , 50 ]
            );
        
        translate( // lower 
          [ - (W_pillar /2)
          , - (Wplat /2)
          , H_canopy ]
        ) rotate(
            [ -109
            , 0
            , 0  ]
          ) cube(
              [ W_pillar
              , W_pillar
              , 51 ]
            );
      }
      
      translate( // infill
        [ 0
        , 0
        , H_door +2.8  ]
      ) cube(
          [ W_pillar
          , 11
          , 4 ], center=true
        );
  
    } // end union

    translate( // mount hole
      [ 0
      , 0
      , -1  ]
    ) cylinder(
          r = 0.6
        , h = H_canopy
      );
    
    translate( // central gully
      [ 0
      , 0
      , 35.85  ]
    ) cube(
        [ 8
        , W_LEDstrip
        , 1  ], center=true
      );
    
    {
      translate( // support
        [ -4
        , (Wplat /4) +0.25
        , 34.85 ]
      ) cube(
          [ 8
          , W_LEDstrip
          , 2.5 ]
        );
  
      translate( // light guard
        [ -4
        , (Wplat/4)+W_LEDstrip+0.25
        , 34.85 ]
      ) cube(
          [ 8
          , 1
          , 4 ]
        );
    
      translate( // LED support
        [ -4
        ,-(Wplat/4)-W_LEDstrip-0.25
        , 34.85 ]
      ) cube(
          [ 8
          , W_LEDstrip
          , 2.6 ]
        );
      translate( // light guard
        [ -4
        ,-(Wplat/4)-W_LEDstrip-1.25
        , 34.85 ]
      ) cube(
          [ 8
          , 1
          , 4 ]
        );
    }
    
    { // wall gully
      translate( //
        [ -4
        , (W_build /2) +0.1
        , 38.5 ]
      ) cube(
          [ 9
          , Wgully
          , 2 ]
        );
      
      translate( // wall gully
        [ -4
        , -(W_build /2) -3.1
        , 38.5 ]
      ) cube(
          [ 9
          , Wgully
          , 2 ]
        );
    }

    {
      translate(
        [ -4
        , (Wplat/4) +10
        , 43.15  ]
      ) rotate(
          [ 0
          , 90
          , 0 ]
        ) cylinder(
            r = 0.6
           , h = 9
          );
        
      translate(
        [ -4
        , -(Wplat/4) -10
        , 43.15  ]
      ) rotate(
          [ 0
          , 90
          , 0 ]
        ) cylinder(
            r = 0.6
           , h = 9
          );

      translate(
        [ -4
        , 0
        , 30  ]
      ) rotate(
          [ 0
          , 90
          , 0 ]
        ) cylinder(
            r = 0.6
           , h = 9
          );          
    }
    
    { // remove surplus ends
      translate(
        [ -5
        , Wplat/2
        , 0  ]
      ) cube(
          [ 10
          , 10
          , H_canopy +5]
        );
      
      translate(
        [ -5
        , -Wplat/2 -10
        , 0  ]
      ) cube(
          [ 10
          , 10
          , H_canopy +5]
        );
    }
    
  } // end difference

} // end module canopySpan2


module stairSpan()
{
  difference() // stair span
  {
    translate(
      [ -2
      , 0
      , 0 ]
    ) canopySpan2(
          Wplat = W_plat45
        );
    
    translate(
      [ -6
      , -(W_plat45 /2)
      , -0.2  ]
    ) cube(
        [ 7
        , W_plat45
        , H_door +5 ]
      );
  }
} // end module stairSpan


module wallSpan(Xpos)
{
  difference() // stair span
  {
    translate(
      [ Xpos
      , 0
      , 0 ]
    ) canopySpan2(
          Wplat = W_plat45
        );
    
    translate( 
      [ Xpos -5
      , -(W_build /2) -0.11
      , -0.1  ]
    ) cube(
        [ 9
        , W_build +0.22
        , H_canopy ]
      );
  }

} // end module wallSpan



module endFasia(Wplat)
{
  difference()
  {
    union()
    {
      { // offside
        translate( // upper
          [ 0
          , (Wplat /2) +1.03
          , H_canopy-W_pillar+0.5]
        ) rotate(
            [ 104
            , 0
            , 0  ]
          ) cube(
              [ 0.5
              , W_pillar
              , 50 ]
            );
        
        translate( // lower
          [ 0
          , (Wplat /2) +1.32
          , H_canopy-W_pillar -0.5]
        ) rotate(
            [ 109
            , 0
            , 0  ]
          ) cube(
              [ 0.5
              , W_pillar
              , 51 ]
            );
      }
      { // near side
        translate( // upper
          [ 0 
          , -(Wplat /2)
          , H_canopy +0.5 ]
        ) rotate(
            [ -104
            , 0
            , 0  ]
          ) cube(
              [ 0.5
              , W_pillar
              , 50 ]
            );
        
        translate( // lower 
          [ 0
          , - (Wplat /2)
          , H_canopy -0.5 ]
        ) rotate(
            [ -109
            , 0
            , 0  ]
          ) cube(
              [ 0.5
              , W_pillar
              , 51 ]
            );
      }
      
      translate( // infill
        [ 0
        , -16
        , H_door +4.5  ]
      ) cube(
          [ 0.5
          , 32
          , 6 ]
        );
      
      translate( // infill
        [ 0
        , -8
        , H_door +1  ]
      ) cube(
          [ 0.5
          , 16
          , 6 ]
        );
    } // end union
    
    { // remove surplus ends
      translate(
        [ -5
        , Wplat/2
        , 0  ]
      ) cube(
          [ 10
          , 10
          , H_canopy +5]
        );
      
      translate(
        [ -5
        , -Wplat/2 -10
        , 0  ]
      ) cube(
          [ 10
          , 10
          , H_canopy +5]
        );
      translate(
        [ -1, -10, 0 ]
      ) cube(
          [ 4, 20, H_door ]
        );
    }
    
    
  } // end difference
}


// eof
