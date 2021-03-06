include <CKvars.scad>;

//use <CKneedle.scad>;

//use <CKp1--motor_gear.scad>;
//use <CKp2--inner.scad>;
//use <CKp3--outer.scad>;
//use <CKp4--yardHolder.scad>;
use <CKp5--smallbearingholder.scad>;
use <CKp8--plateconnector.scad>;
//use <CKp8b--plateconnector-p5.scad>;
use <CKp8d--plateconnector-bottomStand.scad>;
//use <CKp9--outerconnector.scad>;
//use <CKpM1--mountain.scad>;
//use <CKpS1--gearedRiser.scad>;

use <CKc1--tabletop.scad>;
//use <CKc2--bottom_surface_motor_gears.scad>;
use <CKc3--topplate.scad>;
//use <CKc5--pick_a_needle.scad>;
use <CKc6--lowerplate.scad>;


//needle
rotate([0,0,0]){  //-(360/p2number*p2needles)/2

//needle at lowest position - on top of geared plate    
translate([0,0,-nB+(pPspace1+pPplate1)])
rotate([0,0,-((360/p2number/p2needles)*3.5)+((360/p4number))])  //(360/(p2number*p2needles))*1
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();

//needle below plate
translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC1-nC)])
rotate([0,0,((360/(p2number*p2needles))*1)-((360/p2number/p2needles)*3.5)+((360/p4number))])
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();

//needle below push down
translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC2-nC)])
rotate([0,0,((360/(p2number*p2needles))*2)-((360/p2number/p2needles)*3.5)+((360/p4number))])
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();

//needle at top of groove
translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC3-nC-(pMgrooveD-nC))])
rotate([0,0,((360/(p2number*p2needles))*3)-((360/p2number/p2needles)*3.5)+((360/p4number))])
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();

//needle above PaN plate
translate([0,0,-nB+(pPspace1+pPplate1+pMH+pPplate3)])
rotate([0,0,((360/(p2number*p2needles))*4)-((360/p2number/p2needles)*3.5)+((360/p4number))])
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();


} //end needle rotate




//c1 - table top
translate([0,0,-c2H-pPspace1-c1H])
CKc1();



//p1 - motor gear
rotate([0,0,0])
translate([0,-(CKp1_pitch_radius+CKc2_pitch_radius),1-c2H-pPspace1])
CKp1();



//p2 - inner wall needle guide
for(i=[1:p2number]){
    rotate([0,0,i*(360/p2number)])
    translate([-p2OD/2,0,p3base45H])
    CKp2();
}


//p3 - outer wall
for(i=[1:p3number]){
    rotate([0,0,i*(360/p3number)])
    translate([-p3baseOD/2,0,0])
    CKp3();
}


//p9 - connector for p3
for(i=[1:p3number]){
    rotate([0,0,i*(360/p3number)])
    translate([-(p3wallID+(p3upperwallW*2))/2,0,(p2holeH)-(p9H/2)])
    rotate([0,0,180])
    CKp9();
}//end for


//p4 - yard holder at top
for(i=[1:p4number]){
    rotate([0,0,-((360/p2number/p2needles)*3.5)+(i*(360/p4number))])
    translate([-(p4baseOD/2),0,p3base45H+p2H-p4basegapH])
    CKp4();
}




//pS1 - pick a needle
rotate([0,0,-45])
translate([pMID/2,0,pPspace1])
CKpS1();

mirror([1,0,0])
translate([pMID/2,0,pPspace1])
CKpS1();



//p8d - outer plate connector
for(i=[1:max(4,c1steppersnumber)]){
rotate([0,0,((360/(max(4,c1steppersnumber)))/2)+((360/(max(4,c1steppersnumber)))*i)])
translate([0,0,-c2H-pPspace1])
CKp8d(); 
}

//////////////////
//ROTATING SECTION

rotate([0,0,0]){

//c2 - geared plate
translate([0,c2OD/2,-c2H])
CKc2();

//c6 - mountain base
translate([0,c6OD/2,pPspace1])
CKc6();

//c3 - mountain insert
translate([0,c3OD/2,pPspace1+c6H+pPspace2])
CKc3();

//c5 - pick-a-needle off plate
//translate([0,c3OD/2,pPspace1+pPplate1+pMH])
//CKc5();    

//p5 - small bearing holder TODO
if(atan((((((c2ID+(pMgroove*2))/2)*cos(90-(pMd1e-pMd0)))+(pMshelfX/2)))/((cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)))) > 45){    for(i=[1:4]){
    rotate([0,0,((360/c2bmounts)*i)]){
        translate([0,(p3baseOD/2)+1,pPspace1]){ 
            mirror([0,0,1])
CKp5(1); //small bearing holder
        }//end translate
    }//end rotate
}//end for
}
else{
for(i=[1:c2bmounts]){
    rotate([0,0,((360/c2bmounts)*i)]){
        translate([0,(p3baseOD/2)+1,pPspace1]){ 
            mirror([0,0,1])
CKp5(1); //small bearing holder
        }//end translate
    }//end rotate
}//end for
}

if(atan((((((c2ID+(pMgroove*2))/2)*cos(90-(pMd1e-pMd0)))+(pMshelfX/2)))/((cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)))) > 45){   
for(i=[1:4]){
    rotate([0,0,((360/c2bmounts)*i)]){
        translate([0,(p3baseOD/2)+1,-c2H-pPspace1]){ 
            mirror([0,0,0])
CKp5(1); //small bearing holder
        }//end translate
    }//end rotate
}//end for
}
else
{    
    
for(i=[1:c2bmounts]){
    rotate([0,0,((360/c2bmounts)*i)+(360/c2bmounts/2)]){
        translate([0,(p3baseOD/2)+1,-c2H-pPspace1]){ 
            mirror([0,0,0])
CKp5(1); //small bearing holder
        }//end translate
    }//end rotate
}//end for
}


//p8
for(i=[1:c2bmounts/2]){
    rotate([0,0,((360/c2bmounts*2)*i)+((360/c2bmounts*2)/2)]){
      translate([(((p5wingW/2)+p5bodyW+(p5wingW/2))/2),(p3baseOD/2)+1+p5mounthole2back,pPspace1+pPplate1]){ 
                CKp8b();
        }//end translate
      translate([-(((p5wingW/2)+p5bodyW+(p5wingW/2))/2),(p3baseOD/2)+1+p5mounthole2back,pPspace1+pPplate1]){ 
                CKp8b();
        }//end translate
    }//end rotate
}//end for    


//mountain
translate([0,0,0])
translate([0,p3wallOD/2,(pPspace1+pPplate1+pPspace2+pPplate2)-(pPspace2+pPplate2)])
rotate([0,0,0])
CKpM(0,1,1);


//((360/(p2number*p2needles))*3)-((360/p2number/p2needles)*3.5)+((360/p4number))

/*
translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC3-nC-(pMgrooveD-nC))])
rotate([0,0,-90])
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();
*/

    } //end rotate
    //END ROTATING SECTION
    //////////////////////
    
    