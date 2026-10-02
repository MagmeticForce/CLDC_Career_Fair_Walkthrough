extends Node3D
class_name Main

# ######################## # 
# CONTENTS
# 1. Creating Parameters			
# 2. Right When Things Loads
# 3. Every Frame of the Game
#	a. Handling the Current Stage
#	   of the Walkthrough
#	b. Handling Transitions
# 4. Events
#	a. Button Presses
# Second-To-Last. Function Definitions 
# Final. Renaming Blocks of Code That
#        Don't Read Well Using
#		 Functions
# ######################## # 

# NOTE-to-reader: hover over a function or variable
# to learn more about what it does.

# NOTE-to-reader: as you read this script, you'll notice 
# that, before we do anything with a node, we first check 
# if it is valid. However, sometimes we don't do this,
# and that is because we're using a command/function that
# already checks if it's valid.






# ################################################################# #
# ################################################################# #
# ################################################################# #
# 1. CREATING PARAMETERS 											#
# ################################################################# #
# ################################################################# #
# ################################################################# #

# Nodes from the Scene tree
@onready var _2d_ui_1_node: Control = $_2D_UI_Elements/_2D_UI_1
@onready var initial_elevator_pitch_input_field_node: TextEdit = $_2D_UI_Elements/_2D_UI_1/Initial_Elevator_Pitch_Input_Field
@onready var switch_to_windowed_button_node: Button = $_2D_UI_Elements/_2D_UI_1/Switch_To_Windowed_Button
@onready var switched_to_windowed_cooldown_timer_node: Timer = $_2D_UI_Elements/_2D_UI_1/Switch_To_Windowed_Cooldown_Timer
@onready var _2d_ui_2_node: Control = $_2D_UI_Elements/_2D_UI_2
@onready var _2d_ui_3_node: Control = $_2D_UI_Elements/_2D_UI_3
@onready var _2d_ui_4_node: Control = $_2D_UI_Elements/_2D_UI_4
@onready var _2d_ui_5_node: Control = $_2D_UI_Elements/_2D_UI_5
@onready var _2d_ui_6_node: Control = $_2D_UI_Elements/_2D_UI_6
@onready var _2d_ui_7_node: Control = $_2D_UI_Elements/_2D_UI_7
@onready var _2d_ui_8_node: Control = $_2D_UI_Elements/_2D_UI_8
@onready var _2d_ui_9_node: Control = $_2D_UI_Elements/_2D_UI_9
@onready var _3d_scene_1_node: Node3D = $_3D_Scenes/_3D_Scene_1
@onready var _3d_scene_2_node: Node3D = $_3D_Scenes/_3D_Scene_2
@onready var _3d_scene_3_node: Node3D = $_3D_Scenes/_3D_Scene_3
@onready var map_node: MeshInstance3D = $_3D_Scenes/_3D_Scene_3/Map
@onready var id_card_node: MeshInstance3D = $_3D_Scenes/_3D_Scene_2/ID_Card
@onready var paper_node: MeshInstance3D = $_3D_Scenes/_3D_Scene_2/Paper
@onready var pen_node: MeshInstance3D = $_3D_Scenes/_3D_Scene_2/Pen
@onready var camera_node: Camera3D = $_3D_Scenes/For_All_Scenes/Camera
@onready var pen_001_node: MeshInstance3D = $_3D_Scenes/_3D_Scene_2/Pen_001
@onready var name_tag_node: MeshInstance3D = $_3D_Scenes/_3D_Scene_2/Name_Tag

var camera_position_transition_number: int = -1 # for now

var elevator_pitch_has_been_saved: bool = false

var stage: int = 1

# For handling transitions:

var active_transitions: Array[Dictionary] = []

var occurring_transitions: Array = []
var transition_start_values: Array = []
var transition_end_values: Array = []
var transition_amounts: Array = []






