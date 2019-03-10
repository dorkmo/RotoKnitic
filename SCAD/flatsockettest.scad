p2p3flatD=3;
p2p3flatHA=90;
p2p3flatHD=6.72;  //listed as 6.72 max 5.54 min
p2p3flatHH=1.86;


c2ID=400;
//AP=(p2p3flatHD/2)
//PB=p2p3flatHD/2
//CD=c2ID

echo(
"CP",
((c2ID+sqrt((-4*(p2p3flatHD/2)*(p2p3flatHD/2))+((c2ID)*(c2ID))))/2)

);

p2p3flatORmax=((c2ID+sqrt((-4*(p2p3flatHD/2)*(p2p3flatHD/2))+((c2ID)*(c2ID))))/2)/2; //maximum radius to be within c2ID

translate([0,0,0])
union(){
cylinder(d1=p2p3flatHD,d2=0,h=(p2p3flatHD/2)/tan(45),$fn=36);
translate([0,0,-(p2p3flatHD)/tan(45)])
cylinder(d1=p2p3flatHD*3,d2=p2p3flatHD,h=(p2p3flatHD)/tan(45),$fn=36);
cylinder(d=p2p3flatD,h=20,$fn=36);
}
translate([p2p3flatD/2,0,0])
cube(p2p3flatHH);