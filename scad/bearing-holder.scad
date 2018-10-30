module bearing_holder(){

  // Major Definitions      {
  length      = 25;
  diameter    = 16;
  radius      = diameter/2;
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
