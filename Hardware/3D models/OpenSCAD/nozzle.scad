difference(){
    union(){
        cylinder(h = 4, d = 9, $fn = 6); 
        translate([0,0,4])
        cylinder(h = 4, d1 = 9, d2 = 1.5, $fn =  100);
    }
    translate([0,0,3])
    union(){
        difference(){
            cylinder(h = 5, d = 10, $fn = 100); 
            cylinder(h = 5, d = 9, $fn = 6);   
        }
    }
}
translate([0,0,-5])
cylinder(h = 5, d = 6, $fn = 100);
    