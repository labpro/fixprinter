

module xcart_test(){
  rod_dist = 45;
  rod_d    = 8;
  rod_l    = 8;
  rod_wx   = 3;
  rod_wy   = 4;

  length = 40;


  size = (rod_d+2*rod_wx)*I+
         (rod_dist+rod_d+2*rod_wy)*J+
         length*K;

  %cblock(size,cy=1);
  rods();

  module rods(){
    
    r = rod_d/2;
    h = rod_l;
    d = rod_dist/2;
    
    
    ty(+d)
    cylinder(r=r,h=h);

    ty(-d)
    cylinder(r=r,h=h);
  }

         






}













module xcart(){

  size = 64*I+81*J/2+7*K;

  screw_hole_diameter = (115/100)*3*in/32 ;
  screw_hole_diameter = (25/100)*3*in/32 ;

  part();
  mirror(J)
  part();
  module part(){
    difference(){
      cblock(size);
      union(){

        hole();
        mirror(I)
        hole();
      }
    }
  }

  module hole(){

    A = 31*I/2 + 47*J/2;


    translate(A+14*J)
    cylinder(r=screw_hole_diameter/2,h=7,$fn=10);
    translate(A-14*J)
    cylinder(r=screw_hole_diameter/2,h=7,$fn=10);

    r = 0.5;
    translate(24*I)
    cylinder(r=r,h=7,$fn=10);

    translate(-24*I)
    cylinder(r=r,h=7,$fn=10);

  }





}

