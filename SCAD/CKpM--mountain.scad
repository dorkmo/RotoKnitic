include <CKvars.scad>;

//TO DO//
//*re do mounting tabs
//*add integrated yarn feeder based on needle height
//*function func6 not right? working with 45 angle but not others
//*pMd4 not placing groove properly when not at 45 degrees
//*make ends more square?
///////

CKpM(); //render mountain

module CKpM(){
    translate([0,-p3wallOD/2,0]){ //main translate
        union(){
    difference(){
        translate([0,0,pMH/2])
        //main cube
        translate([0,(c2ID+(pMgroove*2)+(pMwallT*2))/4,0])
        cube([c2ID+(pMgroove*2)+(pMwallT*2),(c2ID+(pMgroove*2)+(pMwallT*2))/2,pMH], center=true);
        //main ID cut
        cylinder(d=pMID,h=pMH+1,$fn=rez);
        
//        //c3 groove - add cut in center of mountain for a little tab 1" wide?
//        translate([0,0,pPspace2-cWiggle])
//        difference(){
//            cylinder(d=c3OD,h=c3H+cWiggle,$fn=rez);
//            cylinder(d=(c2ID+(pMgroove*2)+(pMwallT*2)),h=c3H+cWiggle,$fn=rez);
//        }
        
        //////
        //angled cut ends
        //*need to calc pMd0 exactly so height of path entrance matches bottom of top plate
        rotate([0,0,(pMd1e-pMd0)])
        translate([-pMshelfX,0,0])
        mirror([1,0,0])
        cube([pMID*4,pMID*4,pMH]);
        
        mirror([1,0,0])
        rotate([0,0,(pMd1e-pMd0)])
        translate([-pMshelfX,0,0])
        mirror([1,0,0])
        cube([pMID*4,pMID*4,pMH]);
        //
        //////
        
        //////
        //ends' angled cut with shelf
        rotate([0,0,(pMd1e-pMd0)])
        mirror([1,0,0])
        cube([pMID*4,pMID*4,pPspace2+pPplate2]);
        mirror([1,0,0])
        rotate([0,0,(pMd1e-pMd0)])
        mirror([1,0,0])
        cube([pMID*4,pMID*4,pPspace2+pPplate2]);
        //
        //////

//////
//90 degree end cut test
translate([((c2ID+(pMgroove*2)+(pMwallT*2))/2)*cos(90-(pMd1e-pMd0)),0,0])
cube([pMID*4,pMID*4,pPspace2+pPplate2]); //below shelf
//translate([((c2ID+(pMgroove*2)+(pMwallT*2))/2)*cos(90-(pMd1e-pMd0)),0,pPspace2+pPplate2+pMshelfH])
//cube([pMID*4,pMID*4,pMH]); //above shelf
translate([(((sin(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)))+((cos(pMd1e-pMd0)*(((pMshelfX-pMshelfchamfR)/2)+pMshelfchamfR)))+((pMshelfX-pMshelfchamfR)/2)),0,pPspace2+pPplate2])
cube([pMID*4,pMID*4,pMH]); //of shelf


        mirror([0,0,0])
        translate([(sin(pMd1e-pMd0)*((pMID/2))),0,pPspace2+pPplate2+pMshelfH])
        minkowski(){
        translate([pMshelfchamfR,0,pMshelfchamfR])    
        cube([pMID*4,pMID*4,pMH]);
        sphere(r=pMshelfchamfR,$fn=100);
        } //end minkowski

        mirror([1,0,0])
translate([-(cos(45)*((pMshelfX-pMshelfchamfR)/2)),sin(45)*((pMshelfX-pMshelfchamfR)/2),0])
translate([-(sin(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)),(cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)),0])
            translate([-(cos(pMd1e-pMd0)*(((pMshelfX-pMshelfchamfR)/2)+pMshelfchamfR)),-(sin(pMd1e-pMd0)*(((pMshelfX-pMshelfchamfR)/2)+pMshelfchamfR)),0])
            translate([0,(((((c2ID+(pMgroove*2)+(pMwallT*2))/2)/cos(pMd1e-pMd0))-((pMID/2)+(pMshelfBoltD)+pMgroove))/1.5),0])
rotate([0,0,-45])
        translate([-pMID/2,0,0])

        cube([pMID,pMID,pMH],center=true);    


//end 90 cut right
///////        


//////
//90 degree end cut test 2
        mirror([1,0,0]){
translate([((c2ID+(pMgroove*2)+(pMwallT*2))/2)*cos(90-(pMd1e-pMd0)),0,0])
cube([pMID*4,pMID*4,pPspace2+pPplate2]); //below shelf
//translate([((c2ID+(pMgroove*2)+(pMwallT*2))/2)*cos(90-(pMd1e-pMd0)),0,pPspace2+pPplate2+pMshelfH])
//cube([pMID*4,pMID*4,pMH]); //above shelf
translate([(((sin(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)))+((cos(pMd1e-pMd0)*(((pMshelfX-pMshelfchamfR)/2)+pMshelfchamfR)))+((pMshelfX-pMshelfchamfR)/2)),0,pPspace2+pPplate2])
cube([pMID*4,pMID*4,pMH]); //of shelf


        mirror([0,0,0])
        translate([(sin(pMd1e-pMd0)*((pMID/2))),0,pPspace2+pPplate2+pMshelfH])
        minkowski(){
        translate([pMshelfchamfR,0,pMshelfchamfR])    
        cube([pMID*4,pMID*4,pMH]);
        sphere(r=pMshelfchamfR,$fn=100);
        } //end minkowski

        mirror([1,0,0])
translate([-(cos(45)*((pMshelfX-pMshelfchamfR)/2)),sin(45)*((pMshelfX-pMshelfchamfR)/2),0])
translate([-(sin(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)),(cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)),0])
            translate([-(cos(pMd1e-pMd0)*(((pMshelfX-pMshelfchamfR)/2)+pMshelfchamfR)),-(sin(pMd1e-pMd0)*(((pMshelfX-pMshelfchamfR)/2)+pMshelfchamfR)),0])
            translate([0,(((((c2ID+(pMgroove*2)+(pMwallT*2))/2)/cos(pMd1e-pMd0))-((pMID/2)+(pMshelfBoltD)+pMgroove))/1.5),0])
rotate([0,0,-45])
        translate([-pMID/2,0,0])

        cube([pMID,pMID,pMH],center=true);    

    }//end mirror
//end 90 cut
///////  



//////
        //try ....
        //from (pMd1e-pMd0) at min wall thickness, cut 45 degrees


//////
//45 shelf cut versions two   
/*    
        rotate([0,0,(pMd1e-pMd0)])
        translate([
        -(((pMshelfX-pMshelfchamfR)/2)+pMshelfchamfR),
        ((pMID/2)+(pMshelfBoltD)+pMgroove)+(((((c2ID+(pMgroove*2)+(pMwallT*2))/2)/cos(pMd1e-pMd0))-((pMID/2)+(pMshelfBoltD)+pMgroove))/1.5),
        (pMH/2)])
        rotate([0,0,-(pMd1e-pMd0)])
        translate([-cos(45)*(((pMshelfX-pMshelfchamfR-pMshelfBoltD)/2)+(pMshelfBoltD/2)),sin(45)*(((pMshelfX-pMshelfchamfR-pMshelfBoltD)/2)+(pMshelfBoltD/2)),0])
        rotate([0,0,-45]) 
        translate([-pMID/2,0,0])
        rotate([0,0,0]) //45
        cube([pMID,pMID,pMH],center=true);
        */
//end left side 45 cut
//////


        
        //////
        //mounting bolt holes
            //1
translate([-(sin(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)),(cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)),0])
            translate([-(cos(pMd1e-pMd0)*(((pMshelfX-pMshelfchamfR)/2)+pMshelfchamfR)),-(sin(pMd1e-pMd0)*(((pMshelfX-pMshelfchamfR)/2)+pMshelfchamfR)),0])
cylinder(d=pMshelfBoltD, h=pMH, $fn=36);
            //2
translate([-(sin(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)),(cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)),0])
            translate([-(cos(pMd1e-pMd0)*(((pMshelfX-pMshelfchamfR)/2)+pMshelfchamfR)),-(sin(pMd1e-pMd0)*(((pMshelfX-pMshelfchamfR)/2)+pMshelfchamfR)),0])
            translate([0,(((((c2ID+(pMgroove*2)+(pMwallT*2))/2)/cos(pMd1e-pMd0))-((pMID/2)+(pMshelfBoltD)+pMgroove))/1.5),0])
