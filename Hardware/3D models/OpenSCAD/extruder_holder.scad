size = 20;
hole_offset = 0;

color("blue", 1.0){
    square(size, center = true);
    
    translate([9.5,0,9.5]){
        rotate([0, 90, 0]){
            square(size, center = true);
        }
    }
}
