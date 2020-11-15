/// @description Insert description here
// You can write your code in this editor

surface_set_target(obj_cam.gui_surf);
draw_set_font(fnt_pixel);
draw_set_halign(fa_left);
draw_set_valign(fa_top);


draw_sprite(spr_inv_detail, 0, x, y);

draw_text_col(x + 2, y + 2, "Detail", c_black,  1);

if (instanceof(item) == "Tool") {
	draw_text_col(x + 2, y + 68, "Equip", c_black,  1);
} else {
	let col = obj_pl.talking ? ((obj_pl.talking.cur_dia == noone && obj_pl.talking.alarm[0] == -1) ? c_black : c_gray) : c_gray;
	draw_text_col(x + 2, y + 68, "Present", col,  1);
}

draw_sprite(item.spr, item.subimg, x + 3 + 8, y + 13 + 8);
draw_text_col(x + 23, y + 14, item.name, c_black,  1);



let mlines = string_count("\n", text);
mlines = max(0, mlines - 3);
curline = clamp(curline, 0, mlines);
let _mh = 65 - 32;
let _oh = _mh / (mlines + 1);
let _of = _oh * curline;
draw_line_width_color(x + 78, y + 32 + _of, x + 78, y + 32 + _of + _oh, 1, c_dkgray, c_dkgray);
draw_text_ext_h(x + 2, y + 33, text, string_height("W") / 2 + 2, 76, 34 + 4, c_black, 1, curline);

surface_reset_target();