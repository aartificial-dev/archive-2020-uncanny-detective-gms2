/// @description Insert description here
// You can write your code in this editor

if (instance_number(obj_detail_gui) > 1) {
	let ins = instance_find(obj_detail_gui, 0);
	instance_destroy(ins);
}

drag = 0;
st_x = x;
st_y = y;

previtem = noone;
curline = 0;
text = "";