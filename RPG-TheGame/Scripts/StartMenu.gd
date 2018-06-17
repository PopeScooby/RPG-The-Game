extends Control

var start_scene = "res://Scenes/Levels/Platform_Village.tscn"

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Levels/Platform_Village.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
