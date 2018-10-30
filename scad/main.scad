
I = [1,0,0];
J = [0,1,0];
K = [0,0,1];

i = [1,0];
j = [0,1];

x = 10;
y = 5;
z = 3;

size = [x,y,z];


ab = 3;
bc = 6;
cd = 3;
de = 7;
ef = ab+cd;
af = bc+de;


A = [-af,0];
B = A + ab*j;
C = B + bc*i;
D = C + cd*j;
E = D + de*i;
F = A + af*i;

P = [A,B,C,D,E,F];

mirror(I) linear_extrude(3) polygon(P);

linear_extrude(3) polygon(P);

































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
