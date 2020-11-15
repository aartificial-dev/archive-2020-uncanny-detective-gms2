/// @description Sufraces
// You can write your code in this editor

/*
if (surface_exists(shadow_surf)) {
	surface_set_target(shadow_surf);
	draw_clear_alpha(c_white, 0);
	with (obj_shadowcast) {
		draw_raycast();
	}	
	surface_reset_target();
}
*/

// normals
if (surface_exists(normal_surf)) {
	surface_set_target(normal_surf);
	
	draw_clear(normal_colour);
	var map_id = layer_tilemap_get_id(_t_normal);
	draw_tilemap(map_id, -view_x, -view_y);
	
	shader_set(shd_norm_def);
	with (par_world) {
		let _x = x;
		let _y = y;
		x -= obj_cam.view_x;
		y -= obj_cam.view_y;
		event_perform(ev_draw, 0);
		x = _x;
		y = _y;
	}
	shader_reset();
	surface_reset_target();
}

// self-illumination
if (surface_exists(illum_surf)) {
	surface_set_target(illum_surf);
	
	draw_clear(c_black);
	var map_id = layer_tilemap_get_id(_t_illum);
	draw_tilemap(map_id, -view_x, -view_y);
	
	surface_reset_target();
}

// black tiles
if (surface_exists(black_surf)) {
	surface_set_target(black_surf);
	
	draw_clear_alpha(c_black, 0);
	var map_id = layer_tilemap_get_id(_t_black);
	draw_tilemap(map_id, -view_x, -view_y);
	
	with (obj_raycast) {
		draw_raycast();
	}
	
	surface_reset_target();
}


if (draw_light) {
	draw_light_shader();
}
