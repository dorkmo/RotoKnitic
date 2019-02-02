include <CKvars.scad>;


use <CKneedle.scad>;
use <CKpM--mountain.scad>;
use <mb10.scad>;

CKpM2();


M2tipY=tipOpenX/2;
M2tipZ=(((tipOpenX/2)-(nE/2))*2)+tipHole+(tipcylD/2);
M2tiptopC=(((tipOpenX/2)-(nE/2))*2)+tipHole+(tipcylD/2);

M2inX=((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2);
M2inY=(((c2ID+(pMgroove*2)+(pMwallT*2))/2))-((p3wallID/2)-(p2needlegrooveDepthslop/2))-M2tipY;
M2inZ=pM2H;
M2backwallOD=((c2ID+(pMgroove*2)+(pMwallT*2))/2)+aaT;

pM2Dc1=(((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*(((sin(pMd4s)*(pMID/2))-(aaX/2)-(0))))/(pM2H-pM2fH))+(pM2H-pM2fH);

pM2Dc2=(((((((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4))/2))*(((((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4))/2)))/((pM2H-tipOpenX)))+((pM2H-tipOpenX));

module CKpM2(){
    
    difference(){
    union(){
translate([0,-p3wallOD/2,0]){ //main translate

translate([0,0,-nA+(nE*2)])
translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC3-nC-(pMgrooveD-nC))])
rotate([0,0,-90])
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();

        translate([(sin(pMd4s)*(pMID/2))-(aaX/2),((c2ID+(pMgroove*2)+(pMwallT*2))/2)-(aaX-aaT),0])
    difference(){
    minkowski(){
    difference(){
        cube([aaX,aaX,pM2H]);  //cube 
        cube([aaX-aaT,aaX-aaT,pM2H]);
        
    } //end angle iron
cylinder(d=pM2mink,h=0.01, $fn=36);
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
     translate([-M2inX/2,((c2ID+(pMgroove*2)+(pMwallT*2))/2)+aaT,0])
 mirror([0,1,0])
     cube([M2inX,M2inY,M2inZ]);    
     
         //right side cylinder cut
     translate([M2inX/2,M2backwallOD-M2inY,0])    
     resize([M2inX-(tipOpenX),(M2inY-aaT)*2])
    #cylinder(d=200,h=pM2H,$fn=36);
         
         //left side cylinder cut
         mirror([1,0,0])
     translate([M2inX/2,M2backwallOD-M2inY,0])    
     resize([M2inX-(tipOpenX),(M2inY-aaT)*2])
    #cylinder(d=200,h=pM2H,$fn=36);
         
         //main cylinder cut
translate([0,M2backwallOD,M2inZ])
rotate([90,0,0])
              resize([M2inX,(M2inZ-M2tiptopC)*2])
    #cylinder(d=200,h=M2inY,$fn=36);
    
    translate([0,M2backwallOD-M2inY,0])
              hull(){
     cylinder(d=tipOpenX,h=pM2H);    
         translate([0,((((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2)+(tipOpenX/2))*2)/2)/4,0])
     cylinder(d=tipOpenX,h=pM2H,$fn=36);    
         
     }
         
         }//end diff
         
         //cylinder(d=pM2mink,$fn=8,h=0.01);
     } //end mink
/*
minkowski(){
difference(){
 translate([-(sin(pMd4s)*(pMID/2))+(aaX/2)+(0),((c2ID+(pMgroove*2)+(pMwallT*2))/2),0])
    cube([((sin(pMd4s)*(pMID/2))-(aaX/2)-(0))*2,aaT,pM2H]);
 translate([0,((c2ID+(pMgroove*2)+(pMwallT*2))/2),(pM2Dc1/2)+pM2fH])
rotate([270,0,0])
    // AP == PB == ((sin(pMd4s)*(pMID/2))-(aaX/2)-(pM2mink/2))
    // CP == pM2H-pM2fH
    // DIAMETER == CD == (((AP)*(PB))/(CP))+(CP)
    // pM2D=(((((sin(pMd4s)*(pMID/2))-(aaX/2)-(pM2mink/2)))*(((sin(pMd4s)*(pMID/2))-(aaX/2)-(pM2mink/2))))/(pM2H-pM2fH))+(pM2H-pM2fH)
    
#cylinder(d=pM2Dc1,h=aaT,$fn=360);
 
} //end difference
//cylinder(d=pM2mink-1,h=0.01, $fn=36);
} //end minkowski




//flat base section
translate([0,(p2OD/2)+aaT+(tipOpenX/2),0]){
    difference(){
        translate([-(((sin(pMd4s)*(pMID/2))-(aaX/2)-(0))*2)/2,0,0])
        cube([((sin(pMd4s)*(pMID/2))-(aaX/2)-(0))*2,(((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2)+(tipOpenX/2))*2)/2,3]);
        
        translate([(((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))-((tipcylD*1.5)/2),(tipOpenX/2),0])
        resize([
        ((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4)-(aaT*2)
        ,(((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2)+(tipOpenX/2))*2)-(aaT*2)
        ])
    #cylinder(d=200,h=pM2H,$fn=360);

mirror([1,0,0])
        translate([(((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))-((tipcylD*1.5)/2),0,0])
        resize([
        ((((sin(pMd4s)*(pMID/2))-(aaX/2)-(0)))*2)-(tipOpenX+((tipcylD*1.5)/2))-(pM2mink/4)-(aaT*2)
        ,(((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2)+(tipOpenX/2))*2)-(aaT*2)
        ])
    #cylinder(d=200,h=pM2H,$fn=360);
     
     hull(){
     cylinder(d=tipOpenX,h=pM2H);    
         translate([0,((((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2)+(tipOpenX/2))*2)/2)/4,0])
     cylinder(d=tipOpenX,h=pM2H,$fn=36);    
         
     }
     
     
 translate([0,((c2ID+(pMgroove*2)+(pMwallT*2))/2),(pM2Dc1/2)+pM2fH])
rotate([270,0,0])

    
#cylinder(d=pM2Dc1,h=(((((c2ID+(pMgroove*2)+(pMwallT*2))/2))-(p2OD/2)+(tipOpenX/2))*2)/2,$fn=360);
        
    } //end difference

} //end translate
//end flat base section


*/

//tip try 2
tipHole=1.5;
tipOpenX=10;
tipcylD=1.5;
translate([0,M2backwallOD-M2inY,0]){  //(p2OD/2)+(tipOpenX/2)

hull(){
    translate([tipOpenX/2,0,0])
    cylinder(d=tipcylD*1.5, h=M2tiptopC, $fn=36);
    translate([(tipcylD/2)+(tipHole/2),-(tipOpenX/2)+1,(tipOpenX/2)-(nE/2)])
    cylinder(d=tipcylD,h=(tipcylD/2)+tipHole+(tipcylD/2),$fn=36);    
}

mirror([1,0,0])
hull(){
    translate([tipOpenX/2,0,0])
    cylinder(d=tipcylD*1.5, h=M2tiptopC, $fn=36);
    translate([(tipcylD/2)+(tipHole/2),-(tipOpenX/2)+1,(tipOpenX/2)-(nE/2)])
    cylinder(d=tipcylD,h=nE,$fn=36);    
}

hull(){
translate([-nE/2,-(tipOpenX/2),(tipOpenX/2)-(nE/2)])
rotate([0,90,0])
cylinder(d=nG,h=nE,$fn=36);    

translate([-(tipOpenX+(tipcylD*1.5))/2,0,0])
rotate([0,90,0])    
cylinder(d=tipcylD*1.5,h=tipOpenX+(tipcylD*1.5),$fn=36);    
}

translate([0,0,(((tipOpenX/2)-(nE/2))*2)+tipHole+(tipcylD/2)])
mirror([0,0,1])
hull(){
translate([-nE/2,-(tipOpenX/2),(tipOpenX/2)-(nE/2)])
rotate([0,90,0])
cylinder(d=nG,h=nE,$fn=36);    

translate([-(tipOpenX+(tipcylD*1.5))/2,0,0])
rotate([0,90,0])    
cylinder(d=tipcylD*1.5,h=tipOpenX+(tipcylD*1.5),$fn=36);    

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