# ################################################################# #
# ################################################################# #
# ################################################################# #
# 2. RIGHT WHEN THINGS LOAD 										#
# ################################################################# #
# ################################################################# #
# ################################################################# #

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if this_is_valid(_2d_ui_1_node):
		_2d_ui_1_node.show()
	if this_is_valid(_2d_ui_2_node):
		_2d_ui_2_node.hide()
	if this_is_valid(_2d_ui_3_node):
		_2d_ui_3_node.hide()
	if this_is_valid(_2d_ui_4_node):
		_2d_ui_4_node.hide()
	if this_is_valid(_2d_ui_5_node):
		_2d_ui_5_node.hide()
	if this_is_valid(_2d_ui_6_node):
		_2d_ui_6_node.hide()
	if this_is_valid(_2d_ui_7_node):
		_2d_ui_7_node.hide()
	if this_is_valid(_2d_ui_8_node):
		_2d_ui_8_node.hide()
	if this_is_valid(_2d_ui_9_node):
		_2d_ui_9_node.hide()
	
	if this_is_valid(_3d_scene_1_node):
		_3d_scene_1_node.show()
	if this_is_valid(_3d_scene_2_node):
		_3d_scene_2_node.hide()
	if this_is_valid(paper_node):
		paper_node.hide()
	if this_is_valid(pen_node):
		pen_node.hide()
	if this_is_valid(id_card_node):
		id_card_node.hide()
	if this_is_valid(_3d_scene_3_node):
		_3d_scene_3_node.hide()
		
	if this_is_valid(camera_node):
		camera_node.position = Vector3(83.51, 2.75, 11.66)
		camera_node.rotation = Vector3(0.0, PI/2, 0.0)
	if this_is_valid(id_card_node):
		id_card_node.position = Vector3(-3.415, 0.955, -14.988)
		id_card_node.rotation = Vector3(0.0, 0.0, 0.0)
	if this_is_valid(paper_node):
		paper_node.position = Vector3(-3.269, 0.818, -13.715)
		paper_node.rotation = Vector3(0.0, 0.0, 0.0)
	if this_is_valid(pen_node):
		pen_node.position = Vector3(-3.059, 0.818, -13.373)
		pen_node.rotation = Vector3(0.0, 0.0, 0.0)
	if this_is_valid(pen_001_node):
		pen_001_node.position = Vector3(-3.059, 0.818, -8.173)
		pen_001_node.rotation = Vector3(0.0, 0.0, 0.0)
	if this_is_valid(name_tag_node):
		name_tag_node.position = Vector3(-3.298, 1.065, -8.754)
		name_tag_node.rotation = Vector3(0.0, 0.0, -PI/2)
		
	var game_window = get_window()
	if this_is_valid(game_window):
		game_window.content_scale_aspect = Window.CONTENT_SCALE_ASPECT_KEEP






# ################################################################# #
# ################################################################# #
# ################################################################# #
# 3. EVERY FRAME OF THE GAME										#
# ################################################################# #
# ################################################################# #
# ################################################################# #

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var time_since_previous_frame: float = delta
	
	
	
# ################################################################# #
# ################################################################# #
# ################################################################# #
# 3.a. EVERY FRAME OF THE GAME: HANDLING THE CURRENT STAGE OF THE	#
#	   WALKTHROUGH													#
# ################################################################# #
# ################################################################# #
# ################################################################# #

	# Do different things based on what the stage is:
	match stage:
		1:
			pass
		2:
			if not elevator_pitch_has_been_saved:
				var save_file = FileAccess.open("user://elevator_pitch.save", FileAccess.WRITE)
				if this_is_valid(save_file):
					if this_is_valid(initial_elevator_pitch_input_field_node):
						var stuff_to_write_to_save_file = {
							"elevator_pitch": initial_elevator_pitch_input_field_node.text
						}
						write_stuff_to_file(stuff_to_write_to_save_file, save_file)
				elevator_pitch_has_been_saved = true
		3:
			pass
		4:
			if this_is_valid(camera_node):
				if not transition_is_occurring(camera_node, "position"):
					hide_node_if_it_is_visible(_3d_scene_1_node)
					show_node_if_it_is_hidden(_3d_scene_2_node)
					show_node_if_it_is_hidden(_2d_ui_4_node)
		5:
			if not transition_is_occurring(camera_node, "position") and not transition_is_occurring(camera_node, "rotation"):
				show_node_if_it_is_hidden(_2d_ui_5_node)
		6:
			if not transition_is_occurring(id_card_node, "position") and not transition_is_occurring(camera_node, "rotation"):
				hide_node_if_it_is_visible(id_card_node)
				show_node_if_it_is_hidden(_2d_ui_7_node)
		7:
			pass
		8:
			if not transition_is_occurring(pen_node, "position") and not transition_is_occurring(pen_node, "rotation") and not transition_is_occurring(camera_node, "rotation"):
				show_node_if_it_is_hidden(_2d_ui_7_node)
		9:
			if not transition_is_occurring(camera_node, "rotation") and not transition_is_occurring(camera_node, "position") and not transition_is_occurring(name_tag_node, "position") and not transition_is_occurring(pen_001_node, "position") and not transition_is_occurring(pen_001_node, "rotation"):
				if this_is_valid(_2d_ui_7_node):
					_2d_ui_7_node.hide()
				if this_is_valid(_2d_ui_8_node):
					_2d_ui_8_node.show()
		10:
			if not transition_is_occurring(camera_node, "position") and not transition_is_occurring(camera_node, "rotation"):
				if this_is_valid(camera_node):
					if not camera_node.rotation == Vector3(0.0, 0.0, 0.0):
						camera_node.rotation = Vector3(0.0, 0.0, 0.0)
				hide_node_if_it_is_visible(_3d_scene_2_node)
				show_node_if_it_is_hidden(_3d_scene_3_node)
				show_node_if_it_is_hidden(_2d_ui_9_node)
		11:
			if not transition_is_occurring(map_node, "position"):
				hide_node_if_it_is_visible(map_node)
	
	
	
