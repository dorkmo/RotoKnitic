include <CKvars.scad>;

CKp7(1); //small bearing holder

module CKp7(B){
    translate([-p7baseW/2,0,0]){
        difference(){
        union(){
    cube([p7baseW,p7baseL,p7baseH]);
   
        translate([0,(p7baseL/2)-(p7wallW/2),0])
        cube([p7baseW,p7wallW,bearingholderZB2C+(p7mountH/2)]);
        
        translate([0,(p7baseL/2)-(p7wallW/2)-p7mountL,bearingholderZB2C-(p7mountH/2)])
        cube([p7baseW,p7mountL,p7mountH]);
            
            //diagnal brace
            translate([0,((p7baseL-p7wallW)/2)+p7wallW,p7baseH]){
         difference(){   
         cube([p7baseW,(p7baseL-p7wallW)/2,bearingholderZB2C*2/3]);
             translate([0,(p7baseL-p7wallW)/2,0])
         rotate([1/tan(((bearingholderZB2C*2/3))/((p7baseL-p7wallW)/2)),0,0])
         cube([p7baseW,bearingholderZB2C*2,bearingholderZB2C*2]);    
         } //end brace translate
         } //end brace difference
        } //end main union
        
        //bore hole
                translate([(p7baseW)/2,((p7baseL/2)-(p7wallW/2)-p7mountL)-0.1,bearingholderZB2C])
                rotate([270,0,0])
                cylinder(d=bearingholderZBID,h=p7mountL+p7wallW+0.2,$fn=36);
        
//bearing cutout       
                translate([((p7baseW)/2)-((bearingholderZBOD+p7wiggleW)/2),(p7baseL/2)-(p7wallW/2)-p7mountL+p7bearingfromfront,bearingholderZB2C-(p7mountH/2)-0.1])
            cube([bearingholderZBOD+p7wiggleW,bearingholderZBW+p7wiggleL,p7mountH+0.2]);
       
        
        ////mount holes
        
        // hole 1
            translate([p7mounthole2edge,p7mounthole2edge,0])
            cylinder(d=p7mountholeOD,h=p7baseH+0.1,$fn=36);        
        // hole 2
            translate([p7baseW-p7mounthole2edge,p7mounthole2edge,0])
            cylinder(d=p7mountholeOD,h=p7baseH+0.1,$fn=36);
        // hole 3
            translate([p7baseW/2,p7baseL-p7mounthole2edge,0])
                cylinder(d=p7mountholeOD,h=p7baseH+0.1,$fn=36);      
            translate([p7baseW/2,p7baseL-p7mounthole2edge,p7baseH])
                cylinder(d=p7mountholeHeadOD,h=bearingholderZB2C+(p7mountH/2),$fn=36);      

    
    } //end main difference
    
                    //bearing
if(B==1){
  translate([p7baseW/2,p7bearingfromfront+(p7wiggleL/2),bearingholderZB2C])
  rotate([270,0,0])
  difference(){
    cylinder(d=bearingholderSmallBOD,h=bearingholderSmallBW, $fn=36);
    cylinder(d=bearingholderSmallBID,h=bearingholderSmallBW, $fn=36);
  }
} //end if
    } //end main translate
} //end main module
