/// @description Insert description here
// You can write your code in this editor
let view_width = obj_cam.view_width;
let view_height = obj_cam.view_height;
let view_x = obj_cam.view_x;
let view_y = obj_cam.view_y;
let mx = mouse_x - view_x;
let my = mouse_y - view_y;
let mw = mouse_wheel_down() - mouse_wheel_up();
let mlb = mouse_check_button_pressed(mb_left);
let tab = obj_pl.notes_tab;
let list = tab == 0 ? obj_pl.list_evidence : (tab == 1 ? obj_pl.list_profiles : obj_pl.list_tools);

if (collision_point(mx, my, obj_detail_gui, 0, 1)) {
	drag = 0;
	exit;
}


if (point_in_rectangle(mx, my, x + 70, y + 1, x + 79, y + 10)) {
	cursor = cursor_type.finger;
	if (mlb) {
		audio_play_sound(snd_button, 0, 0);
		obj_pl.notes_open = 0;
		instance_destroy();
	}
}

if (point_in_rectangle(mx, my, x + 1, y + 21, x + 78, y + 82) && mw != 0) {
	//cursor = cursor_type.finger;
	// scroll through ev
	let size = ds_list_size(list);
	let am = ceil(max(1, size) / 3);
	if (mouse_wheel_down() && page < am - 1) { // scroll down
		page ++;
		audio_play_sound(snd_scroll, 0, 0);
	}
	if (mouse_wheel_up() && page > 0) { // scroll up
		page --;
		audio_play_sound(snd_scroll, 0, 0);
	}
	page = clamp(page, 0, am - 1);
}

for (let i = 0; i < 3; i ++) {
	let tab_x = x + 1 + i * 27;
	if (point_in_rectangle(mx, my, tab_x, y + 11, tab_x + 25, y + 20)) {
		cursor = cursor_type.finger;
		if (mlb) {
			audio_play_sound(snd_button, 0, 0);
			obj_pl.notes_tab = i;
			page = 0;
			break;
		}
	}
	
}

if (point_in_rectangle(mx, my, x + 1, y + 1, x + 68, y + 9) && !drag) {
	cursor = cursor_type.hover;
	if (mlb) {
		audio_play_sound(snd_button, 0, 0);
		drag = 1;
		st_x = mx - x;
		st_y = my - y;
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


let size = min(ds_list_size(list), 3);
for (let i = 0; i < size; i ++) {
	let xoff = 3;
	let yoff = 24 + i * 20;
	let xx = x + xoff + 21;
	let yy = y + yoff;
	if (point_in_rectangle(mx, my, xx, yy, xx + 55, yy + 8)) {
		cursor = cursor_type.finger;
		if (mlb) {
			audio_play_sound(snd_button, 0, 0);
			let det = obj_pl.detail_offset;
			let ins = instance_create_layer(det.x, det.y, "I_GUI", obj_detail_gui);
			ins.item = list[| i + page];
		}
	}
}



x = clamp(x, 0, view_width - sprite_get_width(sprite_index));
y = clamp(y, 0, view_height - sprite_get_height(sprite_index));

obj_pl.notes_offset = vec2(x, y);