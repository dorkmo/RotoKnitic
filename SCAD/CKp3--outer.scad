include <CKvars.scad>;

/*
///////////////////
use <CKneedle.scad>;
rotate([0,0,(360/p2number*p2needles/2)]){
    
translate([0,0,-nB+(pPspace1+pPplate1)])
rotate([0,0,(360/(p2number*p2needles))*1])
translate([(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();
    
translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC1-nC)])
rotate([0,0,(360/(p2number*p2needles))*2])
translate([(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();

translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC2-nC)])
rotate([0,0,(360/(p2number*p2needles))*3])
translate([(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();

translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC3-nC)])
rotate([0,0,(360/(p2number*p2needles))*4])
translate([(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();
}

///////////////////
*/
translate([-p3baseOD/2,0,0])
CKp3();

echo("p3wallH",p3wallH);

module CKp3(){
    
    rez=p2number*p2needles*2;
    //p2number*p2needles*2
    //p2number*2*2;
    
    $fn=rez; //defines resolution of circles.

    centerlineD=p2ID+(p2W+(p3wiggle*2));
       
    echo(centerlineD); 
        
translate([p3baseOD/2,0,0]){
            
difference(){  

  union(){

    cylinder(h=p3baseH,d=p3baseOD);
    cylinder(h=p3base45H,d=p3baseID);
        
            //ridge
translate([0,0,p3base45H])
difference(){
  cylinder(h=p3ridgeH,d=centerlineD-((p2W+(p3wiggle*2)/2)));
  translate([0,0,0])
    cylinder(h=p3ridgeH,d1=centerlineD-(p3ridgeW2*2)-((p2W+(p3wiggle*2)/2)),d2=centerlineD-(p3ridgeW1*2)-((p2W+(p3wiggle*2)/2)));    
}  //end diff
            
difference(){
  translate([0,0,p3baseH])
  cylinder(h=p3wallchamfH,d1=centerlineD+((p3wallchamfW+p3wallW)*2)+((p2W+(p3wiggle*2)/2)),d2=centerlineD+(p3wallW*2)+((p2W+(p3wiggle*2)/2)));
  cylinder(h=p3wallchamfH+p3baseH,d=centerlineD+((p2W+(p3wiggle*2)/2)));
}
            
difference(){                                            
  cylinder(h=p3wallH,d=centerlineD+(p3wallW*2)+((p2W+(p3wiggle*2)/2)));
  cylinder(h=p3wallH,d=centerlineD+((p2W+(p3wiggle*2)/2)));              
}
} //end main union

cylinder(h=p3wallH,d=p3baseID-(p3base45W*2)+1);
cylinder(h=p3base45H,d1=p3baseID,d2=p3baseID-(p3base45W*2));
        
translate([-p3baseOD/2,-p3baseOD/2,0]){    
  cube([p3baseOD,p3baseOD/2,p3wallH]);
}

rotate([0,0,-360/p3number]){
translate([-p3baseOD/2,0,0])    
  cube([p3baseOD,p3baseOD/2,p3wallH]);        
}


//thin wall
translate([0,0,p3grooveH2])
    difference(){
    cylinder(d=p3wallOD,h=p3wallH);
    cylinder(d=p3wallID+(p3upperwallW*2),h=p3wallH);
    cylinder(d1=p3wallOD,d2=p3wallID+(p3upperwallW*2),h=p2holeH-(p9H/2)-p3grooveH2-1);
        
    }


        //slots    
for(i=[1:p2needles*(p2number/p3number)]){
  rotate([0,0,(360/p2number/p2needles/2)-(360/p2number/p2needles*i)]){
  translate([((-centerlineD-(p3wallW*2)-((p2W+(p3wiggle*2)/2)))/2)-0.1,-p3grooveW/2,p3grooveH1-p3grooveHslop])
    cube([p3wallW+0.2,p3grooveW,p3grooveH2-p3grooveH1+(p3grooveHslop*2)]);
  }
}
    
    //base needle holes
difference(){
for(i=[1:p2needles*(p2number/p3number)]){
  rotate([0,0,(360/p2number/p2needles/2)-(360/p2number/p2needles*i)]){
  translate([-(p3wallID/2),-needleWidth/2*p3needleholefactorW,0])
    #cube([(p3wallID/2),needleWidth*p3needleholefactorW,p3base45H]);  //Z = p3base45H
  }
}
difference(){
cylinder(d=p3wallOD,h=p3base45H);
cylinder(d=p3wallID,h=p3base45H);
}
cylinder(d=centerlineD-((p2W+(p3wiggle*2)/2)),h=p3base45H);
}
    
    //base mounting holes
for(i=[1:p3baseholenumber]){
  rotate([0,0,(((360/p3number/p3baseholenumber))/2)-((360/p3number/p3baseholenumber)*i)]){
  translate([-(p3baseOD/2)+p3baseholefromODID,0,0])
    cylinder(h=p3baseH,d=p3baseholeD,$fn=18);
  }
}    
    
  //first and last holes
rotate([0,0,-(360/p2number/p2needles)*2]){
  translate([((-centerlineD-(p3wallW*2)-((p2W+(p3wiggle*2)/2)))/2)-0.1,0,p2holeH])
  rotate([0,90,0]){
    cylinder(h=p2OD-p2ID+0.2, d=p2holeD, $fn=18);
  }
} 
        
rotate([0,0,-(360/(p3number))+((360/p2number/p2needles)*2)]){
  translate([((-centerlineD-(p3wallW*2)-((p2W+(p3wiggle*2)/2)))/2)-0.1,0,p2holeH])
  rotate([0,90,0]){
    cylinder(h=p2OD-p2ID+0.2, d=p2holeD, $fn=18);
  }
} 
    
    //middle holes
for(i=[0:(p2number/p3number)-1]){
  rotate([0,0,(-360/p2number/p2needles)+(i*-360/p2number)]){
    translate([((-centerlineD-(p3wallW*2)-((p2W+(p3wiggle*2)/2)))/2)-0.1,0,p2holeH])
    rotate([0,90,0]){
      cylinder(h=p2OD-p2ID+0.2, d=p2holeD,$fn=18);
    }  //end rotate
  } //end rotate       
} //end for
        
for(i=[0:(p2number/p3number)-1]){
  rotate([0,0,(-360/p2number/p2needles*(p2needles-1))+(i*-360/p2number)]){
    translate([((-centerlineD-(p3wallW*2)-((p2W+(p3wiggle*2)/2)))/2)-0.1,0,p2holeH])
    rotate([0,90,0]){
      cylinder(h=p2OD-p2ID+0.2, d=p2holeD, $fn=18);
    }
  } 
}//end for
    //end middle holes
        

//trim end of part

if(p3number>1){
    rotate([0,0,-(360/(p3baseOD*PI/p3endtrim))])
 mirror([1,1,0])
 #cube([p3baseOD/2,p3baseOD/2,p3wallH]);   
    
}




} //end main difference
} //end main translate
} //end module