# ################################################################# #
# ################################################################# #
# ################################################################# #
# 3.b. EVERY FRAME OF THE GAME: HANDLING TRANSITIONS				#
# ################################################################# #
# ################################################################# #
# ################################################################# #

	# This code is triggered by the transition functions like start_transition(),
	# stop_transition(), transition_is_occurring().
	# Those functions essentially reads and modifies occurring_transitions.
	# Then, the code here looks at occurring_transitions and makes those
	# transitions actually happen.

	var occurring_transitions_that_are_still_transitioning: Array[Dictionary] = [] # for now
	# Go through each transition in occurring_transitions:
	for transition in occurring_transitions:
		if transition["Delay timer"] < transition["Delay"]:
			transition["Delay timer"] += time_since_previous_frame
		else:
			# We can begin transitioning
			transition["Transition amount"] += transition["Transition speed"] * time_since_previous_frame
			transition["Transition amount"] = clamp(transition["Transition amount"], 0.0, 1.0)
			transition["Object with transitioning value"].set(transition["Transitioning value"], lerp(transition["Start value"], transition["End value"], transition["Transition amount"]))
		
		if transition["Transition amount"] < 1.0:
			occurring_transitions_that_are_still_transitioning.append(transition)
			
	occurring_transitions = occurring_transitions_that_are_still_transitioning
	# (This removes any values that are done transitioning.)
	
	
	
	
	
	
# ################################################################# #
# ################################################################# #
# ################################################################# #
# 4. EVENTS 														#
# ################################################################# #
# ################################################################# #
# ################################################################# #



# ################################################################# #
# ################################################################# #
# ################################################################# #
# 4.a. EVENTS: BUTTON PRESSES 										#
# ################################################################# #
# ################################################################# #
# ################################################################# #

# These functions are orgaized in the order in which their corresponding
# buttons appear in the simulator.

func _when_2d_ui_1_done_button_is_pressed() -> void:
	if this_is_valid(_2d_ui_1_node):
		_2d_ui_1_node.hide()
	if this_is_valid(_2d_ui_2_node):
		_2d_ui_2_node.show()
	stage = 2
	# We COULD do stage += 1, but later we have a multi-route part
	# (presenting grizzID or stating that you're an alumni)
	# and each route is a different stage, so it could be the
	# case that we jump two stages later, where the skipped
	# stage is for the route that wasn't chosen.
	
func _when_2d_ui_1_switch_to_windowed_button_is_pressed() -> void:
	if this_is_valid(switched_to_windowed_cooldown_timer_node):
		if switched_to_windowed_cooldown_timer_node.is_stopped():
			if this_is_valid(switch_to_windowed_button_node):
				if switch_to_windowed_button_node.text == "Switch to Windowed":
					switch_to_windowed_button_node.text = "Switch to Fullscreen"
					var game_window = get_window()
					if this_is_valid(game_window):
						game_window.mode = Window.MODE_WINDOWED
						game_window.size = Vector2i(1152, 648)
						game_window.position = Vector2i(480, 270)
				elif switch_to_windowed_button_node.text == "Switch to Fullscreen":
					switch_to_windowed_button_node.text = "Switch to Windowed"
					var game_window = get_window()
					if this_is_valid(game_window):
						game_window.size = Vector2i(1920, 1080)
						game_window.position = Vector2i(0, 0)
						game_window.mode = Window.MODE_FULLSCREEN
			switched_to_windowed_cooldown_timer_node.start()
			
