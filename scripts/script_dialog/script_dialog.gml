function dialog_init() {
	return new Dialog();
}

/// @arg dialog
/// @arg text
/// @arg face
/// @arg flip
/// @arg item
/// @arg update_item
function dialog_add(_dia, _text, _face, _flip, _item, _uitem) {
	_dia.add(_text, _face, _flip, _item, _uitem);
}

function response_init() {
	return new Response();
}

/// @arg response
/// @arg item
/// @arg dialog
function response_add(_resp, _item, _dialog) {
	_resp.add(_item, _dialog);
}

/// @arg response
/// @arg item
function response_find(_resp, _item) {
	return _resp.find(_item);
}

/// @arg response
/// @arg index
function response_get(_resp, _index) {
	return _resp.get(_index);
}