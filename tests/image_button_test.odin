package tests

import rl "vendor:raylib"
import "../lib"
import "core:fmt"

SCREEN_WIDTH :: 600
SCREEN_HEIGHT :: 500 

main :: proc(){
	rl.InitWindow(SCREEN_WIDTH,SCREEN_HEIGHT,"Image Button Test")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)
	
	image : rl.Texture2D = rl.LoadTexture("../images/logo.png")
	image_button : lib.Image_Button = {image, {SCREEN_WIDTH / 2 - 100, SCREEN_HEIGHT / 2 - 50, 200, 100}, rl.PINK, rl.WHITE, rl.BLACK,{SCREEN_WIDTH / 2 - 60, SCREEN_HEIGHT / 2 - 50} ,0, 0.09,false}
	
	defer rl.UnloadTexture(image)

	for !rl.WindowShouldClose(){
		rl.BeginDrawing()
		defer rl.EndDrawing()
		rl.ClearBackground(rl.RAYWHITE)
		
		lib.draw_image_button(image_button)
		lib.image_button_isPressed(image_button, "image: hallo")
	}
}