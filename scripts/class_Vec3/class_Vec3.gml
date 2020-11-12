/// @arg x
/// @arg y
/// @arg z
function vec3(_x, _y, _z) {
	return new Vec3(_x, _y, _z);
}

/// @arg x
/// @arg y
/// @arg z
function Vec3(_x, _y, _z) : Vec2(_x, _y) constructor {
	x = _x;
	y = _y;
	z = _z;
	static add = function( _vec3 ) {
		x += _vec3.x;
		y += _vec3.y;
		z += _vec3.z;
	}
	static subt = function( _vec3 ) {
		x -= _vec3.x;
		y -= _vec3.y;
		z -= _vec3.z;
	}
	static divide = function( _vec3 ) {
		x /= _vec3.x;
		y /= _vec3.y;
		z /= _vec3.z;
	}
	static mult = function( _vec3 ) {
		x *= _vec3.x;
		y *= _vec3.y;
		z *= _vec3.z;
	}
}