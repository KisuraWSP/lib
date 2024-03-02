package main

import rl "vendor:raylib"
import "lib"

SCREEN_WIDTH :: 1366
SCREEN_HEIGHT :: 768 

main :: proc(){
	rl.InitWindow(SCREEN_WIDTH,SCREEN_HEIGHT,"UI_LIB_TEST")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)
	
	button : lib.Button = {{650,950,150,50},{150,650},0,rl.RED,false}
	
	for !rl.WindowShouldClose(){
		rl.BeginDrawing()
		defer rl.EndDrawing()
		rl.ClearBackground(rl.RAYWHITE)
		
		lib.draw_button(button)	
	}
}