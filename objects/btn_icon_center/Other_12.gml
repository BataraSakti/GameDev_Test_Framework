/// @description read offset
// You can write your code in this editor

if(_parent != noone && instance_exists(_parent)){
    x_offset = x - _parent.x;
    y_offset = y - _parent.y;
}