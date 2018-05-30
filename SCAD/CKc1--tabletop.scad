include <CKvars.scad>;

CKc1();

module CKc1(){
    
    rez=p2number*p2needles*2;  //calculate desired rezolution
    $fn=rez; //defines resolution of circles.
    
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
            {
            cube([p2needlegrooveDepth,needleWidth,p3wallH+0.02]);
                translate([0,needleWidth/2,0])
            cylinder(h=c1H+2,d=needleWidth,$fn=36);
                translate([p2needlegrooveDepth,needleWidth/2,0])
            cylinder(h=c1H+2,d=needleWidth,$fn=36);
        }
        }   //end rotate
    }   //end for
    
    //base mounting holes
    
        //inner holes
        for(i=[1:p3baseholenumber*p3number]){
            rotate([0,0,(((360/p3number/p3baseholenumber))/2)-((360/p3number/p3baseholenumber)*i)]){
            translate([-(p3baseID/2)-p3baseholefromODID,0,0])
                cylinder(h=c1H+2,d=p3baseholeD,$fn=18);
        }   //end rotate
    }   //end inner hole set for

        //outer holes
        for(i=[1:p3baseholenumber*p3number]){
            rotate([0,0,(((360/p3number/p3baseholenumber))/2)-((360/p3number/p3baseholenumber)*i)]){
            translate([-(p3baseOD/2)+p3baseholefromODID,0,0])
                cylinder(h=c1H+2,d=p3baseholeD,$fn=18);
            }   //end rotate
        }    //end outer hole set for   
        
    }  //end main difference
}  //end main translate

} //end CKc1 module