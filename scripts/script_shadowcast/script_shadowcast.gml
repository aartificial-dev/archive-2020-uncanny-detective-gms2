
function draw_raycast() {
	if (!instance_exists(obj_pl)) {return;}
	if (!visible) {return;}
	var camera = view_camera[0];
	let cam_x = camera_get_view_x(camera);
	let cam_y = camera_get_view_y(camera);
	
	let _l = x - (sprite_get_width(sprite_index)  - sprite_get_xoffset(sprite_index))  * image_xscale - cam_x;
	let _r = x + (sprite_get_width(sprite_index)  - sprite_get_xoffset(sprite_index))  * image_xscale - cam_x;
	let _b = y + (sprite_get_height(sprite_index)  - sprite_get_yoffset(sprite_index))  * image_yscale - cam_y;
	let _u = y - (sprite_get_height(sprite_index)  - sprite_get_yoffset(sprite_index))  * image_yscale - cam_y;
	
	//if (collision_rectangle(_l, _u, _r, _b, obj_pl, 0, 1)) {return;}
	//let collide = rectangle_in_rectangle(_l, _u, _r, _b, cam_x, cam_y, cam_x + view_w, cam_y + view_h);
	//if (collide == 0) {return;}
	
	//draw_circle_color(_l, _b, 2, c_white, c_white, 1);
	//draw_circle_color(_r, _b, 2, c_white, c_white, 1);
	//draw_circle_color(_l, _u, 2, c_white, c_white, 1);
	//draw_circle_color(_r, _u, 2, c_white, c_white, 1);

	let _dir;
	let _len = obj_cam.view_width * 1.2;
	let _ymod = 0;//-30;
	_dir = point_direction(obj_pl.x - cam_x, obj_pl.y - cam_y + _ymod, _l, _b);
	let _x1 = _l + lendir_x(_len, 0, _dir);
	let _y1 = _b + lendir_y(_len, 0, _dir);

	_dir = point_direction(obj_pl.x - cam_x, obj_pl.y - cam_y + _ymod, _r, _b);
	let _x2 = _r + lendir_x(_len, 0, _dir);
	let _y2 = _b + lendir_y(_len, 0, _dir);

	_dir = point_direction(obj_pl.x - cam_x, obj_pl.y - cam_y + _ymod, _l, _u);
	let _x3 = _l + lendir_x(_len, 0, _dir);
	let _y3 = _u + lendir_y(_len, 0, _dir);

	_dir = point_direction(obj_pl.x - cam_x, obj_pl.y - cam_y + _ymod, _r, _u);
	let _x4 = _r + lendir_x(_len, 0, _dir);
	let _y4 = _u + lendir_y(_len, 0, _dir);

	draw_primitive_begin(pr_trianglelist);
		// bottom rectangle
		draw_vertex_color(_l, _b, c_black, 1);
		draw_vertex_color(_x1, _y1, c_black, 1);
		draw_vertex_color(_r, _b, c_black, 1);
	
		draw_vertex_color(_r, _b, c_black, 1);
		draw_vertex_color(_x2, _y2, c_black, 1);
		draw_vertex_color(_x1, _y1, c_black, 1);
	
		// left rectangle
		draw_vertex_color(_l, _u, c_black, 1);
		draw_vertex_color(_x3, _y3, c_black, 1);
		draw_vertex_color(_l, _b, c_black, 1);
	
		draw_vertex_color(_l, _b, c_black, 1);
		draw_vertex_color(_x1, _y1, c_black, 1);
		draw_vertex_color(_x3, _y3, c_black, 1);
	
		// up rectangle
		draw_vertex_color(_l, _u, c_black, 1);
		draw_vertex_color(_x3, _y3, c_black, 1);
		draw_vertex_color(_r, _u, c_black, 1);
	
		draw_vertex_color(_r, _u, c_black, 1);
		draw_vertex_color(_x4, _y4, c_black, 1);
		draw_vertex_color(_x3, _y3, c_black, 1);
	
		// right rectangle
		draw_vertex_color(_r, _u, c_black, 1);
		draw_vertex_color(_x4, _y4, c_black, 1);
		draw_vertex_color(_r, _b, c_black, 1);
	
		draw_vertex_color(_r, _b, c_black, 1);
		draw_vertex_color(_x2, _y2, c_black, 1);
		draw_vertex_color(_x4, _y4, c_black, 1);
	draw_primitive_end();
}