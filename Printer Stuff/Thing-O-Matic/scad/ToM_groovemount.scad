// Thing-O-Matic groovemount

use <MCAD/boxes.scad>;

module groovemount(thickness=4.5,mountingHoleSep=104,mountDiam=12.4){
    union(){
        difference(){
            union(){
                roundedBox([120,20,thickness],3,true,center=false,$fn=40);
            } 
            // mounting holes for M5 screws
            for(i=[-1,1]){
                translate([mountingHoleSep/2*i,0,0]) cylinder(d=5.8,h=thickness+1,$fn=30,center=true);
            }
            // groovemount
            hull(){
              cylinder(d=mountDiam,h=thickness+1,center=true,$fn=40);  
              translate([0,-10,0]) cube([mountDiam,20,thickness+1],center=true);
            }
        }
    }
}

groovemount();