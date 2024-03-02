package main

import rl "vendor:raylib"
import "lib"
import "core:fmt"

STATE :: enum u8{
	INITIAL,
	BUTTON_1,
	BUTTON_2,
	BUTTON_3
}

SCREEN_WIDTH :: 800
SCREEN_HEIGHT :: 700

state := STATE.INITIAL
/*
	RUN THIS PROGRAM TO SEE THE FEATURES OF THIS ENTIRE LIBRARY
*/
main :: proc(){
	rl.InitWindow(SCREEN_WIDTH,SCREEN_HEIGHT,"LIB_WINDOW")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)

	// normal button
	button : lib.Button = {{SCREEN_WIDTH / 2 - 100, SCREEN_HEIGHT / 2 - 200, 200, 100}, rl.PURPLE, rl.BLACK, false}
	
	// image button
	image : rl.Texture2D = rl.LoadTexture("images/logo.png")
	image_button : lib.Image_Button = {image, {SCREEN_WIDTH / 2 - 100, SCREEN_HEIGHT - 350, 200, 100}, rl.PINK, rl.WHITE, rl.BLACK,{SCREEN_WIDTH / 2 - 60, SCREEN_HEIGHT  - 350} ,0, 0.09,false}
	defer rl.UnloadTexture(image)

	// button with text 
	text_button : lib.Text_Button = {"CLICK ME!", {SCREEN_WIDTH / 2 - 100, SCREEN_HEIGHT - 150, 200, 100}, rl.BEIGE, rl.BLACK, rl.BLACK, {SCREEN_WIDTH / 2 - 80, SCREEN_HEIGHT - 110}, 30, false}

	for !rl.WindowShouldClose(){
		rl.BeginDrawing()
		defer rl.EndDrawing()
		rl.ClearBackground(rl.RAYWHITE)
		
		lib.draw_button(button)
		lib.draw_image_button(image_button)
		lib.draw_text_button(text_button)
		
		if lib.button_isPressed(button, "1") == true{
			state = STATE.BUTTON_1
		}

		if lib.image_button_isPressed(image_button, "2") == true{
			state = STATE.BUTTON_2
		}
		
		if lib.text_button_isPressed(text_button, "3") == true{
			state = STATE.BUTTON_3
		}

		#partial switch state{
			case .BUTTON_1:
				rl.ClearBackground(rl.RED)

			case .BUTTON_2:
				rl.ClearBackground(rl.GREEN)
				
			case .BUTTON_3:
				rl.ClearBackground(rl.BLUE)
				
		}
	}
}