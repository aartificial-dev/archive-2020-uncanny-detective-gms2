
/// @arg text
function scr_message(_text) {
	let ins = instance_create_layer(0, 0, "I_GUI", obj_message);
	ins.text = _text;
}

/// @arg list
/// @arg name
function check_evidence(_list, _name) {
	let size = ds_list_size(_list);
	for (let i = 0; i < size; i ++) {
		let item = _list[| i];
		if (item.name == _name) {
			return i;
		}
	}
	return -1;
}

/// @arg list
/// @arg name
/// @arg detail
function check_evidence_detail(_list, _name, _detail) {
	let size = ds_list_size(_list);
	for (let i = 0; i < size; i ++) {
		let item = _list[| i];
		if (item.name == _name) {
			if (item.detail == _detail) {
				return 1;
			}
			return -1;
		}
	}
	return 0;
}