func _when_take_multiple_copies_button_is_pressed() -> void:
	if this_is_valid(_2d_ui_2_node):
		_2d_ui_2_node.hide()
	if this_is_valid(_2d_ui_3_node):
		_2d_ui_3_node.show()
	stage = 3

func _when_enter_the_oc_button_is_pressed() -> void:
	if this_is_valid(_2d_ui_3_node):
		_2d_ui_3_node.hide()
	if this_is_valid(camera_node):
		start_transition(camera_node, "position", Vector3(83.51, 2.75, 11.66), Vector3(52.51, 2.75, 5.669), 2.0)
	stage = 4
	
func _when_walk_through_the_line_button_is_pressed() -> void:
	stage = 5
	
	if this_is_valid(_2d_ui_4_node):
		_2d_ui_4_node.hide()
	
	start_transition(camera_node, "rotation", Vector3(0.0, PI/2, 0.0), Vector3(0.0, PI, 0.0), 2.0)
	start_transition(camera_node, "position", Vector3(52.51, 2.75, 5.669), Vector3(52.51, 2.75, 22.66), 2.0, 0.5)
	
	start_transition(camera_node, "rotation", Vector3(0.0, PI, 0.0), Vector3(0.0, PI/2, 0.0), 2.0, 1.0)
	start_transition(camera_node, "position", Vector3(52.51, 2.75, 22.66), Vector3(45.14, 2.75, 22.66), 2.0, 1.5)
	
	start_transition(camera_node, "rotation", Vector3(0.0, PI/2, 0.0), Vector3(0.0, 0.0, 0.0), 2.0, 2.0)
	start_transition(camera_node, "position", Vector3(45.14, 2.75, 22.66), Vector3(45.14, 2.75, 17.66), 2.0, 2.5)
	
	start_transition(camera_node, "rotation", Vector3(0.0, 0.0, 0.0), Vector3(0.0, PI/2, 0.0), 2.0, 3.0)
	start_transition(camera_node, "position", Vector3(45.14, 2.75, 17.66), Vector3(38.647, 2.75, 17.769), 2.0, 3.5)
	# Show the next _2D_UI node: see section 3.a (rememeber that stage = 5 now)
	
func _when_present_grizz_id_button_is_pressed() -> void:
	stage = 6
	if this_is_valid(_2d_ui_5_node):
		_2d_ui_5_node.hide()
	if this_is_valid(id_card_node):
		id_card_node.show()
	start_transition(camera_node, "rotation", Vector3(0.0, PI/2, 0.0), Vector3(deg_to_rad(-30), PI/2, 0.0), 2.0)
	start_transition(id_card_node, "position", Vector3(-3.415, 0.955, -14.988), Vector3(-3.415, 0.955, -13.888), 4.0, 1.0)
	# Do a transition that does basically nothing, so that the card stays in place for
	# a bit before we make it disappear in section 3.a.:
	start_transition(id_card_node, "position", Vector3(-3.415, 0.955, -13.888), Vector3(-3.415, 0.955, -13.888), 1.0, 1.5)
	start_transition(camera_node, "rotation", Vector3(deg_to_rad(-30), PI/2, 0.0), Vector3(0.0, PI/2, 0.0), 2.0, 2.0)
	# make the ID card disappear when it's done doing it's transitions, and also make the
	# next _2D_UI node appear: see section 3.a.

func _when_state_alumni_button_is_pressed() -> void:
	stage = 7
	if this_is_valid(_2d_ui_5_node):
		_2d_ui_5_node.hide()
	if this_is_valid(_2d_ui_6_node):
		_2d_ui_6_node.show()

