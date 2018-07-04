include <CKvars.scad>;

CKpM(); //mountain

    rez=p2number*p2needles*2;
    drez=360/(p2number*p2needles*2); //groove rez in fractions of a degree
    dlen=(pMID*PI)/drez; //length of arc of each rez's fraction of a degree
    
    CKpMgrooveturnR=15; //radius of upper curved path in groove
    CKpMgrooveturnR2=8; //radius of lower curved path in groove
    CKpMgrooveD=nC+pMgrooveSlop; //Y plane diamter of groove cut
 
    CKpMp7X=5;  //half of length of plateu of groove. preferably whole number
    CKpMp3X=2.5;  //length of flat area of section 3
    CKpMcutRez=2; //cuts per degree
    CKpMcutDeg=(((CKpMp7X/2)*360/(PI*CKpMID))/CKpMp7X); //degrees per unit diameter
    CKpMcutcylRez=36;  //number of sides on groove cutting clylinder
    CKpMcutA=45;    //angle of cut path
    CKpMd7=(CKpMp7X)/dlen; //number of segments for groove7
    
module CKpM(){
translate([0,-p3wallOD/2,0]){
difference(){
//main cylinder
cylinder(d=pMOD,h=pMH,$fn=rez);    
cylinder(d=pMID,h=pMH,$fn=rez);    

        //7
        for(i=[0:(drez):CKpMd7+(drez)]){
            hull(){
                //odd
        translate([0,0,pMgrooveC3-(CKpMgrooveD/2)])
        rotate([270,0,i-(rez)])
        #cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
                //even
        translate([0,0,pMgrooveC3-(CKpMgrooveD/2)])
        rotate([270,0,i])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
            }//end hull 1
                hull(){
                //even
        translate([0,0,pMgrooveC3-(CKpMgrooveD/2)])
        rotate([270,0,i])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
                //odd
        translate([0,0,pMgrooveC3-(CKpMgrooveD/2)])
        rotate([270,0,i+(0.1)])
        cylinder($fn=CKpMcutcylRez,d=CKpMgrooveD,h=pMgrooveOR);
            }//end hull 2
            
        }//end fors
        
} //end main difference
} //end main translate
}  //end main module
    