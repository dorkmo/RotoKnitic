////MAIN SETTINGS////

//select needle size file that will be used
include <CKneedleVars-KH260.scad>;  

//number of "p2" parts around circle
p2number=36; 

//number of needles mounted on each "p2" part
p2needles=10;

//number of "p3" parts around circle
p3number=18;

//number of "p4" parts around circle
p4number=18;

//distance from the inside face of one needle to the next
needle2needle=8.414;  //default=14.35615

//calculated diameter from inside edge of needles
p2needlegrooveID=((needle2needle*p2number*p2needles)/PI);

////MATERIALS////

upper_surfaceH=5;  //thickness of upper rotating plate
bottom_surface_motor_gearsH=6;  //thickness of geared rotating plate
table_surface=5;  //thickness of plate of main table

////PART SETTINGS////

//plate 
pPspace1=12; //? space from main table top to first plate
pPplate1=6;  //thickness of geared plated
pPspace2=12; //space between geared plate and mountain plate
pPplate2=5;

//"connector0912" connects upper_surface plate to bottom_surface geared plate
connector0912H=12;
connector0912L=25;
connector0912W=8;
connector0912HoleOD=3;   //hole diameter
connector0912HoleC2C=17; //center of hole to center of other hole

//p5 BearringSmall1312_x_4.stl
bearingholderSmallB2C=5.5;  //from base of bearing holder to center of bearing
bearingholderSmallBOD=10;   //Outside Diameter of bearing
bearingholderSmallBID=4.9;    //Inside Diameter of bore hole of bearing
bearingholderSmallBW=4;     //Width of bearing

//BearringZ
bearingholderZBOD=10;   //Outside Diameter of bearing
bearingholderZBID=4.9;    //Inside Diameter of bore hole of bearing
bearingholderZBW=4;     //Width of bearing
bearingholderZB2C=(bearingholderZBOD/2)+upper_surfaceH+connector0912H+bottom_surface_motor_gearsH+bearingholderSmallB2C+(bearingholderSmallBOD/2);  //from base of bearing holder to center of bearing


//p2
needleWidthslop=0.4;  //exta thickness
needleWidth=nX+needleWidthslop;
p2needlegroovefromID=2.0;
p2ID=p2needlegrooveID-(p2needlegroovefromID*2);
p2needlegrooveDepthslop=0.4;  //exta thickness
p2needlegrooveDepth=nY+p2needlegrooveDepthslop;
//p2H calculated below;
p2W=p2needlegroovefromID+p2needlegrooveDepth;
p2OD=p2ID+(p2W*2);
//p2holeH calculated below
p2holeD=2;
p2holeCSD=4.01726;
p2holeCSL=1.5;
p2clear=0.5;  //distance above top of p4 from flipper in down position

//p3
p3wiggle=0.1;
p3baseH=3;
p3wallW=(nH-nY)/2;  //half of needle butt
p3baseholeD=3;
p3baseholeScrewHeadD=5.68;
p3baseholefromODID=p3baseholeScrewHeadD/2;
p3baseholenumber=4;
p3ridgeW1=3;
p3ridgeW2=5;
p3ridgeH=5;
p3wallholefromtop=5;
p3wallchamfW=2;
p3wallchamfH=3;
//p3wallH in calculations below
//p3grooveH1 in calculations below
//p3grooveH2 in calculations below
p3grooveWslop=0.8;  //extra Width in needle groove
p3grooveW=nX+p3grooveWslop;
p3clear=5;   //distance from top of p3 to needle flipper in down position
p3baseID=p2ID-(p3wiggle*2)-(p3ridgeW2*2)-(p3baseholeScrewHeadD*2); 
p3baseOD=p2OD+(p3wiggle*2)+(p3wallW*2)+(p3wallchamfW*2)+(p3baseholeScrewHeadD*2); 

//p4
p4rampW=4;
p4rampH=14.57;
p4rampfromID=2.5;
p4rampoverhangH=4;
p4rampfromOD=1.34;
p4rampC1=10;
p4rampC2=40;
p4rampC2transX=10;
p4rampC2transZ=3.82;
p4baseH=11;
p4basegapH=8;
p4baseW=11.2;
p4basegapW=5.09;
p4clawW=9;
p4holesnumber=3;
p4holeH=5;

//p5 small bearing holder
p5wingW=7;
p5wingL=27;
p5wingH=3;
p5bodyW=16;
p5bodyL=25;
p5bodyH=9.5;
p5wiggleL=0.4;
p5wiggleW=0.25;
p5bearingfromwall=4.25;
p5mountholeOD=3;
p5mounthole2front=7;
p5mounthole2back=5;

//p7 Z bearing holder
p7baseW=16;
p7baseL=23;
p7baseH=4;
p7wallW=3;
p7mountH=8;
p7mountL=13;
p7mountholeOD=3;
p7mounthole2edge=3.5;
p7bearingfromfront=3;
p7wiggleL=0.4;
p7wiggleW=0.25;

//mountain
pMwallT=7.5;  //min thickness from groove to back wall
pMgroove=nH-nY-p3wallW+1;  //depth of groove
pMgrooveAngle=45;
pMgrooveC1=pPspace2;    //top of groove at position 1 "entrance"
pMgrooveC2=nC+2;        //top of groove at position 2 "push down"
pMgrooveC3=44.25;       //top of groove at position 3 "top center"
pMgrooveSlop=2;
pMwallHextra=5.75;      //extra height above groove at heighest point

//c2 geared plate
c2t2t=6.858;
c2width=50;
c2gap=2;
c2OD=(c2width*2)+(c2gap*2)+p2OD+(p3wiggle*2)+(p3wallW*2);
c2ID=(c2gap*2)+p2OD+(p3wiggle*2)+(p3wallW*2);
c2teeth=((c2OD*PI)/c2t2t);
c2dipitch=c2teeth/(c2OD*PI);

//c1
c1H=table_surface;
c1width=c2width+91.36;
c1OD=c2OD+(c1width-c2width);

//calculated settings

centerlineD=p2ID+(p2W+(p3wiggle*2));

p3grooveH1=bottom_surface_motor_gearsH+bearingholderSmallB2C+(bearingholderSmallBOD/2)+(pMgrooveSlop/2);
p3grooveH2=p3grooveH1+pMgrooveC3+(pMgrooveSlop/2);

p4baseOD=centerlineD+p4baseW;
p4baseID=centerlineD-p4baseW;
p4basegapOD=centerlineD+p4basegapW;
p4basegapID=centerlineD-p4basegapW;

firstcenter=(((((360/p2number/p2needles/2)/360*(p2OD*PI))-(needleWidth/2))/((360/p2number/p2needles/2)/360*(p2OD*PI)))*(360/p2number/p2needles/2))/2;

p2H=bottom_surface_motor_gearsH+bearingholderSmallB2C+(bearingholderSmallBOD/2)+pMgrooveC3+nA-nB-nC-nF-p3baseH-(p4rampH+p4baseH-p4basegapH)-p2clear;;

p3wallH=bottom_surface_motor_gearsH+bearingholderSmallB2C+(bearingholderSmallBOD/2)+pMgrooveC2+nA-nB-nC-nF-p3clear;

p2holeH=p3grooveH2+((p3wallH-p3grooveH2)/2);

////SETTINGS OUTPUT ECHOS///

echo("Total Needles:", p2number*p2needles);

echo("Millimeters Between Needles:", PI*p2needlegrooveID/(p2number*p2needles));

echo("OD of p3:", p3baseOD);

echo("OD of c1:", c2OD+(c1width-c2width));
