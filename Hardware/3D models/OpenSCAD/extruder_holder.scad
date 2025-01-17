size = 20;
hole_offset = 0;
circle_size = 2;


difference(){
color("blue", 1.0){
    //base 
    square(size, center = true);


    

    //side
    translate([(size/2)-0.5,0,(size/2)-0.5]){
        rotate([0, 90, 0]){
            square(size, center = true);
        }
    }
    
}
    // holes
    color("yellow", 1.0){
        circle(2, $fn = 10);
    }
}