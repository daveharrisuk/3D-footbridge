/// @file mod_prism.scad
///
/// @author © Dave Harris 2022
///

// points   1        ^
//        / | \      |
//       /  4  \     h
//      /  / \  \    |
//     0--/---\--2   v
//   w | /     \ | 
//     3---------5
//     <lLH><lRH>


module prism(h=20, lLH=15, lRH=25, w=1)
{
 polyhedron(
  points=[
   [0, 0, 0]       // 0 back LH corner
  ,[lLH, h, 0]     // 1 back peak
  ,[lLH+lRH, 0, 0] // 2 back RH corner
  ,[0, 0, w]       // 3 front LH corner
  ,[lLH, h, w]     // 4 front peak
  ,[lLH+lRH, 0, w] // 5 front RH corner
  ]
  , faces=[
    [0, 3, 5, 2] // bottom
   ,[0, 1, 4, 3] // LH ramp
   ,[1, 2, 5, 4] // RH ramp 
   ,[2, 1, 0]    // back wall
   ,[3, 4, 5]    // front wall
   ]
 );
} // end of module prism()

// local test prism
prism(lLH=1, lRH= 22, h=18, w=1 );

// eof
