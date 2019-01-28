include <CKvars.scad>;

CKp9(); //small bearing holder

module CKp9(){
    
    rez=p2number*p2needles*2;
    
    $fn=rez;
    
    translate([-(p3wallID+(p3upperwallW*2))/2,0,0]){
        

        
        difference(){

            cylinder(h=p9H,d=p3wallID+(p3upperwallW*2)+(p9thickness*2));            
            cylinder(h=p9H,d=p3wallID+(p3upperwallW*2));

          //first and last holes
        rotate([0,0,-(360/p2number/p2needles)*2]){
        translate([0,0,p9H/2])
            rotate([0,90,0]){
                cylinder(h=(p3wallID+(p3upperwallW*2))+1, d=p2holeD, $fn=18);
            }
        } 
        
        rotate([0,0,((360/p2number/p2needles)*2)]){
        translate([0,0,p9H/2])
            rotate([0,90,0]){

                cylinder(h=(p3wallID+(p3upperwallW*2))+1, d=p2holeD, $fn=18);
            }
        } 
     //end first and last holes
        
       //outer holes
                 rotate([0,0,(-360/p2number/p2needles)]){
                translate([0,0,p9H/2])
            rotate([0,90,0]){

                cylinder(h=(p3wallID+(p3upperwallW*2))+1, d=p2holeD, $fn=18);
            }
        } 
        
                         rotate([0,0,(360/p2number/p2needles)]){
                translate([0,0,p9H/2])
            rotate([0,90,0]){

                cylinder(h=(p3wallID+(p3upperwallW*2))+1, d=p2holeD, $fn=18);
            }
        } 

//end outer holes        
        
        // cut off ends
        
                 rotate([0,0,-((-360/p2number/p2needles)+(1.4*-360/p2number/p2needles))]){
                     cube([(p3wallOD+p9thickness)*2,(p3wallOD+p9thickness)*2,(p3wallOD+p9thickness)*2]);
                 }
                 
                 rotate([0,0,((-360/p2number/p2needles)+(1.4*-360/p2number/p2needles))]){
                     translate([0,-((p3wallOD+p9thickness)*2),0])
                     cube([(p3wallOD+p9thickness)*2,(p3wallOD+p9thickness)*2,(p3wallOD+p9thickness)*2]);
                 }
                 
                 translate([-((p3wallOD+p9thickness)*2),-((p3wallOD+p9thickness)*2)/2,0])
                 #cube([(p3wallOD+p9thickness)*2,(p3wallOD+p9thickness)*2,(p3wallOD+p9thickness)*2]);
        
        
        } //end main difference
    } //end translate
} //end main module
