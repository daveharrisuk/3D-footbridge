/// @file fb_mod_RHwall.scad

/// @author © Dave Harris 2022

/// @brief footbridge mod RH wall
///
/// 
/// drawn in the -Y plane
///

include <fb_globals.scad>;

include <fb_mod_RHstairs.scad>;

include <mod_prism.scad>;
include <mod_window.scad>;
include <mod_gutter.scad>;


module fb_RHwall()
{
    
// stair wall
//------------------------

difference() // lower stair wall
{
  translate(
    [ 0
    , - H_bridge
    , 0 ]
  ) cube( // wall
      [ L_stairs
      , H_bridge
      , 1.01  ]
    );

    window( // # 1
          x = 59
        , y = -25 //23
        , w = W_window
        , h = H_window
    );
    
    window( // # 2
          x = 62 + W_window
        , y = -25 //23
        , w = W_window
        , h = H_window
    );
    
    window( // #3
          x = 3
        , y = -H_door -9
        , w = W_window
        , h = H_window
    );
    
    translate( // canopy support #1
      [ 3
      , -41
      , -2  ]
    ) cylinder( h = 4, r = 0.5 );
    echo("support#1=", 4 );

    translate( // canopy support #2
      [ L_build/2 +1
      , -41
      , -2  ]
    ) cylinder( h = 4, r = 0.5 );
    echo("support#2=", L_build/2 +1 );
}

translate(
  [ 0, -1, 0 ]
) cube( // floor level strength
    [ L_stairs +0.01
    , 1
    , 2  ]
  );

difference() // upper stair wall
{
    translate( // wall
      [ 0
      , -H_bridge
      , 1  ]
    ) prism( 
            lLH = L_stairs
          , lRH = 0
          , w   = -1.0
          , h   = -54
      );
    
   window( // # 1
          x = 35
        , y = -H_bridge -7
        , w = W_window
        , h = H_window
    );

   window( // # 2
          x = 68
        , y = -H_bridge -25
        , w = W_window
        , h = H_window
    );
    
//    translate(
//     [ 68
//     , -H_bridge - 19
//     , 0.5  ]
//     ) cube([9,9,9]);
}

//window( // # 1
//      x = 68
//    , y = -H_bridge -19
//    , w = W_window
//    , h = H_window
//);

translate( // infill under bridge
  [ L_stairs -0.1
  , -H_bridge +1
  , 0  ]
) cube(
    [ W_bridge +0.1
    , H_bridge - H_door -5
    , 1.1 ]
  );

translate( // infill over bridge
  [ L_stairs -0.01
  , -H_bridge - H_walk -20
  , 0  ]
) cube(
    [ W_bridge 
    , 20
    , 1.01 ]
  );

translate( // strength infill lo
  [ L_stairs -0.1
  , -H_bridge - H_walk -1
  , 0 ]
) cube(
    [ W_bridge + W_lift +0.1
    , 1
    , 2 ]
  );

translate( // strength infill lo
  [ L_stairs -0.01
  , -H_door -6.5 
  , 0 ]
) cube(
    [ W_bridge +0.1
    , 1
    , 2 ]
  );

translate( // strength infill hi
  [ L_stairs -0.01
  , -H_bridge - H_walk -20
  , 0 ]
) cube(
    [ W_bridge +0.01
    , 1
    , 2 ]
  );


// lift walls
//---------------

difference()
{
    translate(  // lift wall
      [ W_bridge + L_stairs
      , -H_bridge - H_walk
      , 0  ]
    ) cube(
      [ W_bridge +00
      , H_bridge + H_walk +0.01
      , 1.01 ]
    );
    
    translate( // canopy support #3
      [ L_build -3
      , -41
      , -1  ]
    ) cylinder( h = 4, r = 0.5 );
    
    echo("support#3=", L_build -2 );
    
    translate( // maint door
      [ L_stairs + W_bridge + 10
      , -H_door +2
      , -1  ]
    ) cube(
        [ 12
        , H_door - 4
        , 3  ]
      );    
}

translate( // lift LH wing wall
  [ L_stairs -1
  , -H_door -6
  , 0  ]
) cube(
    [ 7
    , H_door +6
    , 1.1  ]
);

translate( // lift RH wing wall
  [ L_stairs + W_bridge - 9
  , -H_door -6
  , 0  ]
) cube(
    [ 10
    , H_door +6
    , 1.1  ]
);

translate( // floor strength
  [ L_stairs + W_bridge +1
  , -1
  , 0  ]
) cube(
    [ 35
    , 1
    , 2 ]
  );

difference() // inner lower lift wall
{
  translate(
    [ W_bridge + L_stairs +1
    , -H_bridge +1 
    , 0 ]
  ) cube(
      [ 1.2
      , H_bridge -1
      , W_stairs/2 +1  ]
    );

  translate( // punch lift door
    [ W_bridge + L_stairs
    , -H_door +0.01
    , 10  ]
  ) cube(
      [ 3
      , H_door
      , 10  ]
    );

  translate( // punch wire hole
    [ W_bridge + L_stairs
    , - H_bridge  +1.5
    , W_stairs/2 -3   ]
  ) cube(
      [ 3
      , 4.5
      , 5   ]
    );
}

color("red")
{
    translate( // lift door Hi
      [ W_bridge + L_stairs +2
      , -H_bridge - H_walk +7.2
      , 0.01  ]
    ) cube(
        [ 0.8
        , H_door +2
        , W_stairs/2 +0.95  ]
      );
}

difference() // inner upper lift wall 
{
  translate( // wall
    [ W_bridge + L_stairs +1
    , -H_bridge - H_walk -1
    , 0 ]
  ) cube(
      [ 1.01
      , H_walk +1
      , W_stairs/2 +1  ]
    );

  translate( // punch lift door
    [ W_bridge + L_stairs
    , -H_bridge - H_walk +8.01
    , 10  ]
  ) cube(
      [ 3
      , H_door
      , 10 ]
    );
}

difference() // end lift wall
{
  translate(
    [ W_bridge + L_stairs + W_lift +1
    , -H_bridge - H_walk
    , 0  ]
  ) cube(
      [ 1
      , H_bridge + H_walk 
      , W_stairs/2 +1  ]
  );
    
  // lower window
  translate( // rebate
    [ L_stairs + W_bridge + W_lift
    , -W_window -15
    , W_stairs/2 - H_window/2 +1  ]
  ) cube(
     [ 1.5
     , W_window +2
     , H_window +2  ]
    );
    
  translate( // punch opening
    [ W_bridge + L_stairs + W_lift
    , -W_window -14
    , W_stairs/2 - H_window/2 +2  ]
  ) cube( // vertical
      [ 3
      , W_window
      , H_window  ]
    );

  // upper window
  translate( // rebate
    [ W_bridge + L_stairs + W_lift
    , -H_bridge -W_window -15
    , 1+ W_stairs/2 - H_window/2  ]
  ) cube(
     [ 1.5
     , W_window +2
     , H_window +2  ]
    );
    
  translate( // opening
    [ W_bridge + L_stairs + W_lift
    , -H_bridge -W_window -14
    , W_stairs/2 - H_window/2 +2  ]
  ) cube( // vertical opening
      [ 3
      , W_window
      , H_window  ]
    );
}


translate( // end wall lo tab spacer
  [ W_bridge + L_stairs + W_lift 
  , -1
  , 0  ]
) cube(
    [ 1.1
    , 1
    , W_stairs/2 ]
  );

translate( // lift wall lo tab spacer
  [ W_bridge + L_stairs +3
  , -1
  , 0  ]
) cube(
    [ 1.1
    , 1
    , W_stairs/2  ]
  );

color("red")
{
    translate( // lower lift door
      [ W_bridge + L_stairs +2.1
      , -H_door -1
      , 0.01  ]
    ) cube(
        [ 1
        , H_door +1
        , W_stairs/2 + 0.95 ]
      );
}
//translate( // lower lift tab spacer
//  [ W_bridge + L_stairs +2.5
//  , -1
//  , 0  ]
//) cube(
//    [ 1.7
//    , 1.1
//    , W_stairs/2  ]
//  );
  

translate( // filt floor
  [ W_bridge + L_stairs +9
  , -H_bridge +1
  , 0  ]
) cube(
    [ 27
    , 1
    , W_stairs/2 + 1  ]
  );
  

translate( // upper end wall tab spacer
  [ W_bridge + L_stairs + W_lift -0.1
  , -85.55
  , 0  ]
) cube(
    [ 1.2
    , 1.2
    , W_stairs/2 -0.1  ]
  );

translate( // RH upper wall
  [ W_bridge +L_stairs
  , -H_bridge - H_walk
  , 1  ]
) prism(
         lLH = 0
       , lRH= 36
       , h  = -18
       , w  = -1
  );


// first floor supports
//------------------------

translate( // sub floor - top of stairs
  [ L_stairs -0.1
  , -H_bridge +1
  , 0 ]
) cube(
    [ 2
    , 0.75
    , W_stairs/2 +1  ]
  );
  
translate( // sub floor - bridge
  [ L_stairs -0.01
  , -H_bridge +1
  , 0  ]
) cube(
    [ W_bridge + W_lift +2
    , 1
    , 4 ]
  );


// stairs
//-------------

translate(
  [ 0, -H_bridge
  , 0  ]
) cube(  // stair entrance pilar
    [ 2
    , H_bridge
    , 2  ]
);

color("red")
{
    translate( // stairs
      [ 0
      , 0
      , 1  ]
    ) fb_RHstairs(
          steps = Steps
        , rise  = H_rise
        , tread = L_tread
        , width = W_stairs/2
      );
}

translate( // pillar LH of bridge
  [ L_stairs -2
  , - H_bridge - H_walk -16.1
  , 0  ]
) cube(
    [ 2
    , H_bridge + H_walk +16.1
    , 2  ]
  );
   
translate( // pillar RH of bridge
  [ L_stairs + W_bridge
  , -H_bridge - H_walk -17
  , 0  ]
) cube(
    [ 2
    , H_bridge + H_walk +17
    , 2  ]
  );
   
translate( // seat
  [ 55.01
  , -5
  , 0  ]
) cube(
    [ 39
    , 0.7
    , 8  ]
  );
  
translate( // under stair wall
  [ 55
  , -H_door
  , 0 ]
) cube(
    [ 1
    , H_door
    , W_stairs/2 +1 ]
  );



// sundries
//------------

translate( // mid vertical strength 
  [ 52.5
  , -H_bridge -H_door 
  , 0  ]
) cube(
    [ 1
    , 52
    , 2  ]
  );
  
translate( // roofover stairs
  [ 52.5
  , -78.43
  , 0  ]
) prism( 
        lLH = 2
      , lRH = 0
      , w   = W_stairs/2 +1
      , h   = -1.1
  );
  
translate( // mid roof
  [ 52.5
  , -78.43
  , 0  ]
) cube(
    [ 2
    , 2.001
    , W_stairs/2 +1 ]
  );
  
translate( // mid light support 
  [ 54.5
  , -76.44
  , 0  ]
) prism(
        lLH = -2
      , lRH = 0
      , w   = W_stairs/2 +1
      , h   = 1.099
  );


// Lintels
//-----------

translate( // over lift wall
  [ L_stairs + W_bridge -2
  , -H_bridge - H_walk -20
  , 0 ]
) cube(
    [ 2
    , 5
    , W_stairs/2 +1  ]
  );

translate(
  [ L_stairs + W_bridge -0.01
  , -H_bridge - H_walk -16
  , 0  ]
) prism( // over lift wall
         lLH = 0
       , lRH = 4
       , w   = W_stairs/2 +1
       , h   = -2
  );
    
translate( // over stairs
  [ L_stairs -3.6
  , -H_bridge - H_walk -16.01
  , 0  ]
) prism( 
        lLH = 3.6
      , lRH = 0
      , w   = W_stairs/2 +1
      , h   = -1.99
  );

translate(  // over lift end wall
  [ L_stairs + W_bridge + W_lift -0.1
  , -H_bridge - H_walk
  , 0  ]
) prism(
        lLH = 0
      , lRH = 2.1
      , w   = W_stairs/2 +1
      , h   = -1.05
  );

translate( // tab fill top lift
  [ L_stairs + W_bridge -0.1
  , -H_bridge - H_walk -16
  , 0  ]
) cube(
    [ 4
    , 1.045
    , W_stairs/2  ]
  );

translate( // over top stairs
  [ L_stairs -3.57
  , -H_bridge - H_walk -16 -0.02
  , 0 ]
) cube(
    [ 4
    , 1.025
    , W_stairs/2 ]
  );

translate( // over top stairs
  [ L_stairs
  , -H_bridge - H_walk -20
  , 0  ]
) cube(
    [ 2
    , 5
    , W_stairs/2 +1  ]
  );

translate( // tab spacer top stairs
  [ 0.9
  , -H_bridge -0.01
  , 0 ]
) cube(
    [ 2.1
    , 1.2
    , W_stairs/2   ]
  );

translate( // over bottom stairs
  [ 0
  , -H_bridge
  , 0  ]
) cube(
    [ 1
    , 17
    , W_stairs/2 +1  ]
  );

translate( // slope over bottom stairs
  [ 0
  , -H_bridge 
  , 0  ]
) prism(
         lLH = 3
       , lRH = 0
       , w   = W_stairs/2 +1
       , h   = -1.65
  );

translate( // gutter over stairs
  [ -1.6
  , -H_bridge +0.5
  , 0  ]
) rotate(
      [ 180
      , 180
      , -90 ]
    )
    gutter( W_stairs/2 +1 );
    
translate( // gutter fixing
  [ -0.25
  , -H_bridge +0.55
  , 1  ]
) cube(
    [ 0.5
    , 0.5
    , W_stairs/2 ]
  );

translate( // gutter over lift
  [ L_stairs + W_bridge + W_lift +3.6
  , -84.5
  , 0  ]
) rotate(
      [ 180
      , 180
      , -90 ]
    )
    gutter( W_stairs/2 +1 );
    
translate( // gutter fixing
  [ L_stairs + W_bridge + W_lift +1.8
  , -84.4
  , 1  ]
) cube(
    [ 0.5
    , 0.5
    , W_stairs/2 ]
  );

 
} // end module fb_mod_RHwall

// eof
