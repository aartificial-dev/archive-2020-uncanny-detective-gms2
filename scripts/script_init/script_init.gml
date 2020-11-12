
#macro let var
#macro cursor global.cursor_stat

global.cursor_stat = cursor_type.point;


enum pl_dir {
	e, n, s, w
}

enum cursor_type {
	point = 0,
	finger = 1,
	hover = 2,
	hold = 3
}