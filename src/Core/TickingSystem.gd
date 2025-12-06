class_name TickingSystem
extends Node

# Important references.
var player; # throw new NotImplementedException();
var UIManager; # throw new NotImplementedException();
var hud:HUD;

# Events
signal VirusTimeExpired;

# coyote time stuff
@export_group("Coyote Time")
@export var coyoteTicks:int;
var CoyoteTicksLeft:int;
var grounded:bool;

# virus things.
@export_group("Virus Timing")
@export var virusDuration:int=3600; # 3600 at 60 tps is 60s.
var VirusTicksRemaining;
var MaskTicksRemaining;

func _ready() -> void:
	# TODO: implement player and add the following to their ground detection:
	# player.GroundEntered.connect(OnGroundEntered);
	# player.GroundExited.connect(OnGroundExited);
	# player.MaskPickedUp.connect(OnMaskPickup);
	
	# field initialization.
	# hud = UIManager.HUD;
	VirusTicksRemaining=virusDuration;
	
	pass;

func _physics_process(delta: float) -> void:
	HandleCoyoteTicks();
	HandleVirusTicks();
	pass;
	
func HandleCoyoteTicks() -> void:
	if(grounded):
		CoyoteTicksLeft=coyoteTicks;
		pass;
	else:
		if(CoyoteTicksLeft>1):CoyoteTicksLeft-=1;
		pass;
	pass;

func HandleVirusTicks() -> void:
	if(MaskTicksRemaining>0):
		MaskTicksRemaining-=1;
		pass;
	elif(VirusTicksRemaining>0):
		VirusTicksRemaining-=1;
		pass;
	else:
		VirusTimeExpired.emit();
		pass;
	hud.TimerUpdate(self);
	pass;

func OnGroundEntered() -> void:
	grounded=true;
	pass;

func OnGroundExited() -> void:
	grounded=false;
	pass;

func OnMaskPickup(mask: MaskPickup) -> void:
	MaskTicksRemaining += mask.MaskTime;
	pass;
