include <CKvars.scad>;

CKpM(); //mountain

    grez=p2number*p2needles*5;    //number of sides of groove path main circle
    gdeg=360/grez;                //groove rez in fractions of a degree
    glen=(pMID*PI)/grez;          //length of arc of each rez's fraction of a degree
    
    echo(rez);
    echo(grez);
    echo(gdeg);
    echo(glen);
    
    CKpMgrooveturnR=15; //radius of upper curved path in groove
    CKpMgrooveturnR2=8; //radius of lower curved path in groove
    CKpMgrooveD=nC+pMgrooveSlop; //Y plane diamter of groove cut
 
    CKpMp3X=2.5;  //length of flat area of section 3
    CKpMcutRez=2; //cuts per degree
 //   CKpMcutDeg=(((CKpMp7X/2)*360/(PI*CKpMID))/CKpMp7X); //degrees per unit diameter
    CKpMcutcylRez=12;  //number of sides on groove cutting clylinder
    CKpMcutA=45;    //angle of cut path

    CKpMp7X=5;  //half of length of plateu of groove. preferably whole number 
    CKpMd7=(CKpMp7X)/glen; //number of segments for groove7
    gdeg7=gdeg/CKpMd7;     //degrees of section 7
    
    echo(CKpMd7);
    echo(gdeg7);
    
module CKpM(){
translate([0,-p3wallOD/2,0]){
difference(){
//main cylinder
cylinder(d=pMOD,h=pMH,$fn=rez);    
cylinder(d=pMID,h=pMH+1,$fn=rez);    

        //7
        for(i=[0:(gdeg7):CKpMd7]){

            translate([0,0,pMgrooveC3-(CKpMgrooveD/2)])
            rotate([270,0,i])
            #cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);

        }//end fors
        
} //end main difference
} //end main translate
}  //end main module
    