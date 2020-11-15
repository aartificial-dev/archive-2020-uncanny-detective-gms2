/// @description GUI
// You can write your code in this editor


surface_set_target(obj_cam.gui_surf);
draw_set_font(fnt_pixel);

let gui_width = obj_cam.gui_width;
let gui_height = obj_cam.gui_height;
let mx = device_mouse_x_to_gui(0);
let my = device_mouse_y_to_gui(0);
let can_click = !(collision_point(mx, my, par_gui, 0, 1));

if (interact_item && !talking) {
	let _x = gui_get_x(interact_item.x);
	let _y = gui_get_y(interact_item.y);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_sprite(spr_evidence, 0, _x, _y);
	draw_text(_x + 9, _y, interact_item.item.name);
}

if (interact_npc && !talking) {
	let _x = gui_get_x(interact_npc.x);
	let _y = gui_get_y(interact_npc.y);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	//draw_sprite(spr_evidence, 0, interact_npc.x - view_x, interact_npc.y - view_y);
	draw_text(_x + 9, _y - 20, interact_npc.name);
}

draw_sprite(spr_note, 0, 1, gui_height - 16 - 1);
if (point_in_rectangle(mx, my, 1, gui_height - 16 - 1, 1 + 16, gui_height - 1) && can_click) {
	cursor = cursor_type.finger;
	if (mouse_check_button_pressed(mb_left)) {
		notes_open = !notes_open;
		audio_play_sound(snd_button, 0, 0);
	}
}

if (eq_item != noone) {
	draw_sprite(eq_item.spr, eq_item.subimg, gui_width - 1 - 8, gui_height - 8 - 1);
}
draw_sprite(spr_evidence, 0, gui_width - 1 - 8, gui_height - 8 - 1);

surface_reset_target();