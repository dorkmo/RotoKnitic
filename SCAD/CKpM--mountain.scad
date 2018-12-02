include <CKvars.scad>;

//TO DO//
//*re do mounting tabs
//*gut and redo main body geometry
//*add integrated yarn feeder based on needle height
//*function func6 not right? working with 45 angle but not others
///////

CKpM(); //mountain

    mult=4;                //rough multiplier 5-30
    grez=rez*mult;          //number of sides of groove path main circle
    gdeg=360/grez;          //standard fraction of a degree per groove rez
    glen=(pMID*PI)/grez;    //length of arc of each rez's fraction of a degree
    glnd=glen/gdeg;         //length of standard fraction of a degree

    gcho=2*(pMID/2)*sin(gdeg/2);  //chord length of glnd
    garc=gdeg*(pMID/2);           //arc length... too close to get to smaller digits that are diff?
    
    echo("rez", rez);
    echo("grez", grez);
    echo("gdeg", gdeg);
    echo("glen", glen);
    echo("glnd", glnd);
    echo("gcho", gcho);
    echo("garc", garc);
    
    pMgrooveturnR=15; //radius of upper curved path in groove
    pMgrooveturnR2=15; //radius of lower curved path in groove
    pMgrooveD=nC+pMgrooveSlop; //Y plane diamter of groove cut
 
    pMp3X=2.5;  //length of flat area of section 3
    pMcutRez=2; //cuts per degree
    pMcutcylRez=36;  //number of sides on groove cutting clylinder

    pMcutA=45;    //angle of cut path


//7
    pMp7X=15;  //half of length of plateu of groove. preferably whole number 
    pMd7=pMp7X/glnd; //number of degrees for entire groove7
    pMd7s=0;                          //degree turn to center of groove
    pMd7e=pMd7;                       //highest degree turn for section 7
    pMh7s=pMgrooveC3-(pMgrooveD/2);   //height of center of groove
    pMh7e=pMgrooveC3-(pMgrooveD/2);
    
    echo("pMd7", pMd7);

//6    
    pMp6X=cos(90-pMcutA)*pMgrooveturnR; 
    pMd6=pMp6X/glnd;
    grez6=pMd6/grez/(pMp6X/(pMID*PI));
    pMd6s=pMd7;
    pMd6e=pMd7+pMd6;
    function func6(i) = (pMgrooveturnR*cos(asin(((i-pMd6s)*(pMp6X/pMd6))/pMgrooveturnR))-pMgrooveturnR);
    pMh6s=pMh7e;
    pMh6e=pMh7e+func6(pMd6e);
    
    echo("pMp6X", pMp6X);
    echo("pMd6", pMd6);
    echo("grez6", grez6);
     //CKpMp5X=(pMgrooveC3-(CKpMgrooveD/2)+(CKpMgrooveturnR*cos(asin(((CKpMd6)*(CKpMp6X/CKpMd6))/CKpMgrooveturnR))-CKpMgrooveturnR))/(1/cos(90-CKpMcutA));
    //CKpMp5X=(pMgrooveC3-(sin(CKpMcutA)*CKpMgrooveturnR))*tan(CKpMcutA)

//5    
    pMh5s=pMh6e;
    pMh5e=0;        //(pMgrooveD/2)
    pMp5X=(pMh5s-pMh5e)*tan(90-pMcutA);
    pMd5=pMp5X/glnd;            //?too many degrees?
    grez5=pMd5/grez/(pMp5X/(pMID*PI));
    pMd5s=pMd7+pMd6;
    pMd5e=pMd7+pMd6+pMd5;

    
    echo("pMgrooveC3", pMgrooveC3);
    echo("pMp5X", pMp5X);
    echo("pMd5", pMd5);
    echo("grez5", grez5);    



