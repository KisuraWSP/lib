package lib

import rl "vendor:raylib"
import "core:fmt"

/*
================================================
					BUTTON
================================================
Types
	Button {rect : rl.Rectangle, color : rl.Color, outline_color : rl.Color, isClicked : bool}

Procedures
	draw_button :: proc(b : Button) --- 
	button_isPressed :: proc(b : Button, message : string) -> bool
*/
Button :: struct{
	rect : rl.Rectangle,
	color : rl.Color,
	outline_color : rl.Color,
	isClicked : bool,
}

draw_button :: proc(b : Button){
	rl.DrawRectangleRec(b.rect, b.color)
	rl.DrawRectangleLines(cast(i32)b.rect.x, cast(i32)b.rect.y, cast(i32)b.rect.width, cast(i32)b.rect.height, b.outline_color)
}

button_isPressed :: proc(b : Button, message : string) -> bool{
	if rl.CheckCollisionPointRec(rl.GetMousePosition(), b.rect) && rl.IsMouseButtonPressed(.LEFT) == true{
		fmt.println(message)
		return !b.isClicked
	}
	return b.isClicked
}

/*
================================================
				IMAGE BUTTON
================================================
Types
	Image_Button {texture : rl.Texture2D, rect : rl.Rectangle, color : rl.Color,
				  tint : rl.Color, outline_color : rl.Color, pos : [2]f32,
				  rotation_degree : f32, scale : f32, isClicked : bool}

Procedures
	draw_image_button :: proc(b : Image_Button) ---
	image_button_isPressed :: proc(b : Image_Button, message : string) -> bool
*/
Image_Button :: struct{
	texture : rl.Texture2D,
	rect : rl.Rectangle,
	color : rl.Color,
	tint : rl.Color,
	outline_color : rl.Color,
	pos : [2]f32,
	rotation_degree : f32,
	scale : f32,
	isClicked : bool,	
}

draw_image_button :: proc(b : Image_Button){
	rl.DrawRectangleRec(b.rect, b.color)
	rl.DrawRectangleLines(cast(i32)b.rect.x, cast(i32)b.rect.y, cast(i32)b.rect.width, cast(i32)b.rect.height, b.outline_color)
	rl.DrawTextureEx(b.texture, b.pos, b.rotation_degree, b.scale, b.tint)
}

image_button_isPressed :: proc(b : Image_Button, message : string) -> bool{
	if rl.CheckCollisionPointRec(rl.GetMousePosition(), b.rect) && rl.IsMouseButtonPressed(.LEFT) == true{
		fmt.println(message)
		return !b.isClicked
	}
	return b.isClicked	
}

/*
================================================
				TEXT BUTTON
================================================
Types 
	Text_Button {text: cstring, rect : rl.Rectangle, color : rl.Color, outline_color : rl.Color,
				 text_color : rl.Color, pos : [2]i32, font_size : i32, isClicked : bool}

Procedures
	draw_text_button :: proc(b : Text_Button) ---
	text_button_isPressed :: proc(b : Text_Button, message : string) -> bool

*/
Text_Button :: struct{
	text: cstring,
	rect : rl.Rectangle,
	color : rl.Color,
	outline_color : rl.Color,
	text_color : rl.Color,
	pos : [2]i32,
	font_size : i32, 
	isClicked : bool,	
}

draw_text_button :: proc(b : Text_Button){
	rl.DrawRectangleRec(b.rect, b.color)
	rl.DrawRectangleLines(cast(i32)b.rect.x, cast(i32)b.rect.y, cast(i32)b.rect.width, cast(i32)b.rect.height, b.outline_color)
	rl.DrawText(b.text, b.pos.x, b.pos.y, b.font_size, b.text_color)
}

text_button_isPressed :: proc(b : Text_Button, message : string) -> bool{
	if rl.CheckCollisionPointRec(rl.GetMousePosition(), b.rect) && rl.IsMouseButtonPressed(.LEFT) == true{
		fmt.println(message)
		return !b.isClicked
	}
	return b.isClicked	
}
