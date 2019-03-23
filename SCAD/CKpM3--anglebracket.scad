include <CKvars.scad>;

CKpM3();

module CKpM3(){

difference(){
minkowski(){
difference(){
translate([-aaT,-aaT,0])
  cube([(aaboltD*3)+aaX,aaX,pM3H]);  //cube 
  cube([(aaboltD*3)+aaX-aaT,aaX-aaT,pM3H]);
}
cylinder(d=pM3mink, h=0.01, $fn=18);  //,h=0.01  $fn=72
} //end mink
translate([-aaT/3,-aaT/3,0])
  cube([(aaboltD*3)+aaX+pM3mink,aaX+pM3mink,pM3H]);  //cube 
translate([0,0,pM3H-0.011])
  minkowski(){
    difference(){
    translate([-aaT,-aaT,0])
      cube([(aaboltD*3)+aaX,aaX,pM3H]);  //cube 
      cube([(aaboltD*3)+aaX-aaT,aaX-aaT,pM3H]);
}
    cylinder(d=pM3mink, h=0.01, $fn=18);  //,h=0.01  $fn=72
} //end mink

difference(){
  translate([-aaT,-aaT,0])
    cube([aaX+pM3slop/2,aaX+pM3slop/2,pM3H]);  //cube 
}
 translate([-(-(aaX-aaT)-(aaboltD/2)-1),0,pM3c2e])  
 rotate([90,0,0])
   cylinder(d=aaboltD,h=aaX,$fn=36);
 translate([-(-(aaX-aaT)-(aaboltD/2)-1),0,pM3c2e+pM3c2c])  
 rotate([90,0,0])
   cylinder(d=aaboltD,h=aaX,$fn=36);
} //end diff
} //end module