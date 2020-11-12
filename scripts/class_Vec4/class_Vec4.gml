/// @arg x
/// @arg y
/// @arg z
/// @arg w
function vec4(_x, _y, _z, _w) {
	return new Vec4(_x, _y, _z, _w);
}

/// @arg x
/// @arg y
/// @arg z
/// @arg w
function Vec4(_x, _y, _z, _w) : Vec3(_x, _y, _z) constructor {
	x = _x;
	y = _y;
	z = _z;
	w = _w;
	static add = function( _vec4 ) {
		x += _vec4.x;
		y += _vec4.y;
		z += _vec4.z;
		w += _vec4.w;
	}
	static subt = function( _vec4 ) {
		x -= _vec4.x;
		y -= _vec4.y;
		z -= _vec4.z;
		w -= _vec4.w;
	}
	static divide = function( _vec4 ) {
		x /= _vec4.x;
		y /= _vec4.y;
		z /= _vec4.z;
		w /= _vec4.w;
	}
	static mult = function( _vec4 ) {
		x *= _vec4.x;
		y *= _vec4.y;
		z *= _vec4.z;
		w *= _vec4.w;
	}
}