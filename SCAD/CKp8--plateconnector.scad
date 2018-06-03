include <CKvars.scad>;

CKp8(); //small bearing holder

module CKp8(){
    translate([-p8baseW/2,0,0]){
        difference(){
            
            cube([p8baseW,p8baseL,pPspace2]);
            
            translate([p8baseW/2,p8holeend2C,-0.1])
            cylinder(d=p8holeD,h=pPspace2+0.2,$fn=36);

            translate([p8baseW/2,p8baseL-p8holeend2C,-0.1])
            cylinder(d=p8holeD,h=pPspace2+0.2,$fn=36);
            
        } //end main difference
    } //end translate
} //end main module
