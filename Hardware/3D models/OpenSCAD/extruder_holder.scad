square_size = 40;
hole_offset = 0;
circle_size = 4.55;


difference(){
color("blue", 1.0){
    //base 
    square(square_size, center = true);


    

    //side
    translate([(square_size/2)-0.5,0,(square_size/2)-0.5]){
        rotate([0, 90, 0]){
            square(square_size, center = true);
        }
    }
    
}
    // holes base
    color("yellow", 1.0){
        for(i = [0:2]){
            rotate([0,0,120*i])
            translate([11.5,0,0])
            circle(circle_size, $fn = 100);       
        }
     // holes side
        translate([(square_size/2)-0.5,0,(square_size/2)-0.5])
        rotate([0,90,0])
        
        
        for(i = [0:2]){
            rotate([0,0,120*i+30])
            translate([0,11.5,0])
            circle(circle_size, $fn = 100);       
        }
          
    }
}