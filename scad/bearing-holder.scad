
  // Major Definitions      {
  bearing_quantity = 2;
  bearing_length   = bearing_quantity*25;
  rod_diameter     = 8;
  bearing_diameter = 16;
  bearing_radius   = bearing_diameter/2;
  base           = 2;
  gap            = 6;
  cover          = 2;
  width          = 2*gap+bearing_diameter;
  height         = bearing_radius+base;
  echo(width);
  // }
  // Nut Definitions        {
  nut_apothem = (116/100)*5.2/2;
  nut_inner_d = (150/100)*2.7;   
  nut_radius  = RadiusGivenApothem(nut_apothem,6);
  // }

module bearing_holder_clip(){

  base  = 3;
  thick = 12;
  height = bearing_radius+base;
  n = 6;
  r = RadiusGivenApothem(bearing_radius,n);

  size = width*I+height*J+thick*K;

  difference(){
    shape();
    holes($fn=100);
  }
  module shape(){
    difference(){
      cblock(size);
      rz(30)
      cylinder(r=r,h=thick,$fn=n);
    }
  }
  module holes(){
    d1 = 3.7;
    d2 = 6;
    
    screw();
    mirror(I)
    screw();
    module screw(){
      tz(thick/2)
      tx((width-gap)/2)
      rx(-90)
      cylinder(r=d1/2,h=100);

      tz(thick/2)
      ty(6)
      tx((width-gap)/2)
      rx(-90)
      cylinder(r=d2/2,h=100);
    }
  }


}
module bearing_holder(){


  holder();
  *bearing();

  module holder(){
    //color("yellow",0.15)
    difference(){
      union(){
        n = 300;
        shape(r=bearing_radius,n=n);
        coverup(n=n);
        coverdown(n=n);
      }
      holes();
    }
    *color("red",0.5 ) bearing();
    *color("blue",0.5) rod();
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
    cylinder(r=bearing_radius,h=bearing_length,$fn=250);
  }
  module rod(){
    cylinder(r=rod_diameter/2,h=10*bearing_length,center=true,$fn=250);
  }

  module holes(){
    r = nut_radius;
    n = 50;

    d1 = +(bearing_radius+gap/2)*I+r*K;
    d2 = +(bearing_radius+gap/2)*I+(bearing_length-r)*K;
    d3 = -(bearing_radius+gap/2)*I+r*K;
    d4 = -(bearing_radius+gap/2)*I+(bearing_length-r)*K;

    m1 = (d1+d2)/2;
    m2 = (d3+d4)/2;
    
    if(bearing_quantity == 2){
      translate(d1) nut1();
      translate(d2) nut1();
      translate(d3) nut1();
      translate(d4) nut1();

      translate((d1+m1)/2) nut2();
      translate((d3+m2)/2) nut2();
      translate((d2+m1)/2) nut2();
      translate((d4+m2)/2) nut2();

      cutoff2();
    }
    else if(bearing_quantity == 1){
      translate(d1) nut1();
      translate(d2) nut1();
      translate(d3) nut1();
      translate(d4) nut1();

      translate(m1) nut2();
      translate(m2) nut2();
      cutoff();
    }

    module nut1(h=bearing_radius){
      
      ry(30)
      rx(-90)
      cylinder(r=r,h=h,$fn=6);

      rx(-90)
      cylinder(
        r=nut_inner_d/2,
        h=10*bearing_radius,
        center=true,$fn=100);
    }

    module nut2(h=height/2){
      ty(bearing_radius+base)
      mirror(J) nut1(h=h);
    }

    module cutoff(){
      size = (50/100)*[bearing_diameter,100,bearing_length];
      translate((d1+d4)/2)
      cblock(size,center=1);
    }
    module cutoff2(){
      size = [bearing_diameter/1.5,100,bearing_length/3.5];
      translate((d3+m1)/2)
      cblock(size,center=1);
      translate((d2+m2)/2)
      cblock(size,center=1);
    }
  }
  
}
