/// @description  TweenIteratorReset(iterator)
/// @function  TweenIteratorReset
/// @param iterator
function TweenIteratorReset(argument0) {

	var _tweens = SharedTweener().tweens;

	argument0[@ 0] = -1; // cached tween handle
	argument0[@ 1] = -1; // iterator index
	argument0[@ 2] = qs_list_size(_tweens); // tween list size
	argument0[@ 3] = _tweens; // cache tweens list



}
