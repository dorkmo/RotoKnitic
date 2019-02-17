include <CKvars.scad>;

use <CKneedle.scad>;

use <CKp1--motor_gear.scad>;
use <CKp2--inner.scad>;
use <CKp3--outer.scad>;
use <CKp4--yardHolder.scad>;
use <CKp5--smallbearingholder.scad>;
//use <CKp6--bigbearingholder.scad>;
use <CKp7--Zbearingholder.scad>;
use <CKp8--plateconnector.scad>;
use <CKp9--outerconnector.scad>;
use <CKpM--mountain.scad>;

use <CKc1--tabletop.scad>;
use <CKc2--bottom_surface_motor_gears.scad>;
use <CKc3--topplate.scad>;

echo("===Bill of Materials===");

//needle
echo("Needles:", p2number*p2needles);


//c1
//Wood Mount Screws
echo("c1 Wood Screws","Size:",woodbeamScrewOD,"x",c1H+6,"mm","Count:",(16));
  
echo("c1 Stepper Socket Cap Screws","Size: M",NEMAboltOD,"x",c1H+4,"mm","Count:",(c1steppersnumber*4));


//p1 - motor gear
echo("p1 Bolts","Size: M",NEMAsetboltOD,"x",NEMAsetboltL,"mm","Count:",(c1steppersnumber));
//M3 Base Nuts
echo("p1 Square Nuts","Size: M",NEMAsetboltOD,"Count:",(c1steppersnumber));

//p2 - inner wall needle guide
//see p3

//p3 - outer wall

//M3 Base Bolts - 12
echo("p3 Bolts","Size: M",p3baseholeD,"x",ceil((p3baseH+table_surface+p3baseholeD+1)/2)*2,"mm","Count:",(p3number*p3baseholenumber));
//M3 Base Nuts
echo("p3 Nuts","Size: M",p3baseholeD,"Count:",(p3number*p3baseholenumber));


echo("p3/p9 Socket Cap Screws","Size: M",p2holeD,"x",p3upperwallW+p2W-p2holeCSL+p9thickness+p2holeD,"mm","Count:",p3number*4);
echo("p3/p2 Socket Cap Screws","Size: M",p2holeD,"x",p3upperwallW+p2W-p2holeCSL+p2holeD,"mm","Count:",(p2number*2)-(p3number*2));


//p9 - connector for p3
//see p3

//p4 - yard holder at top
//M2 Socket Cap Srews
echo("p4 Socket Cap Screws","Size: M",p2holeD,"x",((p4baseOD-p4baseID)/2)-p2holeCSL,"mm","Count:",p2number*2);


//p7 Z
//M3 Base Bolts - 12
echo("p7 Bolts","Size: M",p7mountholeOD,"x",ceil((p7baseH+table_surface+p7mountholeOD-0.25)/2)*2,"mm","Count:",(p7number*3));
//M3 Base Nuts
echo("p7 Nuts","Size: M",p7mountholeOD,"Count:",(p7number*3));

////////////////lock nut size?


//M5 Bearing Mount Bolt
echo("p7 Bearing Bolts","Size: M",p7boltD,"x",p7boltL,"mm","Count:",p7number);

//M5 Bearing Mount Nut
echo("p7 Bearing Nuts","Size: M",p7boltD,"Count:",p7number);

//Bearing  (bore 5mm x 10mm x 4mm)
echo("p7 Bearings","Bore:",bearingholderZBID,"x","OD:",bearingholderZBOD,"x","Width:",bearingholderZBW,"Count:",(p7number));


//////////////////
//ROTATING SECTION

//rotate([0,0,360/c2connectors/2]){

//c2
//translate([0,c3OD/2,pPspace1])
//CKc2();

//c3
//translate([0,c3OD/2,pPspace1+pPplate1+pPspace2])
//CKc3();

//p5 - small bearing holder
//for(i=[1:c2bmounts]){
//    rotate([0,0,((360/c2connectors)*1.5)+((360/c2bmounts)*i)]){
//        translate([0,(p3baseOD/2)+1,pPspace1]){ 
//            mirror([0,0,1])
//CKp5(1); //small bearing holder
//        }//end translate
//    }//end rotate
//}//end for

    //small bearing holder - under mountain
//    rotate([0,0,0]){
//        translate([0,(p3baseOD/2)+1,pPspace1]){
//            mirror([0,0,1])
//CKp5(1); //small bearing holder
//        }//end translate
//    }//end rotate

//p8
//translate([0,0,pPspace1+pPplate1])
//        for(i=[1:c2connectors-1]){
//            rotate([0,0,((360/c2connectors)*i)]){
//                translate([0,(pMID/2)+(pMgroove)+1+(p8baseL/2),0]){          
//                        translate([0,-p8baseL/2,-0.1])
//                        CKp8();
//                }//end translate
//            }//end rotate
//        }//end for


//mountain
//translate([0,0,0])
//translate([0,p3wallOD/2,(pPspace1+pPplate1+pPspace2+pPplate2)-(pPspace2+pPplate2)])
//rotate([0,0,0])
//CKpM(0,1,1);


//((360/(p2number*p2needles))*3)-((360/p2number/p2needles)*3.5)+((360/p4number))
//translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC3-nC-(pMgrooveD-nC))])
//rotate([0,0,-90])
//translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
//translate([0,nX/2,0])
//rotate([90,0,0])
//needle();

//    } //end rotate
    //END ROTATING SECTION
    //////////////////////
    
    