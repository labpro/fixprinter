
include <utils.scad>

include <bearing-holder.scad>
include <x-cart.scad>
include <screw.scad>
include <rod-bearing.scad>

*rx(-90)
bearing_holder();

*rod_bearing_holder();
*bearing_holder_clip();

*xcart();

calibration();

module calibration(){
  a = 1*50;
  b = 1*5;
  base_h = 2;
  
  s1 = a*I+b*JK;
  s2 = a*J+b*IK;
  s3 = a*K+b*IJ;
  s4 = a*IJ+base_h*K;
  
  cube(s1);
  cube(s2);
  cube(s3);
  difference(){
    cube(s4);
    translate(a*IJ/2)
    union(){
      cylinder(r=-b+a/2,h=base_h,$fn=300);

      *cube(a*IJ/2+base_h*K);
    }
  }
}




























//include <./utils.scad>
//
//include <./screw.scad>
//include <./bearing-holder.scad>
//include <./x-cart.scad>
//include <./socket.scad>
//include <./bearing.scad>
////include <./bed-cart.scad>
//
//
//bearing_holder();
//*xcart();
//*socket();
//*bearing();
//
//*difference(){
//  
//  side   = 25;
//  height = 50;
//  radius = (side-2)/2;
//  n      = 50;
//  r      = 7;
//
//  cube(side*IJ+height*K,center=true);
//  union(){
//    *cylinder(r=radius,h=height,center=true,$fn=n);
//
//    //d = 40*IJ;
//
//    //translate(d)
//    //cylinder(r=r,h=height,center=true,$fn=n);
//
//    //translate(-d)
//    //cylinder(r=r,h=height,center=true,$fn=n);
//
//    //mirror(J){
//    //  translate(d)
//    //  cylinder(r=r,h=height,center=true,$fn=n);
//
//    //  translate(-d)
//    //  cylinder(r=r,h=height,center=true,$fn=n);
//    //}
//  }
//
//}
