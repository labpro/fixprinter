
module bearing(){
  
  dout  = 16;
  h     = 25;
  din   = 8;
  carve = 1.5;

  n = 4;

  $fn = 250;

  difference(){

    
    d = (101/100)*dout;
    cylinder(r=d/2,h=h);
    
    union(){
      rin = (102.95/100)*din/2;



      cylinder(r=rin,h);

      for(i = [0:2:2*n-2])
      {              
        angle=180/n;
        rz(i*angle)
        sector(rin+carve,angle,h,5);
      }
    }

  }


}
