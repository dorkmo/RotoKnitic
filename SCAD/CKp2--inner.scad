include <CKvars.scad>;

CKp2();

module CKp2(){
    
    rez=360/p2number*2*2;
    
    $fn=rez; //defines resolution of circles.

    
    translate([p2OD/2,0,0]){
    difference(){    
    cylinder(h=p2H,d=p2OD);
    cylinder(h=p2H,d=p2ID);
    translate([-p2OD/2,-p2OD/2,0]){    
    cube([p2OD,p2OD/2,p2H]);
    }
    rotate([0,0,-360/p2number]){
    translate([-p2OD/2,0,0])    
    cube([p2OD,p2OD/2,p2H]);        
    }
    for(i=[1:p2needles]){
        rotate([0,0,(360/p2number/p2needles/2)-(360/p2number/p2needles*i)]){
        translate([-p2OD/2-0.2,-needleWidth/2,0])
   cube([p2needlegrooveDepth+0.2,needleWidth,p2H]);
        }
    }

        rotate([0,0,-360/p2number/p2needles]){
        translate([-p2OD/2-0.2,0,p2holeH])
            rotate([0,90,0]){
union(){
   cylinder(h=p2OD-p2ID+0.2, d=p2holeD);
                   translate([0,0,((p2OD-p2ID)/2)-p2holeCSL]){ 
   cylinder(h=p2holeCSL+2, d=p2holeCSD); 
                   }
                }  //end union
            }
        }
                
        rotate([0,0,-360/p2number/p2needles*(p2needles-1)]){
        translate([-p2OD/2-0.2,0,p2holeH])
            rotate([0,90,0]){
union(){
   cylinder(h=p2OD-p2ID+0.2, d=p2holeD);
                   translate([0,0,((p2OD-p2ID)/2)-p2holeCSL]){ 
   cylinder(h=p2holeCSL+2, d=p2holeCSD); 
                   }
                }  //end union
            }
        }           

echo(((((360/p2number/p2needles/2)/360*(p2OD*PI))-(needleWidth/2))/((360/p2number/p2needles/2)/360*(p2OD*PI)))*(360/p2number/p2needles/2));
        
firstcenter=(((((360/p2number/p2needles/2)/360*(p2OD*PI))-(needleWidth/2))/((360/p2number/p2needles/2)/360*(p2OD*PI)))*(360/p2number/p2needles/2))/2;        

        rotate([0,0,-firstcenter]){
        translate([-p2OD/2-0.2,0,p2holeH])
            rotate([0,90,0]){
                union(){
   cylinder(h=p2OD-p2ID+0.2, d=p2holeD);
                   translate([0,0,((p2OD-p2ID)/2)-p2holeCSL]){ 
   cylinder(h=p2holeCSL+2, d=p2holeCSD); 
                   }
                }  //end union
            }
        } 
        
        rotate([0,0,-360/p2number+firstcenter]){
        translate([-p2OD/2-0.2,0,p2holeH])
            rotate([0,90,0]){
union(){
   cylinder(h=p2OD-p2ID+0.2, d=p2holeD);
                   translate([0,0,((p2OD-p2ID)/2)-p2holeCSL]){ 
   cylinder(h=p2holeCSL+2, d=p2holeCSD); 
                   }
                }  //end union
            }
        } 
        
        
        
    }
}
    
    
} //end module