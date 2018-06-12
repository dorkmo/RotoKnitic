include <CKvars.scad>;

CKc3();

module CKc3(){
    
    
    rez=p2number*p2needles*2;  //calculate desired rezolution
    $fn=rez; //defines resolution of circles.
    
translate([c3OD/2,0,0]){            
    difference(){  
        
        union(){
            cylinder(h=c3H,d=c3OD);
        } //end main union
        
        cylinder(h=c3H+2,d=c3ID);  // donut hole
 
        //plate connector holes
        for(i=[1:c2connectors]){
            rotate([0,0,((360/c2connectors)*i)]){
        translate([0,(CKpMID/2)+(pMgroove),0]){
            translate([-p8baseW/2,0,0]){

            translate([p8baseW/2,p8holeend2C,-0.1])
            cylinder(d=p8holeD,h=pPspace2+0.2,$fn=36);

            translate([p8baseW/2,p8baseL-p8holeend2C,-0.1])
            #cylinder(d=p8holeD,h=pPspace2+0.2,$fn=36);
            } //end hole translate
        } //end translate to ring
    } //end rotate i
} //end for
        
        //mountain cutout
        
        //makerbeam holes
        
        
    }  //end main difference
}  //end main translate

} //end CKc1 module