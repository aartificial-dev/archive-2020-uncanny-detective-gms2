/// @description Camera movement
// You can write your code in this editor

let camera = view_camera[0];

if (instance_exists(target)) {
	let _ymod = -30;
	x = lerp(x, target.x, 0.05);
	y = lerp(y, target.y + _ymod, 0.05);
}

view_x = round(x - (view_width / 2));
view_y = round(y - (view_height / 2));
camera_set_view_pos(camera, view_x, view_y);
camera_set_view_size(camera, view_width, view_height);
