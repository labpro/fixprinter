
module screw(head="conic",values=[3,5,1,5]){

  head_d = values[0];
  head_h = values[1];
  body_d = values[2];
  body_h = values[3];


  if(head == "squared")
  {
    translate([0,0,body_h])
    cylinder(r=head_d/2,h=head_h);
    cylinder(r=body_d/2,h=body_h);
  }
  else
  {
    translate([0,0,body_h])
    cylinder(r2=head_d/2,r1=body_d/2,h=head_h);
    cylinder(r=body_d/2,h=body_h);
  }

}
