function Dialog() constructor {
	lines = [];
	faces = [];
	fflip = [];
	items = [];
	uitem = [];
	
	index = 0;
	add = function(_text, _face, _flip, _item, _uitem) {
		lines[index] = _text;
		faces[index] = _face;
		fflip[index] = _flip;
		items[index] = _item;
		uitem[index] = _uitem;
		index ++;
	}
}