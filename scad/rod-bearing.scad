
module rod_bearing_holder(){
  thick = 3;
  height = 6;

  $fn=100;
  rod_diameter = 8;
  ext_diameter = (100/100)*10*in/16;
  in_diameter  = 8*in/16;
  bearing_height = 3*in/16;

  ext_radius   = ext_diameter/2;
  in_radius    = in_diameter/2;

  r = ext_radius+thick;

  difference(){
    shape();
    holes();
  }
  module shape(){
    hull(){
      cylinder(r=r,h=height);
      tx(17)
      cylinder(r=0.85*r,h=height);
    }
  }

  module holes(){
    r = ext_radius;
    h = bearing_height;
    tz(height-h)
    cylinder(r=r,h=h);
    cylinder(r=in_radius,h=100);
    tx(17)
    cylinder(r=rod_diameter/2,h=100);
  }
  
  
}
