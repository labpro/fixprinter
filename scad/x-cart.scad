

module xcart(){

  thickness      = 5;
  gap            = 6;
  cover          = 2;
  nut_apothem = (116/100)*5.2/2;
  nut_inner_d = (105/100)*2.7;   
  nut_radius  = RadiusGivenApothem(nut_apothem,6);
  bearing_diameter = 16;
  bearing_radius   = bearing_diameter/2;

  mirror(K)
  difference(){
    base_shape();
    union(){
      ty(+45/2) base_holes();
      ty(-45/2) base_holes();
      middle_holes();
      belt_holes();
      cutoff();
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
  module c(head_d=5,h=thickness,inverted=0,type="squared"){
    
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
    cblock(60*I+73*J+thickness*K,cy=1);
    
  }
  module middle_holes(){
    head_d = RadiusGivenApothem(8/2,6);
    tx(+24) c(head_d=head_d,type="hexagon");
    tx(-24) c(head_d=head_d,type="hexagon");
    
  }
  module belt_holes(){

    ty(+6) tx(+24) c(inverted=1);
    ty(-6) tx(-24) c(inverted=1);
    mirror(J){
    ty(+6) tx(+24) c(inverted=1);
    ty(-6) tx(-24) c(inverted=1);
    }
    
  }

  module cutoff(x=30){
    size = x*I+10*J+thickness*K;
    cblock(size,cy=1);
  }

}

