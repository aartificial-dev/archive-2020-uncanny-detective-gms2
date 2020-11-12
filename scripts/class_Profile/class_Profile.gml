/// @arg name
/// @arg spr
/// @arg subimg
/// @arg detail
function Profile(_name, _pic, _sub, _det) : Item(_name, _pic, _sub, _det) constructor {
	name = _name;
	spr = _pic;
	subimg = _sub;
	detail = _det;
}