/// @func text_format_width
/// @arg str
/// @arg w
function text_format_width(_str, _w) {
	let len = string_length(_str);
	let out = "";
	let word = "";
	for (let i = 0; i < len; i ++) {
		let char = string_char_at(_str, i + 1);
		word += char;
		let eow = (char == " ");
		if (eow || i + 1 == len) {
			let nw = string_width(out + word);
			if (nw > _w) {
				out += "\n";
			}
			out += word;
			word = "";
		}
	}
	return out;
}