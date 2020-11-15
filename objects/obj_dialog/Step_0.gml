/// @description Insert description here
// You can write your code in this editor

let gui_width = obj_cam.gui_width;
let gui_height = obj_cam.gui_height;
let mx = device_mouse_x_to_gui(0);
let my = device_mouse_y_to_gui(0);
let dia_x = gui_width / 2;
let dia_y = gui_height - 20;
let can_click = !(collision_point(mx, my, par_gui, 0, 1));
let mb = mouse_check_button_pressed(mb_left);

if (cur_dia == noone && cur_text == "") {
	cur_ind = 0;
	cur_face = face;
	do_flip = -1;
	if (greeted == 0) {
		cur_text = greet;
	} else {
		cur_text = inter;
	}
	alarm[0] = 1;
	out_text = "";
//face
//resp
}


if (cur_dia != noone && alarm[0] == -1) {
	cur_text = cur_dia.lines[cur_ind];
	cur_face = cur_dia.faces[cur_ind];
	do_flip = cur_dia.fflip[cur_ind];
	if (cur_text != out_text) {
		alarm[0] = 1;
		out_text = "";
	}
	if (gave_item == 0 && cur_dia.items[cur_ind] != noone) {
		let _item = cur_dia.items[cur_ind];
		let _list = noone;
		let _mess = "";
		if (instanceof(_item) == "Evidence") {
			_list = obj_pl.list_evidence;
			_mess = "Evidence";
		}
		if (instanceof(_item) == "Profile") {
			_list = obj_pl.list_profiles;
			_mess = "Profile";
		}
		if (instanceof(_item) == "Tool") {
			_list = obj_pl.list_tools;
			_mess = "Tool";
		}
		if (check_evidence(_list, _item.name) == -1 && cur_dia.uitem[cur_ind] == 0) {
			ds_list_add(_list, _item);
			scr_message(string(_mess) + " gathered");
		}
		if (check_evidence_detail(_list, _item.name, _item.detail) == -1 && cur_dia.uitem[cur_ind] == 1) {
			let index = check_evidence(_list, _item.name);
			ds_list_delete(_list, index);
			ds_list_add(_list, _item);
			scr_message(string(_mess) + " updated");
		}
		gave_item = 1;
	}
	
	
	if (point_in_rectangle(mx, my, dia_x - 155, dia_y - 34, dia_x + 155, dia_y - 1) && can_click) {
		cursor = cursor_type.finger;
		if (mb) {
			cur_ind ++;
			gave_item = 0;
			if (cur_ind >= cur_dia.index) {
				cur_ind = 0;
				cur_dia = noone;
				cur_text = "";
			}
		}
	}
} else {
	if (point_in_rectangle(mx, my, dia_x - 150, dia_y - 9 - 15, dia_x - 152 + 49, dia_y - 9 - 3) && can_click) {
		// 5 10
		cursor = cursor_type.finger;
		if (mb) {
			instance_destroy();
		}
	}
}

if (present != noone) {
	let rg = response_find(resp, present);
	if (rg == -1) {
		cur_text = desl;
		alarm[0] = 1;
		out_text = "";
	} else {
		cur_dia = response_get(resp, rg);
		cur_ind = 0;
	}
	present = noone;
	greeted = 1;
}
