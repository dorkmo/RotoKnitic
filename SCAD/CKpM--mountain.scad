include <CKvars.scad>;

//TO DO//
//*re do mounting tabs
//*gut and redo main body geometry
//*add integrated yarn feeder based on needle height
/////////

CKpM(); //mountain

    mult=2;                //rough multiplier 5-30
    mult=2;                //rough multiplier 5-30
    grez=rez*mult;          //number of sides of groove path main circle
    gdeg=360/grez;          //groove rez in fractions of a degree
    glen=(pMID*PI)/grez;    //length of arc of each rez's fraction of a degree
    
    echo("rez", rez);
    echo("grez", grez);
    echo("gdeg", gdeg);
    echo("glen", glen);
    
    pMgrooveturnR=15; //radius of upper curved path in groove
    pMgrooveturnR2=8; //radius of lower curved path in groove
    pMgrooveD=nC+pMgrooveSlop; //Y plane diamter of groove cut
 
    pMp3X=2.5;  //length of flat area of section 3
    pMcutRez=2; //cuts per degree
 //   CKpMcutDeg=(((CKpMp7X/2)*360/(PI*CKpMID))/CKpMp7X); //degrees per unit diameter
    pMcutcylRez=36;  //number of sides on groove cutting clylinder
    pMcutA=45;    //angle of cut path

    pMp7X=5;  //half of length of plateu of groove. preferably whole number 
    pMd7=(pMp7X/glen)*gdeg; //number of degrees for entire groove7
    grez7=pMd7/grez/(pMp7X/(pMID*PI));     //degrees of section 7
    
    echo("pMd7", pMd7);
    echo("grez7", grez7);
    
    pMp6X=cos(pMcutA)*pMgrooveturnR; 
    pMd6=(pMp6X/glen)*gdeg;
    grez6=pMd6/grez/(pMp6X/(pMID*PI));
    
    echo("pMp6X", pMp6X);
    echo("pMd6", pMd6);
    echo("grez6", grez6);
     //CKpMp5X=(pMgrooveC3-(CKpMgrooveD/2)+(CKpMgrooveturnR*cos(asin(((CKpMd6)*(CKpMp6X/CKpMd6))/CKpMgrooveturnR))-CKpMgrooveturnR))/(1/cos(90-CKpMcutA));
    //CKpMp5X=(pMgrooveC3-(sin(CKpMcutA)*CKpMgrooveturnR))*tan(CKpMcutA)
    
    pMp5X=(pMgrooveC3)*tan(pMcutA);
    pMd5=(pMp5X/glen)*gdeg;
    grez5=pMd5/grez/(pMp5X/(pMID*PI));
    
    echo("pMgrooveC3", pMgrooveC3);
    echo("pMp5X", pMp5X);
    echo("pMd5", pMd5);
    echo("grez5", grez5);    
    
    pMp4X=cos(pMcutA)*pMgrooveturnR2;
    pMd4=(pMp4X/glen)*gdeg;
    grez4=pMd4/grez/(pMp4X/(pMID*PI));
    
    pMd3=1; //define later
    pMd2=1; //define later
    pMd1=1; //define later
    pMd0=1; //define later
    
    pMshelfX=25;  //length of shelf in mm
    pMshelfd=(pMshelfX/glen)*gdeg; //number of degrees of shelf

    pMshelfHole1X=pMshelfchamfR+(pMshelfBoltD*1.5);  //distance to hole center from main body
    pMshelfHole1d=(pMshelfHole1X/glen)*gdeg; //number of degrees from edge to hole center

    pMshelfHole2X=pMshelfX-(pMshelfBoltD*1.5);  //distance to hole center from main body
    pMshelfHole2d=(pMshelfHole2X/glen)*gdeg; //number of degrees from edge to hole center



module CKpM(){
    translate([0,-p3wallOD/2,0]){ //main translate
    difference(){
        translate([0,0,pMH/2])
        //main cube
        translate([0,(c2ID+(pMgroove*2)+(pMwallT*2))/4,0])
        cube([c2ID+(pMgroove*2)+(pMwallT*2),(c2ID+(pMgroove*2)+(pMwallT*2))/2,pMH], center=true);
        //main ID cut
        cylinder(d=pMID,h=pMH+1,$fn=rez);
        
        //////
        //angled cut ends
        //*need to calc exactly so height of path entrance matches bottom of top plate
        rotate([0,0,(pMd7+pMd6+pMd5+pMd4+pMd3+pMd2+pMd1-pMd0+pMshelfd)])
        mirror([1,0,0])
        cube([pMID*4,pMID*4,pMH]);
        mirror([1,0,0])
        rotate([0,0,(pMd7+pMd6+pMd5+pMd4+pMd3+pMd2+pMd1-pMd0+pMshelfd)])
        mirror([1,0,0])
        cube([pMID*4,pMID*4,pMH]);
        //
        //////
        
        //////
        //ends' angled cut with shelf
        rotate([0,0,(pMd7+pMd6+pMd5+pMd4+pMd3+pMd2+pMd1-pMd0)])
        mirror([1,0,0])
        cube([pMID*4,pMID*4,pPspace2+pPplate2]);
        mirror([1,0,0])
        rotate([0,0,(pMd7+pMd6+pMd5+pMd4+pMd3+pMd2+pMd1-pMd0)])
        mirror([1,0,0])
        cube([pMID*4,pMID*4,pPspace2+pPplate2]);
        
        translate([0,0,pPspace2+pPplate2+pMshelfH]){
        rotate([0,0,(pMd7+pMd6+pMd5+pMd4+pMd3+pMd2+pMd1-pMd0)])
        mirror([1,0,0])
        minkowski(){
        translate([pMshelfchamfR,0,pMshelfchamfR])    
        cube([pMID*4,pMID*4,pMH]);
        sphere(r=pMshelfchamfR,$fn=100);
        }
        mirror([1,0,0])
        rotate([0,0,(pMd7+pMd6+pMd5+pMd4+pMd3+pMd2+pMd1-pMd0)])
        mirror([1,0,0])
        minkowski(){
        translate([pMshelfchamfR,0,pMshelfchamfR])    
        cube([pMID*4,pMID*4,pMH]);
        sphere(r=pMshelfchamfR,$fn=100);
        }
        }
        //
        //////
        
       
        //////
        //mounting bolt holes
        
        rotate([0,0,(pMd7+pMd6+pMd5+pMd4+pMd3+pMd2+pMd1-pMd0+pMshelfHole1d)])
        translate([0,(pMID/2)+(pMshelfBoltD)+pMgroove,0])
        cylinder(d=pMshelfBoltD, h=pMH, $fn=36);
        
        rotate([0,0,(pMd7+pMd6+pMd5+pMd4+pMd3+pMd2+pMd1-pMd0+pMshelfHole2d)])
        translate([0,(((c2ID+(pMgroove*2)+(pMwallT*2))/2)/cos((pMd7+pMd6+pMd5+pMd4+pMd3+pMd2+pMd1-pMd0+pMshelfHole2d)))-(pMshelfBoltD*1.5),0])
        cylinder(d=pMshelfBoltD, h=pMH, $fn=36);
        
        
        
        //
        //////
        
        
    } //end main body diffference    
    
        
        
        
        
    } //end main translate
} //end CKpM module