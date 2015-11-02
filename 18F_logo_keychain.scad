$fn=100;

logo_height = 1;
box_height = 1;

module logo18F(){
    //align just to the right of the Y axis
    translate([1, 0, 0]){
        
        // make the '1'
        cube([.35, 5, logo_height]);
        translate([-.8, 4.65, 0])
            cube([.8, .35, logo_height]);
        
        // make the '8'
        translate([2.8, 1.7, 0])
            difference(){
                cylinder(h=logo_height, r=1.675);
                cylinder(h=logo_height, r=1.325);
            }
        translate([2.8, 4.1, 0])
            difference(){
                cylinder(h=logo_height, r=1.05);
                cylinder(h=logo_height, r=0.7);
            }
        
        // make the 'F'
        translate([5, 0, 0])
            cube([.35, 5, logo_height]);        
        translate([5.35, 1.8, 0])
            cube([1.25, .35, logo_height]);        
        translate([5.35, 4.65, 0])
            cube([1.25, .35, logo_height]);
    }
}

module keychain(){
    
    difference(){
        translate([-4.5, -1, 0]){
            color([0, 0, 1])
                cube([13+1/3, 13+1/3, box_height]);
        }
        
        union(){
            // remove a square in the upper left hand corner
            translate([-3.5, 9.35, 0])
                cube([2, 2, 2]);
            
        translate([-4.75, 10.75, -.5])
            rotate([0, 0, 50])
                cube([3, 2, 2]);
            
            // imprint the 18F logo
            color([1, 1, 1]){
                translate([0, 0, .2])
                    logo18F();
            }
        }
    }
}


// this scaling allows the model to be imported into shapeways in mm with a resulting size of 2' X 2'
scale([3.7, 3.7, 3.7])
     keychain();


