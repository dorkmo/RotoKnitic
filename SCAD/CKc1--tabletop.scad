include <CKvars.scad>;

CKc1();

module CKc1(){
    
    rez=p2number*p2needles*2;

    $fn=rez; //defines resolution of circles.

    centerlineD=p2ID+(p2W+(p3wiggle*2));
    
    
    translate([c1OD/2,0,0]){
        
    
    difference(){  
        union(){
    cylinder(h=c1H,d=c1OD);
        } //end main union
        
    cylinder(h=c1H+2,d=p3baseID);  // donut hole
 
    //base needle holes
    ////should these be circles instead? easier to cut? slot with rounded ends?
    
    for(i=[1:p2needles*p2number]){
        rotate([0,0,(360/p2number/p2needles/2)-(360/p2number/p2needles*i)]){
        translate([-p2OD/2,-needleWidth/2,-0.01])
   cube([p2needlegrooveDepth,needleWidth,p3wallH+0.02]);
        }
    }
    
    //base mounting holes
    
        for(i=[1:p3baseholenumber*p3number]){
        rotate([0,0,(((360/p3number/p3baseholenumber))/2)-((360/p3number/p3baseholenumber)*i)]){
        translate([-(p3baseID/2)-p3baseholefromODID,0,0])
   cylinder(h=p3baseH,d=p3baseholeD,$fn=18);
        }
    }

        for(i=[1:p3baseholenumber*p3number]){
        rotate([0,0,(((360/p3number/p3baseholenumber))/2)-((360/p3number/p3baseholenumber)*i)]){
        translate([-(p3baseOD/2)+p3baseholefromODID,0,0])
   cylinder(h=p3baseH,d=p3baseholeD,$fn=18);
        }
    }    
    

    

        
    }  //end main difference
}  //end main translate
    
    
} //end module