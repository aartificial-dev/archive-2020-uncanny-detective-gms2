/// @description Insert description here
// You can write your code in this editor

// text

surface_set_target(obj_cam.gui_surf);
let gui_width = obj_cam.gui_width;

draw_set_font(fnt_pixel);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (alarm[0] != -1) {
	let off = 1 - alarm[0] / spd;
	x = gui_width - (off * (string_width(text) + 2));
	alpha = off;
}

if (alarm[2] != -1) {
	let off = alarm[2] / spd;
	x = gui_width - (off * (string_width(text) + 2));
	alpha = off;
}

draw_text_col(x, y, text, c_white, alpha);
surface_reset_target();