
/// @arg text
function scr_message(_text) {
	let ins = instance_create_layer(0, 0, "I_GUI", obj_message);
	ins.text = _text;
}