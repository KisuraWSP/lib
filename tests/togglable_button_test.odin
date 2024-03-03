package tests

import rl "vendor:raylib"
import "../lib"

SCREEN_WIDTH :: 600
SCREEN_HEIGHT :: 500 

main :: proc(){
    rl.InitWindow(SCREEN_WIDTH,SCREEN_HEIGHT, "Togglable Button Test")
	defer rl.CloseWindow()
	rl.SetTargetFPS(60)
	
	color : [2]rl.Color = {rl.GRAY, rl.SKYBLUE}
	togglable_button : lib.Button_Togglable = {{SCREEN_WIDTH / 2 - 100, SCREEN_HEIGHT / 2 - 50, 200, 100}, color[0], rl.BLACK, false}
	start_time := rl.GetTime()
    for !rl.WindowShouldClose(){
		current_time := rl.GetTime()
		elapsed_time := current_time - start_time
		rl.BeginDrawing()
		defer rl.EndDrawing()
		rl.ClearBackground(rl.RAYWHITE)

        /*
			NOTE!
			Currently i havent found a way to make the button to stay as one color when u toggle it
			without using a timer
		*/
        lib.draw_togglable_button(togglable_button) 
		if lib.togglable_button_isPressed(togglable_button, "togglable: hallo") == true{
			togglable_button.color = color[1] 
		}else{
			if elapsed_time > 2.0{
				togglable_button.color = color[0]
				start_time = current_time
			}
		}
	}
}