include <CKvars.scad>;

CKp5(1); //small bearing holder



module CKp5(B){
    translate([-(p5wingW+p5bodyW+p5wingW)/2,0,0]){
    
        //bearing
if(B==1){
  translate([(p5wingW+p5bodyW+p5wingW)/2,p5bearingfromwall+(p5wiggleL/2),bearingholderSmallB2C])
  rotate([270,0,0])
  difference(){
    cylinder(d=bearingholderSmallBOD,h=bearingholderSmallBW, $fn=36);
    cylinder(d=bearingholderSmallBID,h=bearingholderSmallBW, $fn=36);
  }
  translate([(p5wingW+p5bodyW+p5wingW)/2,p5bodyL-p5bearingfromwall-bearingholderSmallBW-(p5wiggleL/2),bearingholderSmallB2C])
  rotate([270,0,0])
  difference(){
    cylinder(d=bearingholderSmallBOD,h=bearingholderSmallBW, $fn=36);
    cylinder(d=bearingholderSmallBID,h=bearingholderSmallBW, $fn=36);
  }
  
  //bolt
  translate([(p5wingW+p5bodyW+p5wingW)/2,0,bearingholderSmallB2C])
rotate([-90,0,0])
rotate([0,0,360/6/2])
CKbolt(p5boltD,p5boltL,p5boltHeadH,p5boltHeadOD);

  //bolt
  translate([(p5wingW+p5bodyW+p5wingW)/2,p5bodyL,bearingholderSmallB2C])
rotate([-90,0,0])
rotate([0,0,360/6/2])
CKnut(p5boltD,p5nutH,p5boltHeadOD);

  
} //end if
        
        //wing left
        difference(){
        cube([p5wingW,p5wingL,p5wingH]);
                //wing left holes
            translate([p5wingW/2,p5mounthole2front,0])
                cylinder(d=p5mountholeOD,h=p5wingH+0.1,$fn=36);
                translate([p5wingW/2,p5wingL-p5mounthole2back,0])
                cylinder(d=p5mountholeOD,h=p5wingH+0.1,$fn=36);
                    } //end wing left difference
                    
        //body
        translate([p5wingW,0,0]){
            difference(){
        cube([p5bodyW,p5bodyL,p5bodyH]);
        // bearing cutout 1
                translate([((p5bodyW)/2)-((bearingholderSmallBOD+p5wiggleW)/2),p5bearingfromwall,0])
            cube([bearingholderSmallBOD+p5wiggleW,bearingholderSmallBW+p5wiggleL,p5bodyH+0.1]);
        // bearing cutout 2        
                translate([((p5bodyW)/2)-((bearingholderSmallBOD+p5wiggleW)/2),p5bodyL-p5bearingfromwall-(bearingholderSmallBW+p5wiggleL),0])
            cube([bearingholderSmallBOD+p5wiggleW,bearingholderSmallBW+p5wiggleL,p5bodyH+0.1]);
        // bore hole cutout
        translate([(p5bodyW)/2,-0.1,bearingholderSmallB2C])
                rotate([270,0,0])
                cylinder(d=bearingholderSmallBID,h=p5bodyL+0.2,$fn=36);  
            } //end body difference
        } //end body translate
        
        //wing right
        translate([p5wingW+p5bodyW,0,0]){
            difference(){
        cube([p5wingW,p5wingL,p5wingH]);    
        //wing right holes
            translate([p5wingW/2,p5mounthole2front,0])
                cylinder(d=p5mountholeOD,h=p5wingH+0.1,$fn=36);
                translate([p5wingW/2,p5wingL-p5mounthole2back,0])
                cylinder(d=p5mountholeOD,h=p5wingH+0.1,$fn=36);
            } //end wing right difference
        } //end wing right translate            
    } //end main translate
} //end main module


module CKbolt(D,BL,HH,HSD){  
    cylinder(d=D,h=BL,$fn=32);

    fudge = 1/cos(180/(6));
   translate([0,0,-HH])
   rotate([0,0,360/6/2])         
   cylinder(h=HH,r=HSD/2*fudge,$fn=(6));
    }
    
module CKnut(BD,H,SD){ 

    fudge = 1/cos(180/(6));
   difference(){ 

   translate([0,0,0])
   rotate([0,0,360/6/2])         
   cylinder(h=H,r=SD/2*fudge,$fn=(6));

    cylinder(d=BD,h=H,$fn=32);
   }
    }    
    