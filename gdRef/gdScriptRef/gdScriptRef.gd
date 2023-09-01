extends Node

# Enums
enum enums {e1, e2, e3 = 10, e4}

# Classes
class ChildClass extends RefClass:
	func _init():
		nonStaticVar = 11
		staticVar += 1
		print("Init child with: ", staticVar)

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hello World!")
	
	# Vaiables
	var intVar1: int = 1 # can only be int
	var intVar2 := 2 # can only be int	
	print("te" + "st: " + str(intVar1) + " " + str(intVar2))
	print(enums.e1, " ", enums.e4)
	print()
	
	# Arrays
	var a = []
	for i in range(3):
		a.append(null)
	a[0] = 0
	a[1] = "1 array"
	a[2] = 2
	
	for e in a:
		print(e)
	print()
	
	# Directories
	var dirIndex1 = "dix1"
	var d = {
		"val1": 1, 
		dirIndex1: 2,
		1: "1 as well"
	}
	
	print(d[dirIndex1])
	print(d["dix1"])
	print(d.dix1)
	d["val2"] = 22
	print(d["val2"])
	print()
	
	# Objects
	var refClass1 = RefClass.new()
	var refClass2 = RefClass.new()
	var childClass = ChildClass.new()
	
	print(refClass1.staticVar, " ", refClass1.nonStaticVar)
	print(refClass2.staticVar, " ", refClass2.nonStaticVar)
	print(childClass.staticVar, " ", childClass.nonStaticVar)
	print()
	
	# Casting
	
