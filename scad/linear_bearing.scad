
include <utils.scad>

function HolesPositions(d=0) = 
  let(
    ur = d,
    ul = ur - 2*ur*I*I,
    dr = -ul,
    dl = -ur,
    mr = (ur+dr)/2,
    ml = (ul+dl)/2
  ) [ur, ul, dr, dl, mr, ml];

module LBearing(diameter=16,length=25,center=0){
  r = RadiusGivenApothem(diameter/2,$fn);
  
  difference(){
    cylinder(r=r,h=length,center=(center)?true:false);
    holes() children();
  }
}

module Groove(
  number     = 5  ,
  radius     = 2  ,
  length     = 25 ,
  resolution = 5  ,
  center=0
){

  n = number;
  r = radius;
  h = length;
  
  for(i = [0:2:2*n-2])
  {              
    angle=180/n;
    rz(i*angle)
    sector(r,angle,h,resolution,center);
  }
}

module Rod(length=100,diameter=8,center=0){
  h = length;
  r = diameter/2;
  cylinder(r=r,h=h,center=(center)?true:false);
}

module LBearingHolder(
  number = 1  ,
  side   = 6  ,
  base   = 2  ,
  cover  = 3  ,
  radius = 8  ,
  length = 25 ,
  center = 1  ,
){

  x = 2*(side+radius);
  y = number*length+2*cover;
  z = radius+base;
  size = [x,y,z];

  tz(z)
  mirror(K)
  difference(){
    shape();
    holes() children();
  }

  module shape(length=length*number){
    cblock(size,cy=center);
  }
}
  
module LBearingNuts(
  d           = 0,
  nut_apothem = (116/100)*5.2/2,
  nut_inner_d = (150/100)*2.7,   
){

  nut_radius = RadiusGivenApothem(nut_apothem,6);

  LBearingHoles(d);

}

module LBearingHoles(d=0,radius=1,height=100){

  positions = HolesPositions(d);

  ur = positions[0];
  ul = positions[1];
  dr = positions[2]; 
  dl = positions[3]; 
  mr = positions[4]; 
  ml = positions[5]; 

  translate(ur) hole();
  translate(ul) hole();
  translate(dr) hole();
  translate(dl) hole();
              
  translate(mr) hole();
  translate(ml) hole();

  module hole(){
    cylinder(r=radius,h=height,center=true); 
  }
}
