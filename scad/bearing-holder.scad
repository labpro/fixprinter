module bearing_holder(){

  // Major Definitions      {
  bearing_length   = 50;
  bearing_diameter = 16;
  rod_diameter     = 8;
  radius         = bearing_diameter/2;
  base           = 2;
  gap            = 6;
  cover          = 2;
  width          = 2*gap+bearing_diameter;
  height         = radius+base;
  echo(width);
  // }
  // Nut Definitions        {
  nut_offset  = cover;
  nut_apothem = (105/100)*5.2/2;
  nut_inner_d = (105/100)*2.7;   
  // }

  holder();

  module holder(){
    //color("yellow",0.15)
    difference(){
      union(){
        n = 250;
        shape(r=radius,n=n);
        coverup(n=n);
        coverdown(n=n);
      }
      holes();
    }
    color("red",0.5 ) bearing();
    color("blue",0.5) rod();
  }

  module cover(n=6){
    apothem = (135/100)*rod_diameter/2;
    shape(r=apothem,h=cover,n=n);
  }
  module coverup(n=6){
    tz(bearing_length)
    cover(n);

  }
  module coverdown(n=6){
    tz(-cover)
    cover(n);

  }

  module shape(h=bearing_length,r,n=6){
    size = width*I+height*J+h*K;
    apothem = r;
    r = RadiusGivenApothem(apothem,n);

    difference(){
      cblock(size);
      cylinder(r=r,h=h,$fn=n);
    }
  }

  module bearing(){
    cylinder(r=radius,h=bearing_length,$fn=250);
  }
  module rod(){
    cylinder(r=rod_diameter/2,h=10*bearing_length,center=true,$fn=250);
  }

  module holes(){
    r = RadiusGivenApothem(nut_apothem,6);
    n = 50;

    d1 = +(radius+gap/2)*I+r*K;
    d2 = +(radius+gap/2)*I+(bearing_length-r)*K;
    d3 = -(radius+gap/2)*I+r*K;
    d4 = -(radius+gap/2)*I+(bearing_length-r)*K;

    m1 = (d1+d2)/2;
    m2 = (d3+d4)/2;
    
    translate(d1) nut1();
    translate(d2) nut1();
    translate(d3) nut1();
    translate(d4) nut1();

    translate((d1+m1)/2) nut2();
    translate((d3+m2)/2) nut2();
    translate((d2+m1)/2) nut2();
    translate((d4+m2)/2) nut2();

    cutoff2();

    module nut1(){
      ry(30)
      rx(-90)
      cylinder(r=r,h=radius,$fn=6);

      rx(-90)
      cylinder(
        r=nut_inner_d/2,
        h=10*radius,
        center=true,$fn=100);
    }

    module nut2(){
      ty(radius+base)
      mirror(J) nut1();
    }

    module cutoff(){
      size = (50/100)*[bearing_diameter,100,bearing_length];
      translate((d1+d4)/2)
      cblock(size,center=1);
    }
    module cutoff2(){
      size = [bearing_diameter/2,100,bearing_length/4];
      translate((d3+m1)/2)
      cblock(size,center=1);
      translate((d2+m2)/2)
      cblock(size,center=1);
    }
  }
  
}
module bearing_holder_old(){

  // Major Definitions      {
  length      = 25;
  bearing_diameter    = 16;
  radius      = bearing_diameter/2;
  base_h      = 3;
  gap_x       = 3;
  clamp_t     = 4;
  m           = 0/100;
  cover_t     = 4;
  height      = length+2*cover_t;
  // }
  // Nut Definitions        {
  nut_offset  = 3;
  nut_offset  = cover_t;
  nut_apothem = (100/100)*6/2;
  nut_inner_d = 1.5;   
  // }
  // Screw Definitions      {
  screw_type   = "conic";    
  screw_head_d = 4;          
  screw_head_h = 4;          
  screw_body_d = 4;          
  screw_body_h = 4;          
                             
  screw_values = [           
      screw_head_d,          
      screw_head_h,          
      screw_body_d,          
      screw_body_h           
    ];                       
  // }                       
  // Base Shape Definitions {
  ab = radius + base_h;
  bc = gap_x;
  cd = m*radius;
  de = clamp_t+radius;
  af = bc+de;

  echo(2*af);

  i = [1,0];
  j = [0,1];

  A = [-af,0];
  B = A+ab*j;
  C = B+bc*i;
  D = C+cd*j;
  E = D+de*i;
  F = A+af*i;
  // }

  holder();

  module holder(){
    difference(){
      %shape();
      union(){
        #bearing(110);
        cutoff();
        nuts();
      }
    }
  }

  module shape(){

    points = [A,B,C,D,E,F];

    linear_extrude(height)
    polygon(points);

    mirror(I)
    linear_extrude(height)
    polygon(points);

  }
  module bearing(n=10){
    tz(cover_t)
    ty(ab)
    union(){
      tz(-cover_t)
      cylinder(r=(75/100)*radius,h=height,$fn=n);
      cylinder(r=Aapothem(radius,n),h=length,$fn=n);
    }
  }
  module cutoff(){

    l = (50/100)*length;

    size = 2*de*I+cd*J+l*K;


    ty(ab)
    tz(height/2)
    cblock(size,cz=1);
    
  }
  module nuts(){
    r = RadiusGivenApothem(nut_apothem,6);
    n = 50;

    d1 = (af-(gap_x+clamp_t)/2)*I+nut_offset*K;
    d2 = -d1*I*I+nut_offset*K;
    d3 = d1+length*K;
    d4 = d2+length*K;

    m1 = (d1+d3)/2;
    m2 = (d2+d4)/2;

    nut(n,d1);
    *nut(n,d2);
    *nut(n,d3);
    *nut(n,d4);

    *nut(n,m1,inverse=1);
    *nut(n,m2,inverse=1);

    module nut(n=10,d=O,inverse=0){
      if(inverse){
        translate(d)
        ry(30)
        rx(-90){
          cylinder(r=r,h=base_h,$fn=6);
          tz(base_h)
          cylinder(r=nut_inner_d/2,h=radius+cd,$fn=n);
        }
      }
      else{
        translate(d+base_h*J)
        ry(30)
        rx(-90){
          cylinder(r=r,h=radius+cd,$fn=6);
          tz(-base_h)
          cylinder(r=nut_inner_d/2,h=base_h,$fn=n);
        }
      }
    }
  }











}