#cylinder(d=pMshelfBoltD, h=pMH, $fn=36);
                
        
        mirror([1,0,0]){
            //1
translate([-(sin(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)),(cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)),0])
            translate([-(cos(pMd1e-pMd0)*(((pMshelfX-pMshelfchamfR)/2)+pMshelfchamfR)),-(sin(pMd1e-pMd0)*(((pMshelfX-pMshelfchamfR)/2)+pMshelfchamfR)),0])
cylinder(d=pMshelfBoltD, h=pMH, $fn=36);
            //2
translate([-(sin(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)),(cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)),0])
            translate([-(cos(pMd1e-pMd0)*(((pMshelfX-pMshelfchamfR)/2)+pMshelfchamfR)),-(sin(pMd1e-pMd0)*(((pMshelfX-pMshelfchamfR)/2)+pMshelfchamfR)),0])
            translate([0,(((((c2ID+(pMgroove*2)+(pMwallT*2))/2)/cos(pMd1e-pMd0))-((pMID/2)+(pMshelfBoltD)+pMgroove))/1.5),0])
#cylinder(d=pMshelfBoltD, h=pMH, $fn=36);
                
        } //end mirror
        //end of bolt holes
        //////////////

//    } //end main body diffference    
    
///////////////////GROOVE PATH/////////

        //left needle path cut
 needlepathLEFT();
            
        //right needle path cut
 mirror([1,0,0]) 
 needlepathLEFT();   


        } //end main body diffference    //move line above grooves to see paths
    translate([0,0,pPspace2]){     
  difference(){
   
        translate([0,(c2ID+(pMgroove*2)+(pMwallT*2))/4,(pPplate2/2)])
        cube([c2ID+(pMgroove*2)+(pMwallT*2),(c2ID+(pMgroove*2)+(pMwallT*2))/2,pPplate2], center=true);

        
        cylinder(d=pMID,h=pPplate2,$fn=rez);

        //90 degree cut
        translate([((c2ID+(pMgroove*2)+(pMwallT*2))/2)*cos(90-(pMd1e-pMd0)),0,0])
            cube([pMID*4,pMID*4,pPplate2]); //below shelf
        mirror([1,0,0])
        translate([((c2ID+(pMgroove*2)+(pMwallT*2))/2)*cos(90-(pMd1e-pMd0)),0,0])
            cube([pMID*4,pMID*4,pPplate2]); //below shelf
      
        //cut to end of groove  flip 180
        difference(){            
        rotate([0,0,(pMd1e-pMd0)])
        mirror([0,0,0])
        cube([pMID*4,pMID*4,pPplate2]);
        cube([pMID*4,pMID*4,pPplate2]);        
            }
        difference(){
        mirror([1,0,0])
        rotate([0,0,(pMd1e-pMd0)])
        mirror([0,0,0])
        cube([pMID*4,pMID*4,pPplate2]);
        mirror([1,0,0])    
        cube([pMID*4,pMID*4,pPplate2]);
        }
            
                }//end diff
        } //end translate
        
        
        
        
    } //end main union
    } //end main translate
} //end CKpM module



