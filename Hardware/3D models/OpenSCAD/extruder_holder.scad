size = 20;
hole_offset = 0;

color("blue", 1.0){
    //base 
    square(size, center = true);
    // holes
    
    

    //side
    translate([(size/2)-0.5,0,(size/2)-0.5]){
        rotate([0, 90, 0]){
            square(size, center = true);
        }
    }
    
}
