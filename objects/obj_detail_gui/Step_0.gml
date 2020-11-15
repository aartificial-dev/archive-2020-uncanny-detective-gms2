/// @description Interaction
// You can write your code in this editor

let gui_width = obj_cam.gui_width;
let gui_height = obj_cam.gui_height;
let mx = device_mouse_x_to_gui(0);
let my = device_mouse_y_to_gui(0);
let mw = mouse_wheel_down() - mouse_wheel_up();
let mlb = mouse_check_button_pressed(mb_left);
let mw = mouse_wheel_down() - mouse_wheel_up();


if (point_in_rectangle(mx, my, x + 70, y + 1, x + 79, y + 10)) {
	cursor = cursor_type.finger;
	if (mlb) {
		audio_play_sound(snd_button, 0, 0);
		instance_destroy();
	}
}

if (point_in_rectangle(mx, my, x + 1, y + 1, x + 68, y + 9) && !drag) {
	cursor = cursor_type.hover;
	if (mlb) {
		drag = 1;
		st_x = mx - x;
		st_y = my - y;
		audio_play_sound(snd_button, 0, 0);
	}
}

if (drag) {
	cursor = cursor_type.hold;
	x = mx - st_x;
	y = my - st_y;
	
	if (mouse_check_button_released(mb_left)) {
		drag = 0;
		audio_play_sound(snd_button, 0, 0);
	}
}

if (point_in_rectangle(mx, my, x + 1, y + 32, x + 78, y + 65) && mw != 0) {
	curline += mw;
}

if (point_in_rectangle(mx, my, x + 1, y + 67, x + 78, y + 75)) {
	if (instanceof(item) == "Tool") {
		cursor = cursor_type.finger;
		if (mlb) {
			obj_pl.eq_item = item;
			audio_play_sound(snd_button, 0, 0);
		}
	} else if (obj_pl.talking) {
		cursor = cursor_type.finger;
		if (mlb && obj_pl.talking.cur_dia == noone && obj_pl.talking.alarm[0] == -1) {
			obj_pl.talking.present = item;
			audio_play_sound(snd_button, 0, 0);
		}
	}
}

x = clamp(x, 0, gui_width - sprite_get_width(sprite_index));
y = clamp(y, 0, gui_height - sprite_get_height(sprite_index));

obj_pl.detail_offset = vec2(x, y);