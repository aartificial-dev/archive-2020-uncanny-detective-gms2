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

let dia_x = view_width / 2;
let dia_y = view_height - 20;
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_sprite(spr_dialog, 0, dia_x, dia_y);
draw_sprite_ext(spr_dialog_faces, cur_face, dia_x, dia_y, do_flip, 1, 0, c_white, 1);
draw_text_ext(dia_x, dia_y - 27, out_text, string_height("W"), 192); // 192
//draw_rectangle_color(dia_x - 150, dia_y - 9 - 15, dia_x - 152 + 50, dia_y - 9 - 3, c_red, c_red, c_red, c_red, 1);
if (cur_dia == noone) { 
	draw_sprite(spr_dialog, 1, dia_x, dia_y);
}

surface_reset_target();