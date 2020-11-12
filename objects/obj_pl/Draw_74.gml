/// @description GUI
// You can write your code in this editor


surface_set_target(obj_cam.gui_surf);
draw_set_font(fnt_pixel);

let view_height = obj_cam.view_height;
let view_width = obj_cam.view_width;
let view_x = obj_cam.view_x;
let view_y = obj_cam.view_y;
let mx = mouse_x - view_x;
let my = mouse_y - view_y;
let can_click = !(collision_point(mx, my, par_gui, 0, 1));

if (interact_item && !talking) {
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_sprite(spr_evidence, 0, interact_item.x - view_x, interact_item.y - view_y);
	draw_text(interact_item.x + 9 - view_x, interact_item.y - view_y, interact_item.item.name);
}

if (interact_npc && !talking) {
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	//draw_sprite(spr_evidence, 0, interact_npc.x - view_x, interact_npc.y - view_y);
	draw_text(interact_npc.x + 9 - view_x, interact_npc.y - view_y - 20, interact_npc.name);
}

draw_sprite(spr_note, 0, 1, view_height - 16 - 1);
if (point_in_rectangle(mx, my, 1, view_height - 16 - 1, 1 + 16, view_height - 1) && can_click) {
	cursor = cursor_type.finger;
	if (mouse_check_button_pressed(mb_left)) {
		notes_open = !notes_open;
		audio_play_sound(snd_button, 0, 0);
	}
}

if (eq_item != noone) {
	draw_sprite(eq_item.spr, eq_item.subimg, view_width - 1 - 8, view_height - 8 - 1);
}
draw_sprite(spr_evidence, 0, view_width - 1 - 8, view_height - 8 - 1);

surface_reset_target();