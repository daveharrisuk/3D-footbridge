/// @file fb_mod_RHstairs.scad
///
/// @brief footbridge mod RH stairs
///
/// @author © Dave Harris 2022
/// 

module fb_RHstairs
  (
      steps
    , rise
    , tread
    , width
  )
{
  for( step = [ 0 : 1 : steps ] ) 
  {
    x = (step * tread);
    y = (step * -rise) -rise;
      
    //echo("stairsRH x,y=",x,y);
      
    translate( // step
      [ x
      , y
      , 0 ]
    ) cube(
        [ tread
        , rise
        , width -0.5  ]
      ); 
      
    if(step % 3 == 0) // post hole
    {
        translate(
          [ x +1
          , y
          , width -0.6 ]
        ) cube(
            [ tread -1
            , rise
            , 0.6  ]
          );
        
      translate( // close hole
        [ x
        , y +rise -0.1
        , width -0.6 ]
      ) cube(
          [ 1.1
          , 0.1
          , 0.6 ]
        ); 
        
        translate( // side rail
          [ x
          , y -9
          , 0  ]
        ) cylinder(
              h = 1.1
            , r = 0.5
          );
    }
    else // no post hole
    {
      translate(
        [ x
        , y
        , width -0.6 ]
      ) cube(
          [ tread
          , rise
          , 0.6 ]
        ); 
    }
    
    if(step < steps) // no tab at top
    {
      translate(
        [ x +tread -0.1
        , y + rise -1
        , 0 ]
      ) cube(
          [ 1
          , 0
          , width -1.6 ]
        );
        
      translate(
        [ x + tread -0.001 
        , y + rise -1.9 
        , 0 ]
      ) cube(
          [ 1.1
          , 1.2
          , width - 1.6 ]
        );
      
      if(step % 4 == 2) // tab
      {
        translate(
          [ x +tread +0.1
          , y + rise -1.7
          , 0  ]
        ) cube(
            [ 1
            , 1
            , width +1.4  ]
          );
      }
    }
  } // end for loop
} // end module


// local test stairsRH

//stairsRH(steps=27, rise=1.75, tread=3.5, width=33);

// eof
