class_name TickingSystem
extends Node

# Important references.
var player; # throw new NotImplementedException();

# coyote time stuff
@export_group("Coyote Time")
@export var coyoteTicks:int;
var CoyoteTicksLeft:int;
var grounded:bool;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# TODO: implement player and add the following to their ground detection:
	# player.GroundEntered.connect(OnGroundEntered);
	# player.GroundExited.connect(OnGroundExited);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	HandleCoyoteTicks();
	
	pass;
	
func HandleCoyoteTicks() -> void:
	if(grounded):
		CoyoteTicksLeft=coyoteTicks;
		pass;
	else:
		if(CoyoteTicksLeft>1):CoyoteTicksLeft-=1;
		pass;
	pass;

func OnGroundEntered() -> void:
	grounded=true;
	pass;

func OnGroundExited() -> void:
	grounded=false;
	pass;