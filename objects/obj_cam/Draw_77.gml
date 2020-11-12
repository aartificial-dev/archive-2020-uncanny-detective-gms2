/// @description Insert description here
// You can write your code in this editor

//shader_set(shd_blur);
//var uni = shader_get_uniform(shd_blur, "size");
//shader_set_uniform_f(uni, display_get_width(), display_get_height(), 2);
//shader_reset();
surface_set_target(vhs_surf);
draw_clear_alpha(c_white, 0);
draw_surface(application_surface, 0, 0); 
surface_reset_target();

surface_set_target(blur_surf);
draw_clear(c_white);
if (draw_light) {
	shader_set(shd_blur);
	var uni = shader_get_uniform(shd_blur, "size");
	shader_set_uniform_f(uni, display_get_width(), display_get_height(), 4);
	draw_surface_stretched(light_surf, 0, 0, view_width, view_height);
	shader_reset();
}
surface_reset_target();

surface_set_target(vhs_surf);
shader_set(shd_pixelate);
gpu_set_blendmode_ext(bm_dest_color, bm_zero);
draw_surface_stretched(blur_surf, 0, 0, view_width * window_scale, view_height * window_scale);
gpu_set_blendmode(bm_normal);
shader_reset();
	
draw_surface_stretched(black_surf, 0, 0, view_width * window_scale, view_height * window_scale);

surface_reset_target();

shader_set(shd_vhs);
shader_set_uniform_f(u_iTime, current_time / 1000);
draw_surface(vhs_surf, 0, 0);
draw_surface_stretched(gui_surf, 0, 0, view_width * window_scale, view_height * window_scale);
draw_sprite_ext(spr_cursor, cursor, window_mouse_get_x(), window_mouse_get_y(), 1.15, 1.15, 0, c_white, 1);
shader_reset();

surface_set_target(gui_surf);
draw_clear_alpha(c_white, 0);
surface_reset_target();
//draw_text(100, 100, floor(current_time / 1000));
//draw_surface(normal_surf, 0, 0);

cursor = cursor_type.point;