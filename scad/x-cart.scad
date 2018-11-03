

module xcart(){

  thickness      = 7;
  gap            = 6;
  cover          = 2;
  nut_apothem = (116/100)*5.2/2;
  nut_inner_d = (180/100)*2.7;   
  nut_radius  = RadiusGivenApothem(nut_apothem,6);
  bearing_diameter = 16;
  bearing_radius   = bearing_diameter/2;

  middle_diameter = 4.5;

  mirror(K)
  difference(){
    base_shape();
    union(){
      ty(+45/2) base_holes();
      ty(-45/2) base_holes();
      middle_holes($fn=30);
      belt_holes();
      cutoff(y=20);
      ty(+45/2) cutoff(50);
      ty(-45/2) cutoff(50);
    }
  }

  module base_holes(){

    gx = cover+nut_radius;
    gy = gap/2;
    
    m1 = +(14-gy)*J;
    m2 = -(14-gy)*J;

    d1 = m1+(54/2-gx)*I;
    d2 = m2+(54/2-gx)*I;
    d3 = -d2;
    d4 = -d1;
    d5 = (d1+m1)/2;
    d6 = (d3+m1)/2;
    d7 = (d2+m2)/2;
    d8 = (d4+m2)/2;

    translate(d1) c(inverted=1);
    translate(d2) c(inverted=1);
    translate(d3) c(inverted=1);
    translate(d4) c(inverted=1);
    translate(d5) c(inverted=1);
    translate(d6) c(inverted=1);
    translate(d7) c(inverted=1);
    translate(d8) c(inverted=1);


    
  }
  module c(head_d=7,h=thickness,inverted=0,type="squared"){
    
    head_h = 3;
    body_d = nut_inner_d/2;
    body_h = thickness-head_h;

    if(inverted == 1){
     screw(type,[body_d,body_h,head_d,head_h],$fn=30); 
    }
    else{
     screw(type,[head_d,head_h,body_d,body_h],$fn=30); 
    }

    

    *cylinder(
      r=nut_inner_d/2,
      h=h,
      center=true,$fn=100);
  }
  module base_shape(){
    cblock(58*I+73*J+thickness*K,cy=1);
    
  }
  module middle_holes(){
    r=middle_diameter/2;
    tx(+24) cylinder(r=r,h=thickness);
    tx(-24) cylinder(r=r,h=thickness);
    
  }
  module belt_holes(){
    y = 5.5;
    x = 14.5;

    ty(+y) tx(+x) c(inverted=1);
    ty(-y) tx(-x) c(inverted=1);
    mirror(J){
    ty(+y) tx(+x) c(inverted=1);
    ty(-y) tx(-x) c(inverted=1);
    }
    
  }

  module cutoff(x=10,y=10){
    size = x*I+y*J+thickness*K;
    cblock(size,cy=1);
  }

}

