/// @description  TGMS_Optimised_PSet(property,value)
/// @function  TGMS_Optimised_PSet
/// @param property
/// @param value
function TGMS_Optimised_PSet(argument0, argument1) {
	/*
	    Property setter optimisation path.
	    Extend as needed...
	*/

	switch(argument0)
	{
	    // Standard cases
	    case x__: x = argument1; break;
	    case y__: y = argument1; break;
	    case roundx__: x = round(argument1); break;
	    case roundy__: y = round(argument1); break;
	    case speed__: speed = argument1; break;
	    case hspeed__: hspeed = argument1; break;
	    case vspeed__: vspeed = argument1; break;
	    case direction__: direction = argument1; break;
	    case image_speed__: image_speed = argument1; break;
	    case image_index__: image_index = argument1; break;
	    case image_alpha__: image_alpha = argument1; break;
	    case image_angle__: image_angle = argument1; break;
	    case image_scale__: image_xscale = argument1; image_yscale = argument1; break;
	    case image_xscale__: image_xscale = argument1; break;
	    case image_yscale__: image_yscale = argument1; break;
	    case depth__: depth = argument1; break;
	    case friction__: friction = argument1; break;
	    case gravity__: gravity = argument1; break;
	    case gravity_direction__: gravity_direction = argument1; break;
	    case health__: health = argument1; break;
	    case score__: score = argument1; break;
	    case x__int: x = round(argument1); break;
	    case y__int: y = round(argument1); break;
    
	    // Custom cases
	    // MAKE SURE TO BACK UP CUSTOM CASES WHEN DONE    
	}




}
