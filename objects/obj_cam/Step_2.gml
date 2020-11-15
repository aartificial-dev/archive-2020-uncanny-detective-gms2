/// @description Surfaces check
// You can write your code in this editor

if (!surface_exists(normal_surf)) {
	normal_surf = surface_create(view_width, view_height);
}
if (!surface_exists(illum_surf)) {
	illum_surf = surface_create(view_width, view_height);
}
if (!surface_exists(light_surf)) {
	light_surf = surface_create(view_width, view_height);
}
if (!surface_exists(black_surf)) {
	black_surf = surface_create(view_width, view_height);
}
if (!surface_exists(blur_surf)) {
	blur_surf = surface_create(view_width, view_height);
}
if (!surface_exists(vhs_surf)) {
	vhs_surf = surface_create(view_width * window_scale, view_height * window_scale);
}
if (!surface_exists(gui_surf)) {
	gui_surf = surface_create(gui_width, gui_height);
}

if (keyboard_check_pressed(vk_f12)) {
	draw_light = !draw_light;
}

if (keyboard_check_pressed(ord("R"))) {
	game_restart();
}

