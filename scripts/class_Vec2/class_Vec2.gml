/// @arg x
/// @arg y
function vec2(_x, _y) {
	return new Vec2(_x, _y);
}

/// @arg x
/// @arg y
function Vec2(_x, _y) constructor {
	x = _x;
	y = _y;
	static add = function( _vec2 ) {
		x += _vec2.x;
		y += _vec2.y;
	}
	static subt = function( _vec2 ) {
		x -= _vec2.x;
		y -= _vec2.y;
	}
	static divide = function( _vec2 ) {
		x /= _vec2.x;
		y /= _vec2.y;
	}
	static mult = function( _vec2 ) {
		x *= _vec2.x;
		y *= _vec2.y;
	}
}
