/// @description  TGMS_Optimised_PSetExt(property,amount,data[])
/// @function  TGMS_Optimised_PSetExt
/// @param property
/// @param amount
/// @param data[]
function TGMS_Optimised_PSetExt(argument0, argument1, argument2) {
	/*
	    Extended property setter optimisation path.
	    Extend as needed...
	*/

	switch(argument0)
	{
	    // Standard cases
	    case ext_xy__: ext_xy__(argument1, argument2); break;
	    case ext_roundxy__: ext_roundxy__(argument1, argument2); break;
	    case ext_hvspeed__: ext_hvspeed__(argument1, argument2); break;
	    case ext_image_blend__: ext_image_blend__(argument1, argument2); break;
	    case ext_image_xyscale__: ext_image_xyscale__(argument1, argument2); break;
	    case ext_path__: ext_path__(argument1, argument2); break;
	    case ext_background_xy__: ext_background_xy__(argument1, argument2); break;
	    case ext_background_blend__: ext_background_blend__(argument1, argument2); break;
	    case ext_background_alpha__: ext_background_alpha__(argument1, argument2); break;
	    case ext_background_colour__: ext_background_colour__(argument1, argument2); break;
	    case ext_background_scale__: ext_background_scale__(argument1, argument2); break;
	    case ext_background_xyscale__: ext_background_xyscale__(argument1, argument2); break;
	    case ext_background_xscale__: ext_background_xscale__(argument1, argument2); break;
	    case ext_background_yscale__: ext_background_yscale__(argument1, argument2); break;
	    case ext_background_hvspeed__: ext_background_hvspeed__(argument1, argument2); break;
	    case ext_background_hspeed__: ext_background_hspeed__(argument1, argument2); break;
	    case ext_background_vspeed__: ext_background_vspeed__(argument1, argument2); break;
    
	    // Custom cases
	    // MAKE SURE TO BACK UP CUSTOM CASES WHEN DONE
    
	}



}
