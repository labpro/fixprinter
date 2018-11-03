
module calibration(){
  a = 1*50;
  b = 1*5;
  base_h = 2;
  
  s1 = a*I+b*JK;
  s2 = a*J+b*IK;
  s3 = a*K+b*IJ;
  s4 = a*IJ+base_h*K;
  
  cube(s1);
  cube(s2);
  cube(s3);
  difference(){
    cube(s4);
    translate(a*IJ/2)
    union(){
      cylinder(r=-b+a/2,h=base_h,$fn=300);

      *cube(a*IJ/2+base_h*K);
    }
  }
}
