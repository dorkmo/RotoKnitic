include <CKvars.scad>;


use <CKneedle.scad>;
use <CKpM--mountain.scad>;
use <mb10.scad>;

CKpM2();


M2tipY=tipOpenX/2;  //pM2mink

M2tipZ=(((tipOpenX/2)-(nE/2))*2)+tipHole+(tipcylD/2);
M2tiptopC=(((tipOpenX/2)-(nE/2))*2)+tipHole+(tipcylD/2)-(pM2mink/4);

M2inX=((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2);
M2inY=(((c2ID+(pMgroove*2)+(pMwallT*2))/2))-((p3wallID/2)-(p2needlegrooveDepthslop/2))-M2tipY;
M2inZ=pM2H-pM2mink;
M2backwallOD=((c2ID+(pMgroove*2)+(pMwallT*2))/2)+aaT;



module CKpM2(){
    
    difference(){
    union(){
translate([0,-p3wallOD/2,0]){ //main translate

/*
translate([0,0,-nA+(nE*2)])
translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC3-nC-(pMgrooveD-nC))])
rotate([0,0,-90])
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();
*/
        translate([(sin(pMd4s)*(pMID/2))-(aaX/2),((c2ID+(pMgroove*2)+(pMwallT*2))/2)-(aaX-aaT),0])
    difference(){
    minkowski(){
    difference(){
        cube([aaX,aaX,pM2H]);  //cube 
        cube([aaX-aaT,aaX-aaT,pM2H]);
        
    } //end angle iron
cylinder(d=pM2mink,h=0.01, $fn=72);
 } //end minkowski
     }//end difference
 
 mirror([1,0,0])
        translate([(sin(pMd4s)*(pMID/2))-(aaX/2),((c2ID+(pMgroove*2)+(pMwallT*2))/2)-(aaX-aaT),0])
    difference(){
    minkowski(){
    difference(){
        cube([aaX,aaX,pM2H]);  //cube 
        cube([aaX-aaT,aaX-aaT,pM2H]);
        
    } //end angle iron
cylinder(d=pM2mink,h=0.01, $fn=18);
 } //end minkowski
     }//end difference
     
     minkowski(){
     difference(){
     
         //main wall between supports 
     translate([-M2inX/2,((c2ID+(pMgroove*2)+(pMwallT*2))/2)+aaT,pM2mink/2])
 mirror([0,1,0])
     cube([M2inX,M2inY,M2inZ]);    
     
         //right side cylinder cut
     translate([M2inX/2,M2backwallOD-M2inY,0])    
     resize([M2inX-(tipOpenX),(M2inY-aaT)*2])
    cylinder(d=200,h=pM2H,$fn=72);
         
         //left side cylinder cut
         mirror([1,0,0])
     translate([M2inX/2,M2backwallOD-M2inY,0])    
     resize([M2inX-(tipOpenX),(M2inY-aaT)*2])
    cylinder(d=200,h=pM2H,$fn=72);
         
         //main cylinder cut
translate([0,M2backwallOD,M2inZ])
rotate([90,0,0])
              resize([M2inX,(M2inZ-tipOpenZ+(pM2mink/2))*2])
    cylinder(d=200,h=M2inY,$fn=72);
    
    //thread entrance cut
    translate([0,M2backwallOD-M2inY,0])
              hull(){
     cylinder(d=tipOpenX,h=pM2H);    
         translate([0,((((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2)+(tipOpenX/2))*2)/2)/4,0])
     cylinder(d=tipOpenX,h=pM2H,$fn=72);    
         
     }
         
         }//end diff
         
         sphere(d=pM2mink,$fn=10);
     } //end mink


//tip try 2
tipHole=1.5;
tipOpenX=10;
tipcylD=1.5;
translate([0,M2backwallOD-M2inY,0]){  //(p2OD/2)+(tipOpenX/2)

hull(){
    //right back
    translate([tipOpenX/2,0,(tipcylD*1.5/2)])
    cylinder(d=tipcylD*1.5, h=tipOpenZ-(tipcylD*1.5), $fn=36);
    //right front
    translate([(tipcylD/2)+(tipHole/2),-(tipOpenX/2)+1,(tipOpenX/2)-(nE/2)]) //?
    cylinder(d=tipcylD,h=(tipcylD/2)+tipHole+(tipcylD/2),$fn=36);    
}

mirror([1,0,0])
hull(){
    //left back
    translate([tipOpenX/2,0,(tipcylD*1.5/2)])
    cylinder(d=tipcylD*1.5, h=tipOpenZ-(tipcylD*1.5), $fn=36);
    //left front
    translate([(tipcylD/2)+(tipHole/2),-(tipOpenX/2)+1,(tipOpenX/2)-(nE/2)])
    cylinder(d=tipcylD,h=(tipcylD/2)+tipHole+(tipcylD/2),$fn=36);    
}

hull(){
//bottom front    
translate([-(tipcylD+tipHole+tipcylD)/2,-(tipOpenX/2),((tipOpenZ-tipHole)/2)-(tipcylD/2)])
rotate([0,90,0])
cylinder(d=tipcylD,h=tipcylD+tipHole+tipcylD,$fn=36);    

//bottom back
translate([0,-tipcylD*1.5/2,tipcylD*1.5/2])
translate([-(tipOpenX/2),0,0])
rotate([0,90,0])
rotate([0,0,45/2])    
cylinder(d=tipcylD*1.5,h=tipOpenX,$fn=8);    
}

//hull(){

hull(){
//top front
translate([-(tipcylD+tipHole+tipcylD)/2,-(tipOpenX/2)+(tipcylD/2),tipOpenZ-((tipOpenZ-tipHole)/2)+(tipcylD/2)])
rotate([0,90,0])
cylinder(d=tipcylD,h=tipcylD+tipHole+tipcylD,$fn=36);     //change from nG to something else?
//center sphere top back
    translate([cos(90)*((tipOpenX/2)-((pM2mink-tipcylD)/2)),(tipOpenX/2)-(sin(90)*(tipOpenX/2)*0.5),-tipcy2D/2])    
    translate([0,-tipOpenX/2,tipOpenZ])
    translate([1/4,0,0])
    sphere(d=tipcy2D,$fn=18);
//center sphere top back
mirror([1,0,0])
    translate([cos(90)*((tipOpenX/2)-((pM2mink-tipcylD)/2)),(tipOpenX/2)-(sin(90)*(tipOpenX/2)*0.5),-tipcy2D/2])    
    translate([0,-tipOpenX/2,tipOpenZ])
    translate([1/4,0,0])
    sphere(d=tipcy2D,$fn=18);
} //end full


for(i=[0:90]){
hull(){
//top back
    translate([cos(i)*((tipOpenX/2)-((pM2mink-tipcylD)/2)),(tipOpenX/2)-(sin(i)*(tipOpenX/2)*0.5),-tipcy2D/2])    
    translate([0,-tipOpenX/2,tipOpenZ])
    translate([1/4,0,0])
    sphere(d=tipcy2D,$fn=18);



//top front
translate([((tipcylD+tipHole+tipcylD)/2)-0.1,-(tipOpenX/2)+(tipcylD/2),tipOpenZ-((tipOpenZ-tipHole)/2)+(tipcylD/2)])
rotate([0,90,0])
cylinder(d=tipcylD,h=0.1,$fn=36);     //change from nG to something else?


//translate([-1/2,0,0])
//rotate([90,0,90])  
//cylinder(d=tipcy2D,h=1,$fn=36);    
} //end hull
} //end for

mirror([1,0,0])
for(i=[0:90]){
hull(){
//top back
    translate([cos(i)*((tipOpenX/2)-((pM2mink-tipcylD)/2)),(tipOpenX/2)-(sin(i)*(tipOpenX/2)*0.5),-tipcy2D/2])    
    translate([0,-tipOpenX/2,tipOpenZ])
    translate([1/4,0,0])
    sphere(d=tipcy2D,$fn=18);



//top front
translate([((tipcylD+tipHole+tipcylD)/2)-0.1,-(tipOpenX/2)+(tipcylD/2),tipOpenZ-((tipOpenZ-tipHole)/2)+(tipcylD/2)])
rotate([0,90,0])
cylinder(d=tipcylD,h=0.1,$fn=36);     //change from nG to something else?


//translate([-1/2,0,0])
//rotate([90,0,90])  
//cylinder(d=tipcy2D,h=1,$fn=36);    
} //end hull
} //end for


//translate([-tipOpenX/2,0,tipOpenZ-(tipcy2D/2)])
//rotate([0,90,0])    
//cylinder(d=tipcy2D,h=tipOpenX,$fn=36);    

/*
translate([0,0,tipOpenZ-(tipcy2D/2)])
minkowski(){
difference(){
resize([tipOpenX,tipOpenX/2])    
cylinder(d=tipOpenX,h=0.01);
resize([tipOpenX-0.1,(tipOpenX-0.1)/2])
cylinder(d=tipOpenX-0.1,h=0.01);
translate([-tipOpenX/2,0,0])
cube([tipOpenX,tipOpenX,0.01]);
} //end diff
sphere(d=tipcy2D,$fn=36);
} //end mink
*/


hull(){
    translate([cos(0)*((tipOpenX/2)-((pM2mink-tipcylD)/2)),(tipOpenX/2)-(sin(0)*(tipOpenX/2)*0.5),-tipcy2D/2])    
    translate([0,-tipOpenX/2,tipOpenZ])
    translate([1/4,0,0])
    sphere(d=tipcy2D,$fn=18);
    
    
           translate([tipOpenX/2,((((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2)+(tipOpenX/2))*2)/2)/4,tipOpenZ-(pM2mink/2)])
         sphere(d=pM2mink,$fn=10);
}
mirror([1,0,0])
hull(){
    translate([cos(0)*((tipOpenX/2)-((pM2mink-tipcylD)/2)),(tipOpenX/2)-(sin(0)*(tipOpenX/2)*0.5),-tipcy2D/2])    
    translate([0,-tipOpenX/2,tipOpenZ])
    translate([1/4,0,0])
    sphere(d=tipcy2D,$fn=18);
    
    
           translate([tipOpenX/2,((((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2)+(tipOpenX/2))*2)/2)/4,tipOpenZ-(pM2mink/2)])
         sphere(d=pM2mink,$fn=10);
}



} //end tip translate
//end tip try 2


} //end translate
} //end main union


//cut slot for angle iron in sliding section
translate([0,-p3wallOD/2,]){

     translate([(sin(pMd4s)*(pMID/2))-(aaX/2),((c2ID+(pMgroove*2)+(pMwallT*2))/2)-(aaX-aaT),0]){
 translate([-pM2mink,-pM2mink,pM2H])
#        cube([aaX+(3*2),aaX+(3*2),1]);  //cube 
 
 
 translate([-(pM2slop/2),-(pM2slop/2),0])
     difference(){
        cube([aaX+(pM2slop),aaX+(pM2slop),pM2H]);  //cube 
        cube([aaX-aaT-(pM2slop/4),aaX-aaT-(pM2slop/4),pM2H]);
     }
         
     } //end difference

mirror([1,0,0])     
          translate([(sin(pMd4s)*(pMID/2))-(aaX/2),((c2ID+(pMgroove*2)+(pMwallT*2))/2)-(aaX-aaT),0]){
 translate([-pM2mink,-pM2mink,pM2H])
#        cube([aaX+(3*2),aaX+(3*2),1]);  //cube 
 
 
 translate([-(pM2slop/2),-(pM2slop/2),0])
     difference(){
        cube([aaX+(pM2slop),aaX+(pM2slop),pM2H]);  //cube 
        cube([aaX-aaT-(pM2slop/4),aaX-aaT-(pM2slop/4),pM2H]);
     }
         
     } //end difference
     
 } //end cut translate
 
} //end main difference

} //end module

