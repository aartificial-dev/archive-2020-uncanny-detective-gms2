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

let can_click = !collision_point(mx, my, obj_detail_gui, 0, 1);

draw_sprite(spr_inv, 0, x, y);
let tab = obj_pl.notes_tab;

let tab_x = tab * 27;
draw_sprite(spr_inv, 1, x + 1 + tab_x, y + 11);

draw_text_col(x + 2, y + 2, "Notes", c_black,  1);
draw_text_col(x + 2, y + 12, "Evid", c_black,  1);
draw_text_col(x + 29, y + 12, "Prof", c_black,  1);
draw_text_col(x + 56, y + 12, "Tool", c_black,  1);

let list = tab == 0 ? obj_pl.list_evidence : (tab == 1 ? obj_pl.list_profiles : obj_pl.list_tools);

let size = min(ds_list_size(list) - 3 * page, 3);
for (let i = 0; i < size; i ++) {
	let xoff = 3;
	let yoff = 24 + i * 20;
	let item = list[| i + page];
	draw_sprite(item.spr, item.subimg, x + xoff + 8, y + yoff + 8);
	let xx = x + xoff + 21;
	let yy = y + yoff;
	if (point_in_rectangle(mx, my, xx, yy, xx + 55, yy + 8) && can_click) {
		draw_text_col(x + xoff + 21, y + yoff + 1, "Detail", c_black,  1);
	} else {
		draw_text_col(x + xoff + 21, y + yoff + 1, item.name, c_black,  1);
	}
}

draw_set_halign(fa_right);
let am = ceil(max(1, ds_list_size(list)) / 3);
draw_text_col(x + 68, y + 2, string(page + 1) + "/" + string(am), c_black,  1);


surface_reset_target();