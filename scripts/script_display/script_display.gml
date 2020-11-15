/// @arg x
function gui_get_x(_x) {
	return (_x - obj_cam.view_x) * obj_cam.gui_scale;
}

/// @arg y
function gui_get_y(_y) {
	return (_y - obj_cam.view_y) * obj_cam.gui_scale;
}



