include <CKvars.scad>;
use <CKp8--plateconnector.scad>

//////
//TODO
//
//*spacer mount holes should be further out from ID
//*mounting holes for mountain tabs
//*test place mountain for fit
//*openbeam holes
//
//////

CKc3();

//translate([0,0,c3H])
//rotate([0,0,-90])
//CKp8();

echo((c3OD-c3ID)/2);

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
                translate([0,(pMID/2)+(pMgroove)+1+(p8baseL/2),0]){          
                        translate([0,p8holeC2C/2,-0.1])
                            cylinder(d=p8holeD,h=pPspace2+0.2,$fn=36);
                        translate([0,-(p8holeC2C/2),-0.1])
                            cylinder(d=p8holeD,h=pPspace2+0.2,$fn=36);
                } //end translate to ring
            } //end rotate i
        } //end for
        
        //mountain cutout
        rotate([0,0,90])
        #difference(){
        translate([0,(c2ID+(pMgroove*2)+(pMwallT*2))/4,c3H/2])
        cube([c2ID+(pMgroove*2)+(pMwallT*2),(c2ID+(pMgroove*2)+(pMwallT*2))/2,c3H], center=true);
        //main ID cut

        rotate([0,0,(pMd7+pMd6+pMd5-pMd55+pMd4+pMd3+pMd2+pMd1-pMd0)])
        mirror([1,0,0])
        cube([pMID*4,pMID*4,c3H]);
        mirror([1,0,0])
        rotate([0,0,(pMd7+pMd6+pMd5-pMd55+pMd4+pMd3+pMd2+pMd1-pMd0)])
        mirror([1,0,0])
        cube([pMID*4,pMID*4,c3H]);
        }
        
        
        
        //makerbeam holes
        
        
    }  //end main difference
/*
        rotate([0,0,90])
        #difference(){
        translate([0,(c2ID+(pMgroove*2)+(pMwallT*2))/4,c3H/2])
        cube([c2ID+(pMgroove*2)+(pMwallT*2),(c2ID+(pMgroove*2)+(pMwallT*2))/2,c3H], center=true);
        //main ID cut

        rotate([0,0,(pMd7+pMd6+pMd5-pMd55+pMd4+pMd3+pMd2+pMd1-pMd0)])
        mirror([1,0,0])
        cube([pMID*4,pMID*4,c3H]);
        mirror([1,0,0])
        rotate([0,0,(pMd7+pMd6+pMd5-pMd55+pMd4+pMd3+pMd2+pMd1-pMd0)])
        mirror([1,0,0])
        cube([pMID*4,pMID*4,c3H]);
        }
*/

    
}  //end main translate

} //end CKc1 module