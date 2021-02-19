extends Node2D

var test_image : Image = Image.new()
var imgtexture : ImageTexture = ImageTexture.new()
var funky_texture : ImageTexture = ImageTexture.new()

var funky : Image = Image.new()

var xpos = 10
var ypos = 10

onready var pic : Sprite = $ico

func _ready() -> void:
	test_image.create(32,32,false,Image.FORMAT_RGBAH)
	funky.load("res://art/blood1.png")
	funky.convert(Image.FORMAT_RGBAH)
	funky_texture.create_from_image(funky)
	test_image.create(2000,2000,false,Image.FORMAT_RGBAH)
	test_image.fill(Color(0,0,0,0))
	test_image.lock()
	test_image.set_pixel(10,10,Color(0,1,1,1))
	update_image()
	pic.texture = imgtexture
		
		
func _physics_process(delta: float) -> void:
	if xpos < 1500:
		test_image.lock()
		test_image.set_pixelv(Vector2(xpos,ypos),Color(1,0,0,1))
		xpos += 5
		update_image()
	

		
func _process(delta: float) -> void:
	if(Input.is_action_pressed("mb_left")):
		test_image.lock()
		test_image.set_pixelv(get_global_mouse_position(),Color(1,0,1,0.1))
		update_image()
	
	if(Input.is_action_pressed("ui_accept")):
		do_bigfuckoffloop()
		
	if(Input.is_action_pressed("ui_down")):
		test_image.lock()
		test_image.blit_rect(funky,Rect2(Vector2(0,0),Vector2(16,16)),get_global_mouse_position())
		update_image()
		
func do_bigfuckoffloop():
	test_image.lock()
	for i in range(200):
		for j in range(200):
			test_image.set_pixel(i,j,Color(rand_range(0,1),rand_range(0,1),rand_range(0,1),1))
			pass
	update_image()
		
func update_image():
	test_image.unlock()
	imgtexture.create_from_image(test_image)