//4    
    pMh4e=pMgrooveC2-(pMgrooveD/2);
    
    pMp55X=(pMgrooveturnR2*tan(90-pMcutA))-(pMgrooveturnR2*sin(90-pMcutA))+(pMh4e/tan(90-pMcutA));
    pMd55=pMp55X/glnd;

    pMp4X=cos(pMcutA)*pMgrooveturnR2;
    pMd4=pMp4X/glnd;    
    pMd4s=pMd7+pMd6+pMd5-pMd55;
    pMd4e=pMd7+pMd6+pMd5-pMd55+pMd4;
    function func4(i) = -(pMgrooveturnR2*cos(asin(((pMd4e-i)*(pMp4X/pMd4))/pMgrooveturnR2))-pMgrooveturnR2);
    pMh4s=func4(pMd4s);

//3    
    pMp3X=2.5;          //length of lower plateu of groove  2.5 
    pMd3=pMp3X/glnd; //number of degrees for groove section 3
    pMd3s=pMd4e;                          //degree turn to center of groove
    pMd3e=pMd4e+pMd3;                       //highest degree turn for section 7
    pMh3s=pMh4e;   //height of center of groove
    pMh3e=pMh4e;

//2    

    
//    pMp55X=(pMgrooveturnR2*tan(90-pMcutA))-(pMgrooveturnR2*sin(90-pMcutA))+(pMh4e/tan(90-pMcutA));
//    pMd55=pMp55X/glnd;

    pMp2X=cos(pMcutA)*pMgrooveturnR2;
    pMd2=pMp2X/glnd;    
    pMd2s=pMd3e;
    pMd2e=pMd3e+pMd2;
    function func2(i) = -(pMgrooveturnR2*cos(asin(((i-pMd2s)*(pMp2X/pMd2))/pMgrooveturnR2))-pMgrooveturnR2);
    pMh2e=pMh3e+func2(pMd2s);
    pMh2s=pMh3e;



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
        
        mirror([1,0,0]){
        rotate([0,0,(pMd7+pMd6+pMd5+pMd4+pMd3+pMd2+pMd1-pMd0+pMshelfHole1d)])
        translate([0,(pMID/2)+(pMshelfBoltD)+pMgroove,0])
        cylinder(d=pMshelfBoltD, h=pMH, $fn=36);
        
        rotate([0,0,(pMd7+pMd6+pMd5+pMd4+pMd3+pMd2+pMd1-pMd0+pMshelfHole2d)])
        translate([0,(((c2ID+(pMgroove*2)+(pMwallT*2))/2)/cos((pMd7+pMd6+pMd5+pMd4+pMd3+pMd2+pMd1-pMd0+pMshelfHole2d)))-(pMshelfBoltD*1.5),0])
        cylinder(d=pMshelfBoltD, h=pMH, $fn=36);
            
        }
        //
        //////
        
        
    } //end main body diffference    
    
    /////START GROOVE CUTS/////
    
    //7    
    for(i=[pMd7s:gdeg:pMd7e]){
            translate([0,0,pMh7s])
            rotate([270,0,i])
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
    }//end 7 for
    
    //6
    for(i=[pMd6s:gdeg:pMd6e]){
            translate([0,0,pMh7s+func6(i)])
            rotate([270,0,i])
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
    }//end 6 for
    
    //5
    for(i=[pMd5s:gdeg:pMd5e]){
            translate([0,0,pMh7s+func6(pMd6e)-(tan(pMcutA)*(i-pMd5s)*glnd)])    /////needs work
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
    }//end 5 for
    
    //4
    for(i=[pMd4s:gdeg:pMd4e]){
            translate([0,0,func4(i)+pMh4e])
            rotate([270,0,i])
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
    }//end 4 for

    //3
    for(i=[pMd3s:gdeg:pMd3e]){
            translate([0,0,pMh4e])
            rotate([270,0,i])
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
    }//end 3 for    
    
    //2    
    for(i=[pMd2s:gdeg:pMd2e]){
            translate([0,0,func2(i)+pMh2s])
            rotate([270,0,i])
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
    }//end 6 for
    
    } //end main translate
} //end CKpM module