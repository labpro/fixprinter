
include <utils.scad>

include <bearing-holder.scad>

rx(-90)
bearing_holder();






























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
