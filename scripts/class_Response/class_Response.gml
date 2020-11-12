function Response() constructor {
	item = [];
	dialog = [];
	index = 0;
	
	add = function(_item, _dialog) {
		item[index] = _item;
		dialog[index] = _dialog;
		index ++;
	}
	
	find = function(_item) {
		for (let i = 0; i < array_length(item); i++) {
			let _citem = item[i];
			if (_citem == _item.name) {
				return i;
			}
		}
		return -1;
	}
	
	get = function(index) {
		return dialog[index];
	}
}
