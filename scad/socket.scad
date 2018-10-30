
module socket(){

  d1 = 8.2;
  d2 = 5.2;

  h  = 20;
  r  = 10;
  screw_d = 3.3;

  $fn = 250;

  difference(){
    cylinder(r=r,h=h);

    union(){
      tz(h/2)
      cylinder(r=d1/2,h=h/2);
      cylinder(r=d2/2,h=h/2);

      size = 6.1*I+2.6*J+h*K;
      

      
      tz(h/4)
      screws();

      tz(3*h/4)
      screws();
      
      for(i=[0:1])
      {
        rz(i*180)
        ty(r-max(d1,d2)/2)
        cblock(size,cy=1);
      }
    }

  }
  module screws(){
    rx(90)
    cylinder(r=screw_d/2,h=2*r,center=true);
    ry(90)
    cylinder(r=screw_d/2,h=2*r,center=true);
  }



}
