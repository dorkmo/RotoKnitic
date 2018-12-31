include <CKvars.scad>;
use <CKp8--plateconnector.scad>
use <CKpM--mountain.scad>

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

translate([c3OD/2,0,0])
translate([-p3wallOD/2,0,-12])
rotate([0,0,90])
CKpM(0);

//translate([0,0,c3H])
//rotate([0,0,-90])
//CKp8();

echo((c3OD-c3ID)/2);

module CKc3(){
    
    
    rez=p2number*p2needles*2;  //calculate desired rezolution
    $fn=rez; //defines resolution of circles.
    
translate([c3OD/2,0,0]){     //[c3OD/2,0,0]       
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
    translate([-(((c2ID+(pMgroove*2)+(pMwallT*2))/2)*cos(90-(pMd1e-pMd0))),0,0])
      cube([((((c2ID+(pMgroove*2)+(pMwallT*2))/2)*cos(90-(pMd1e-pMd0)))*2),((c2ID+(pMgroove*2)+(pMwallT*2))/2),c3H]);

        
        //////
//mounting bolt holes
        rotate([0,0,90]){
            //1
translate([0,(cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)),0])
translate([-((((c2ID+(pMgroove*2)+(pMwallT*2))/2)*cos(90-(pMd1e-pMd0)))+(pMshelfX/2)),0,0])
  cylinder(d=pMshelfBoltD, h=pMH, $fn=36);
            //2
translate([0,(cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)),0])
translate([-((((c2ID+(pMgroove*2)+(pMwallT*2))/2)*cos(90-(pMd1e-pMd0)))+(pMshelfX/2)),0,0])
translate([0,(((((c2ID+(pMgroove*2)+(pMwallT*2))/2)/cos(pMd1e-pMd0))-((pMID/2)+(pMshelfBoltD)+pMgroove))/1.5),0])
  cylinder(d=pMshelfBoltD, h=pMH, $fn=36);  
                        
        mirror([1,0,0]){
            //1
translate([0,(cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)),0])
translate([-((((c2ID+(pMgroove*2)+(pMwallT*2))/2)*cos(90-(pMd1e-pMd0)))+(pMshelfX/2)),0,0])
  cylinder(d=pMshelfBoltD, h=pMH, $fn=36);
            //2
translate([0,(cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)),0])
translate([-((((c2ID+(pMgroove*2)+(pMwallT*2))/2)*cos(90-(pMd1e-pMd0)))+(pMshelfX/2)),0,0])
translate([0,(((((c2ID+(pMgroove*2)+(pMwallT*2))/2)/cos(pMd1e-pMd0))-((pMID/2)+(pMshelfBoltD)+pMgroove))/1.5),0])
  cylinder(d=pMshelfBoltD, h=pMH, $fn=36);        
        } //end mirror
    } //end rotate
//end of bolt holes
//////////////
    
       
        
        
        //makerbeam holes
        
        
    }  //end main difference


    
}  //end main translate

} //end CKc1 module