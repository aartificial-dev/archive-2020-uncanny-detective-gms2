/// @description Insert description here
// You can write your code in this editor

if (instanceof(item) == "Evidence") {
	ds_list_add(obj_pl.list_evidence, item);
	scr_message("Evidence gathered");
}
if (instanceof(item) == "Tool") {
	ds_list_add(obj_pl.list_tools, item);
	scr_message("Tool gathered");
}
instance_destroy();