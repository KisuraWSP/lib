package tests

import rl "vendor:raylib"
import "../lib"

SCREEN_WIDTH :: 600
SCREEN_HEIGHT :: 500 

main :: proc(){
    rl.InitWindow(SCREEN_WIDTH,SCREEN_HEIGHT, "Button Test")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)
	
	button : lib.Button = {{SCREEN_WIDTH / 2 - 100, SCREEN_HEIGHT / 2 - 50, 200, 100}, rl.RED, rl.BLACK, false}
	
    for !rl.WindowShouldClose(){
		rl.BeginDrawing()
		defer rl.EndDrawing()
		rl.ClearBackground(rl.RAYWHITE)
		
		lib.draw_button(button)	
		lib.button_isPressed(button, "hallo")
	}
}