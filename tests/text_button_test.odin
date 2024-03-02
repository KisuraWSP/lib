package tests

import rl "vendor:raylib"
import "../lib"
import "core:fmt"

SCREEN_WIDTH :: 600
SCREEN_HEIGHT :: 500 

main :: proc(){
	rl.InitWindow(SCREEN_WIDTH,SCREEN_HEIGHT,"Text Button Test")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)

	text_button : lib.Text_Button = {"CLICK ME!", {SCREEN_WIDTH / 2 - 100, SCREEN_HEIGHT / 2 - 50, 200, 100}, rl.GOLD, rl.BLACK, rl.WHITE, {SCREEN_WIDTH / 2 - 80, SCREEN_HEIGHT / 2 - 10}, 30, false}
	
	for !rl.WindowShouldClose(){
		rl.BeginDrawing()
		defer rl.EndDrawing()
		rl.ClearBackground(rl.RAYWHITE)
		
		// text button
		lib.draw_text_button(text_button)
		lib.text_button_isPressed(text_button, "text: hallo")
	}
}