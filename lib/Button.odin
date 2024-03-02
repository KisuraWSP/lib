package lib

import rl "vendor:raylib"

Button :: struct{
	rect : rl.Rectangle,
	position_vec : [2]f32,
	rotation_value : f32,
	color : rl.Color,
	isClicked : bool,
}

draw_button :: proc(b : Button){
	rl.DrawRectanglePro(b.rect, b.position_vec, b.rotation_value, b.color)
}

