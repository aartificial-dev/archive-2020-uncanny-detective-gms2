/// @func draw_text_ext_h
/// @arg x
/// @arg y
/// @arg str
/// @arg sep
/// @arg w
/// @arg h
/// @arg col
/// @arg a
/// @arg st_line
function draw_text_ext_h(_x, _y, _str, _sep, _w, _h, _col, _a, _line) {
	//_str = text_format_width(_str, _w);
	let len = string_length(_str);
	let out = "";
	let skip_line = 0;
	let _he = string_height("AWHIOAHAJDFJDqhwuhudqhlksa");
	for (let i = 0; i < len; i ++) {
		let char = string_char_at(_str, i + 1);
		let nh = string_height_ext(out + char, _sep, _w * 2);
		if (skip_line != _line && nh > _he) {
			//_he = nh;
			out = "";
			skip_line ++;
		}
		if (nh > _h && skip_line == _line) {
			break;
		}
		out += char;
	}
	draw_text_ext_color(_x, _y, out, _sep, _w * 2, _col, _col, _col, _col, _a);
	return;
}

