/// @arg x
/// @arg y
/// @arg string
/// @arg col
/// @arg alpha
function draw_text_col(_x, _y, _str, _col, _a) {
	draw_text_color(_x, _y, _str, _col, _col, _col, _col, _a);
}