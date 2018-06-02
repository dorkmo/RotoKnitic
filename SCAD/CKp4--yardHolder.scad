include <CKvars.scad>;

CKp4();

module CKp4(){
    
    rez=p2number*p2needles*2;
    
    $fn=rez; //defines resolution of circles.
       
    translate([p4baseOD/2,0,0]){
        
    difference(){  
        union(){
    cylinder(h=p4baseH,d=p4baseOD-(p4basegapW*2)-((p4baseW-p4basegapW)/2*2));            
            
            //ramps
            for(i=[1:p2needles*(p2number/p4number)]){
        rotate([0,0,(360/p2number/p2needles)-(360/p2number/p2needles*i)-(((360/p2number/p2needles))/2)]){        
            
            difference(){
            union(){
            translate([-p4baseOD/2+p4rampfromOD,p4rampW/2,p4rampH+p4baseH-(p4rampC1/2)])
            rotate([90,0,0])
            cylinder(h=p4rampW,d=p4rampC1);
            
            intersection(){
            translate([-10,0,3.82])
            translate([-p4baseOD/2+p4rampfromOD,p4rampW/2,p4rampH+p4baseH-(p4rampC2/2)])
            rotate([90,0,0])
            cylinder(h=p4rampW,d=p4rampC2);
                
                            translate([-7,0,-2.86/2])
            translate([-p4baseOD/2+p4rampfromOD,p4rampW/2,p4rampH+p4baseH-(p4rampC2/2)])
            cube([p4rampC2,p4rampC2,p4rampC2],center=true);
            
            }
        }//end union
        
       translate([-p4rampC2/2,0,0])
       translate([-p4baseOD/2+p4rampfromOD,p4rampW/2,p4rampH+p4baseH-(p4rampC2/2)])
       cube([p4rampC2,p4rampC2,p4rampC2],center=true);
        
       translate([0,0,0])
       translate([-p4baseOD/2+p4rampfromOD,p4rampW/2,p4baseH-(p4rampC2/2)-0.1])
      cube([p4rampC2,p4rampC2,p4rampC2],center=true);  
  
        
               translate([0,-p4clawW/2,0])
       translate([-(p4baseID/2)-p4rampfromID,0,p4baseH])
        cube([(p4baseID/2)+p4rampfromID,p4clawW,p4rampoverhangH]);
        
            translate([-7,0,0])
            translate([-p4baseOD/2+p4rampfromOD,(p4rampW/2)+(p4rampC2/2)-0.01,p4rampH+p4baseH-(p4rampC2/2)])
            cube([p4rampC2,p4rampC2,p4rampC2],center=true);
        
        translate([-7,0,0])
            translate([-p4baseOD/2+p4rampfromOD,-(p4rampW/2)-(p4rampC2/2)+0.01,p4rampH+p4baseH-(p4rampC2/2)])
            cube([p4rampC2,p4rampC2,p4rampC2],center=true);
        
        
    }//end ramps difference
} //end for rotate
    
}//end for
    
            //claws
            
        for(i=[1:p2needles*(p2number/p4number)]){
        rotate([0,0,(360/p2number/p2needles)-(360/p2number/p2needles*i)-(((360/p2number/p2needles))/2)]){
            translate([-p4baseOD/2,-p4clawW/2,0])
            cube([(p4baseOD-p4baseID)/2,p4clawW,p4baseH]);
        }
    }//end for
            
        } //end main union
    cylinder(h=p4baseH,d=p4baseID);
    translate([-p4baseOD/2,-p4baseOD/2,0]){    
    cube([p4baseOD,p4baseOD/2,p4baseH]);
    }
    rotate([0,0,-360/p4number]){
    translate([-p4baseOD/2,0,0])    
    cube([p4baseOD,p4baseOD/2,p4baseH]);        
    }

difference(){
    cylinder(h=p4basegapH,d=p4basegapOD);  
    cylinder(h=p4basegapH,d=p4basegapID);    
}

//holes

    //middle holes
        for(i=[0:(p2number/p4number)-1]){
         rotate([0,0,(-360/p2number/p2needles*1.5)+(i*-360/p2number)]){
           
  translate([-p4baseOD/2-0.2,0,p4holeH])
  rotate([0,90,0]){
  union(){
  cylinder(h=p4baseOD-p4baseID+0.2, d=p2holeD);
  translate([0,0,((p4baseOD-p4baseID)/2)-p2holeCSL]){ 
  cylinder(h=p2holeCSL+2, d=p2holeCSD); 
  } //end translate
  } //end union
  } //end rotate           
           
    } // end rotate     
    } //end for
        
    
    //second set
        for(i=[0:(p2number/p3number)-1]){
        rotate([0,0,-(-360/p2number/p2needles*0.5)+(-360/p2number/p2needles*(p2needles-1))+(i*-360/p2number)]){
            
  translate([-p4baseOD/2-0.2,0,p4holeH])
  rotate([0,90,0]){
  union(){
  cylinder(h=p4baseOD-p4baseID+0.2, d=p2holeD);
  translate([0,0,((p4baseOD-p4baseID)/2)-p2holeCSL]){ 
  cylinder(h=p2holeCSL+2, d=p2holeCSD); 
  } //end translate
  } //end union
  } //end rotate           
           
        //end middle holes



//////////////////
//        for(i=[1:p2number/p4number]){
//        rotate([0,0,(360/p2number)-(360/p2number*i)-((360/p2number)/2)]){
//
//   translate([-p4baseOD/2-0.2,0,p4holeH])
//   rotate([0,90,0]){
//   union(){
//   cylinder(h=p4baseOD-p4baseID+0.2, d=p2holeD);
//   translate([0,0,((p4baseOD-p4baseID)/2)-p2holeCSL]){ 
//   cylinder(h=p2holeCSL+2, d=p2holeCSD); 
//   } //end translate
//   }  //end union
//   } //end rotate
//            
//        } //end rotate
//    } //end holes for
//////////////////////
        
    } //end main difference
} //end main translate
    
    
} //end module