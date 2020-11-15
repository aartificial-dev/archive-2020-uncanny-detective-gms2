/// @description GUI
// You can write your code in this editor


surface_set_target(obj_cam.gui_surf);
draw_set_font(fnt_pixel);

let gui_width = obj_cam.gui_width;
let gui_height = obj_cam.gui_height;
let mx = device_mouse_x_to_gui(0);
let my = device_mouse_y_to_gui(0);
let can_click = !(collision_point(mx, my, par_gui, 0, 1));

let dia_x = gui_width / 2;
let dia_y = gui_height - 20;
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