module needlepathLEFT(){
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
        hull(){
            translate([0,0,func4(i)+pMh4e])
            rotate([270,0,i])
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
        if(i<=pMd5e){
            translate([0,0,pMh7s+func6(pMd6e)-(tan(pMcutA)*(i-pMd5s)*glnd)])
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
        }
        else{
            translate([0,0,0])  
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);    
        }
    } //end hull        
    }//end 4 for

    //3
    for(i=[pMd3s:gdeg:pMd3e]){
        hull(){
            translate([0,0,pMh4e])
            rotate([270,0,i])
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
        if(i<=pMd5e){
            translate([0,0,pMh7s+func6(pMd6e)-(tan(pMcutA)*(i-pMd5s)*glnd)])
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
        }
        else{
            translate([0,0,0])  
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);    
        }
    } //end hull
    }//end 3 for    

    //2    
    for(i=[pMd2s:gdeg:pMd2e]){
        hull(){
            translate([0,0,func2(i)+pMh2s])
            rotate([270,0,i])
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
        if(i<=pMd5e){
            translate([0,0,pMh7s+func6(pMd6e)-(tan(pMcutA)*(i-pMd5s)*glnd)])
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
        } //end if
        else{        
            translate([0,0,0])    
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);       
        } //end else
    } //end hull
    }//end 2 for
    
    //1
    for(i=[pMd1s:gdeg:pMd1e]){
        hull(){        
            translate([0,0,pMh2s+func2(pMd2e)+(tan(pMcutA)*(i-pMd1s)*glnd)])    /////needs work
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
        if(i<=pMd5e){
            translate([0,0,pMh7s+func6(pMd6e)-(tan(pMcutA)*(i-pMd5s)*glnd)])
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
        } //end if
        else{   
            translate([0,0,0])  
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);        
        } //end else
    }//end hull
    }//end 1 for            
    
} //end left needle groove module
     