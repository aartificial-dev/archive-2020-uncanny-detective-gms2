/// @description Check current item
// You can write your code in this editor
if (instanceof(item) == "Evidence") {
	_list = obj_pl.list_evidence;
}
if (instanceof(item) == "Profile") {
	_list = obj_pl.list_profiles;
}
if (instanceof(item) == "Tool") {
	_list = obj_pl.list_tools;
}

item = ds_list_find_value(_list, check_evidence(_list, item.name));

if (previtem != item) {
	previtem = item;
	curline = 0;
	text = text_format_width(item.detail, 76);
}

