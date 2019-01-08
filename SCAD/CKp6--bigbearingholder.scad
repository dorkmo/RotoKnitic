include <CKvars.scad>;

//////////////////////
Depricating part - using p5 small bearing holder in place of p6
//////////////////////

CKp6(); //large bearing holder

module CKp6(){
    translate([-(p6wingW+p6bodyW+p6wingW)/2,0,0]){
    
        //wing left
        difference(){
        cube([p6wingW,p6wingL,p6wingH]);
                //wing right holes
            translate([p6mounthole2side,p6mounthole2front,0])
                cylinder(d=p6mountholeOD,h=p6wingH+0.1,$fn=36);
                    } //end wing left difference

        //body
        translate([p6wingW,0,0]){
            difference(){
        cube([p6bodyW,p6bodyL,p6bodyH]);
        // bearing cutout 1
                translate([((p6bodyW)/2)-((bearingholderSmallBOD+p6wiggleW)/2),p6bearingfromwall,0])
            cube([bearingholderSmallBOD+p6wiggleW,bearingholderSmallBW+p6wiggleL,p6bodyH+0.1]);
        // bearing cutout 2        
                translate([((p6bodyW)/2)-((bearingholderSmallBOD+p6wiggleW)/2),p6bodyL-p6bearingfromwall-(bearingholderSmallBW+p6wiggleL),0])
            cube([bearingholderSmallBOD+p6wiggleW,bearingholderSmallBW+p6wiggleL,p6bodyH+0.1]);
        // bore hole cutout
        translate([(p6bodyW)/2,-0.1,bearingholderSmallB2C])
                rotate([270,0,0])
                cylinder(d=bearingholderSmallBID,h=p6bodyL+0.2,$fn=36);  
            } //end body difference
        } //end body translate
        
        //wing right
        translate([p6wingW+p6bodyW,0,0]){
            difference(){
        cube([p6wingW,p6wingL,p6wingH]);    
        //wing right holes
            translate([p6wingW-p6mounthole2side,p6mounthole2front,0])
                cylinder(d=p6mountholeOD,h=p6wingH+0.1,$fn=36);
            } //end wing right difference
        } //end wing right translate            
    } //end main translate
} //end main module