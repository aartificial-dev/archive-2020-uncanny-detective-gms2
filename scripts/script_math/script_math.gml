/// @func lendir_x
/// @arg x
/// @arg y
/// @arg dir
function lendir_x(argument0, argument1, argument2) {
	return (lengthdir_x(argument0,argument2)-lengthdir_y(argument1,argument2));
}


/// @func lendir_y
/// @arg x
/// @arg y
/// @arg dir
function lendir_y(argument0, argument1, argument2) {
	return (lengthdir_y(argument0,argument2)+lengthdir_x(argument1,argument2));
}