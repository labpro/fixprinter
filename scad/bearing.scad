
module bearing(){
  
  bearing_diameter = (100/100)*16;
  bearing_length   = 25;

  shaft_diameter = 8;
  shaft_length   = 2*bearing_length;
  
  groove_length = (300/1000)*shaft_diameter;
  groove_n      = 3;

  $fn = 500;

  difference(){
    shape();
    holes();
  }

  module shape(){
    r = bearing_diameter/2;
    h = bearing_length;
    cylinder(r=r,h=h);
  }
  module holes(){
    shaft();
    groove();

    module shaft(){
      r = shaft_diameter/2;
      h = shaft_length;
      cylinder(r=r,h=h);
    }
    module groove(){
      n = groove_n;
      r = shaft_diameter/2+groove_length;
      h = shaft_length;

      for(i = [0:2:2*n-2])
      {              
        angle=180/n;
        rz(i*angle)
        sector(r,angle,h,$fn);
      }
    }
  }


}
