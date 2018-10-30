
all:
	@openscad -o stl/main.stl scad/main.scad

openmain:
	@openscad scad/main.scad &