func _when_fill_out_the_paper_button_is_pressed() -> void:
	stage = 8
	if this_is_valid(_2d_ui_6_node):
		_2d_ui_6_node.hide()
	if this_is_valid(pen_node):
		pen_node.show()
	if this_is_valid(paper_node):
		paper_node.show()
	start_transition(camera_node, "rotation", Vector3(0.0, PI/2, 0.0), Vector3(deg_to_rad(-30), PI/2, 0.0), 2.0)
	start_transition(pen_node, "position", Vector3(-3.059, 0.818, -13.373), Vector3(-3.259, 1.318, -13.873), 2.0, 1.0)
	start_transition(pen_node, "rotation", Vector3(0.0, 0.0, 0.0), Vector3(0.0, 0.0, PI/2), 2.0, 1.0)
	start_transition(pen_node, "position", Vector3(-3.259, 1.318, -13.873), Vector3(-3.259, 1.318, -13.573), 2.0, 1.5)
	start_transition(pen_node, "position", Vector3(-3.259, 1.318, -13.573), Vector3(-3.059, 0.818, -13.373), 2.0, 2.0)
	start_transition(pen_node, "rotation", Vector3(0.0, 0.0, PI/2), Vector3(0.0, 0.0, 0.0), 2.0, 2.0)
	start_transition(camera_node, "rotation", Vector3(deg_to_rad(-30), PI/2, 0.0), Vector3(0.0, PI/2, 0.0), 2.0, 2.5)

func _when_go_to_name_tag_station_button_is_pressed() -> void:
	if this_is_valid(_2d_ui_7_node):
		_2d_ui_7_node.hide()
	start_transition(camera_node, "rotation", Vector3(0.0, PI/2, 0.0), Vector3(0.0, 0.0, 0.0), 2.0)
	start_transition(camera_node, "position", Vector3(38.647, 2.75, 17.769), Vector3(38.547, 2.75, 12.769), 2.0, 0.5)
	start_transition(camera_node, "rotation", Vector3(0.0, 0.0, 0.0), Vector3(deg_to_rad(-30.0), PI/2, 0.0), 2.0, 1.0)
	start_transition(name_tag_node, "position", Vector3(-3.298, 1.065, -8.754), Vector3(-3.598, 1.065, -8.754), 2.0, 1.5)
	start_transition(name_tag_node, "position", Vector3(-3.598, 1.065, -8.754), Vector3(-3.598, 0.865, -8.754), 2.0, 2.0)
	start_transition(name_tag_node, "position", Vector3(-3.598, 0.865, -8.754), Vector3(-3.598, 0.865, -8.754), 2.0, 2.5)
	start_transition(pen_001_node, "position", Vector3(-3.059, 0.818, -8.173), Vector3(-3.6, 1.318, -8.973), 2.0, 3.0)
	start_transition(pen_001_node, "rotation", Vector3(0.0, 0.0, 0.0), Vector3(0.0, 0.0, PI/2), 2.0, 3.0)
	start_transition(pen_001_node, "position", Vector3(-3.6, 1.318, -8.973), Vector3(-3.6, 1.318, -8.573), 2.0, 3.5)
	start_transition(pen_001_node, "position", Vector3(-3.6, 1.318, -8.573), Vector3(-3.059, 0.818, -8.173), 2.0, 4.0)
	start_transition(pen_001_node, "rotation", Vector3(0.0, 0.0, PI/2), Vector3(0.0, 0.0, 0.0), 2.0, 4.0)
	start_transition(name_tag_node, "position", Vector3(-3.598, 0.865, -8.754), Vector3(-4.598, 0.865, -8.754), 2.0, 4.5)
	start_transition(camera_node, "rotation", Vector3(deg_to_rad(-30.0), PI/2, 0.0), Vector3(0.0, PI/2, 0.0), 2.0, 5.0)
	stage = 9

func _when_go_to_career_fair_button_is_pressed() -> void:
	if this_is_valid(_2d_ui_8_node):
		_2d_ui_8_node.hide()
	start_transition(camera_node, "rotation", Vector3(0.0, PI/2, 0.0), Vector3(0.0, deg_to_rad(-30.0), 0.0), 2.0)
	start_transition(camera_node, "position", Vector3(38.547, 2.75, 12.769), Vector3(51.547, 2.75, -9.748), 1.0, 0.5)
	stage = 10
	
