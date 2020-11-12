/// @description Insert description here
// You can write your code in this editor

surface_set_target(obj_cam.gui_surf);
draw_set_font(fnt_pixel);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

let view_height = obj_cam.view_height;
let view_width = obj_cam.view_width;
let view_x = obj_cam.view_x;
let view_y = obj_cam.view_y;
let mx = mouse_x - view_x;
let my = mouse_y - view_y;

draw_sprite(spr_inv_detail, 0, x, y);
let tab = obj_pl.notes_tab;

draw_text_col(x + 2, y + 2, "Detail", c_black,  1);

if (instanceof(item) == "Tool") {
	draw_text_col(x + 2, y + 68, "Equip", c_black,  1);
} else {
	let col = obj_pl.talking ? ((obj_pl.talking.cur_dia == noone) ? c_black : c_dkgray) : c_dkgray;
	draw_text_col(x + 2, y + 68, "Present", col,  1);
}

draw_sprite(item.spr, item.subimg, x + 3 + 8, y + 13 + 8);
draw_text_col(x + 23, y + 14, item.name, c_black,  1);


draw_text_ext_color(x + 2, y + 33, item.detail, string_height("W") / 2 + 2, 76, c_black, c_black, c_black, c_black,  1);

surface_reset_target();