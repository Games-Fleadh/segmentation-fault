extends CenterContainer

var save_list : Array

# Called when the node enters the scene tree for the first time.
func _ready():
	_set_pane(1)


func _set_pane(p_no):
	$MainMenu.visible = p_no == 1

# Main menu

func _on_new_game_btn_pressed():
	GameState.new_game(GameState.GameDifficulty.GAME_NORMAL)
	print("AAAAAAAAAAAAAAAAAAAAA")

func _on_exit_btn_pressed():
	get_tree().quit()
