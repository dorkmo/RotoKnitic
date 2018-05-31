include <CKvars.scad>;

CKp7(); //small bearing holder

module CKp7(){
    translate([-p7baseW/2,0,0]){
        difference(){
        union(){
    cube([p7baseW,p7baseL,p7baseH]);
   
        translate([0,(p7baseL/2)-(p7wallW/2),0])
        cube([p7baseW,p7wallW,bearingholderZB2C+(p7mountH/2)]);
        
        translate([0,(p7baseL/2)+(p7wallW/2)-p7mountL,bearingholderZB2C-(p7mountH/2)])
        cube([p7baseW,p7mountL,p7mountH]);
        } //end main union
        //bore hole
                translate([(p7baseW)/2,((p7baseL/2)+(p7wallW/2)-p7mountL)-0.1,bearingholderZB2C])
                rotate([270,0,0])
                cylinder(d=bearingholderZBID,h=p7mountL+0.2,$fn=36);
//bearing cutout
        
    
    } //end main difference
    } //end main translate
} //end main module
