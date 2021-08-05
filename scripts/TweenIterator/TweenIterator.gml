/// @description  TweenIterator()
/// @function  TweenIterator
function TweenIterator() {

	var _tweens = SharedTweener().tweens;
	var _iterator;

	_iterator[0] = -1; // cached tween handle
	_iterator[1] = -1; // iterator index
	_iterator[2] = qs_list_size(_tweens); // tween list size
	_iterator[3] = _tweens; // cache tweens list

	return _iterator;



}
