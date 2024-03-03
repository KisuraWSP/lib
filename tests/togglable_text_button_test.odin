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
    text_color : [2]rl.Color = {rl.GOLD,rl.PINK}
	togglable_text_button : lib.Text_Button_Togglable = {"CLICK ME!",{SCREEN_WIDTH / 2 - 100, SCREEN_HEIGHT / 2 - 50, 200, 100}, color[0], rl.BLACK, text_color[0], {SCREEN_WIDTH / 2 - 90, SCREEN_HEIGHT / 2 - 10}, 35, false}
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
        lib.draw_togglable_text_button(togglable_text_button) 
		if lib.togglable_text_button_isPressed(togglable_text_button, "togglable_text: hallo") == true{
			togglable_text_button.color = color[1] 
            togglable_text_button.text_color = text_color[1]
		}else{
			if elapsed_time > 2.0{
				togglable_text_button.color = color[0]
                togglable_text_button.text_color = text_color[0]
				start_time = current_time
			}
		}
	}
}