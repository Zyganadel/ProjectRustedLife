class_name HUD
extends Node

@export var timingInfo:TimingInfo;

@export var virusBar:ProgressBar;

func _ready() -> void:
	virusBar.max_value=timingInfo.virusDuration;
	pass;

func TimerUpdate(tickingSystem: TickingSystem):
	virusBar.value=tickingSystem.VirusTicksRemaining;
	pass;