func _when_use_map_button_is_pressed() -> void:
	if this_is_valid(_2d_ui_9_node):
		_2d_ui_9_node.hide()
	start_transition(map_node, "position", Vector3(-18.9, 1.341, -1.437), Vector3(-18.9, 1.741, -1.437), 2.0)
	start_transition(map_node, "position", Vector3(-18.9, 1.741, -1.437), Vector3(-18.9, 1.341, -1.437), 2.0, 2.0)
	start_transition(camera_node, "position", Vector3(51.547, 2.75, -9.748), Vector3(51.547, 2.75, -22.748), 1.0, 2.5)
	start_transition(camera_node, "rotation", Vector3(0.0, 0.0, 0.0), Vector3(0.0, -PI/2, 0.0), 2.0, 3.5)
	start_transition(camera_node, "position", Vector3(51.547, 2.75, -22.748), Vector3(53.247, 2.75, -22.748), 2.0, 4.0)
	start_transition(camera_node, "rotation", Vector3(0.0, -PI/2, 0.0), Vector3(0.0, 0.0, 0.0), 2.0, 4.5)
	stage = 11






# ################################################################# #
# ################################################################# #
# ################################################################# #
# Second-To-Last. FUNCTION DEFINITIONS 								#
# ################################################################# #
# ################################################################# #
# ################################################################# #

func hide_node_if_it_is_visible(node_input: Node):
	if this_is_valid(node_input):
		if node_input.visible:
			node_input.hide()

func show_node_if_it_is_hidden(node_input: Node):
	if this_is_valid(node_input):
		if not node_input.visible:
			node_input.show()

func start_transition(object_with_transitioning_value, value_to_transition, start_value_input, end_value_input, speed_input, delay_input = 0.0) -> void:
	if value_to_transition in object_with_transitioning_value:
		var transition_info: Dictionary = {
			"Transitioning value": value_to_transition,
			"Object with transitioning value": object_with_transitioning_value,
			"Start value": start_value_input,
			"End value": end_value_input,
			"Transition amount": 0.0,
			"Transition speed": speed_input,
			"Delay": delay_input,
			"Delay timer": 0.0
		}
		occurring_transitions.append(transition_info)
		# Handle the transition: see section 3.b.
	else:
		print_debug("ERROR: start_transition(): " + str(object_with_transitioning_value) + " does not have attribute " + value_to_transition)

func stop_transition(object_with_transitioning_value, value_to_transition) -> void:
	# Go through each transition in occurring_transitions:
	var transition_to_remove = null # for now
	for transition in occurring_transitions:
		if transition["Object with transitioning value"] == object_with_transitioning_value and transition["Transitioning value"] == value_to_transition:
			transition_to_remove = transition
	if transition_to_remove != null:
		occurring_transitions.erase(transition_to_remove)

func transition_is_occurring(object_with_transitioning_value, value_to_transition) -> bool:
	# Go through each transition in occurring_transitions:
	for transition in occurring_transitions:
		if transition["Object with transitioning value"] == object_with_transitioning_value and transition["Transitioning value"] == value_to_transition:
			return true
	# If you went through every occurring transition and you never returned true...
	return false 

func write_stuff_to_file(stuff_input, file_input) -> void:
	if this_is_valid(stuff_input) and this_is_valid(file_input):
		var new_line_of_save_file = JSON.stringify(stuff_input)
		file_input.store_line(new_line_of_save_file)






# ################################################################# #
# ################################################################# #
# ################################################################# #
# Final. RENAMING BLOCKS OF CODE THAT DON'T READ WELL USING 		#
#		 FUNCTIONS 													#
# ################################################################# #
# ################################################################# #
# ################################################################# #

# (I proabbly could have shortened the name to something like
# "RENAMING CODE" but idk, I just like to be very specific and
# upfront on what exactly each section is about.)

func last_index_of(array_input: Array) -> int:
	return array_input.size() - 1
	# We do this because if an array's
	# size is 3 for example, then its 
	# indices are 0 1 2, and 2 is 3 - 1. 


# this_is_valid() description:
## If you tell the game something like [code]my_node = $"(insert node 
## that doesn't exist)"[/code], then it will be invalid. Even though 
## you'll never intentionally write that, you might rename a 
## node and then forget to update the script, or you might try
## accessing a node that has been removed, or make a similar 
## mistake. So before we do anything with a node, we first need to 
## see if it's valid!
func this_is_valid(object_input):
	# Essentially, if you write "if my_object", then the
	# "if" condition is true if my_object is valid.
	if object_input:
		return true
	else:
		return false
