/// @description  TweenCalcAmount(tween,amount)
/// @function  TweenCalcAmount
/// @param tween
/// @param amount
function TweenCalcAmount(argument0, argument1) {

	if (argument0)
	{
	    var _t = global.TGMS_MAP_TWEEN[1][? argument0];
		if (is_array(_t)){
			return script_execute(TWEEN.EASE, argument1, _t[TWEEN.START], _t[TWEEN.CHANGE], 1);
		} else {
			return false;
		}
	}



}
