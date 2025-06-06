GDPC                0                                                                         P   res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn�      
      ~&���48�ST��%9�e    ,   res://.godot/global_script_class_cache.cfg  @#      �       E%���?g��y���7    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex       �      �Yz=������������       res://.godot/uid_cache.bin  �'      9       V�L>ӑ)T��=�       res://buttonGame/button.gd          8      W��r�g�a��aҜ       res://buttonGame/textBox.gd @      �      ���Dh5���n�cL        res://gdScriptRef/RefClass.gd   `
      �       �E��b�.�W�u7�        res://gdScriptRef/gdScriptRef.gd0      #      f������fǟ\�W�       res://icon.svg  �#      �      C��=U���^Qu��U3       res://icon.svg.import   �      �       i�a�T�]s>z�6�       res://main.gd   �             (f�և���ζ�߾��       res://main.tscn.remap   �"      a       �J�Sw� ������       res://project.binary�'      �       �*t:]�;F�q5�    �|�l��{����extends Button

@onready var overlay = $Overlay
const timeoutTime = 5
var timeout: float = 0

signal next_msg

func _process(delta):
	timeout = max(0, timeout - delta / timeoutTime)
	overlay.set_size(Vector2(size[0] * timeout, size[1]))
	

func _on_pressed():
	if timeout <= 0:
		timeout = 1
		next_msg.emit()
	
�zw�:� extends Label

var msgs = [
	"Did you really just pressed that button?",
	"You are really pressing this button again?",
	"How dare you?",
	"I can't belive this is acutally happening right now.",
	"And you don't even stop pressing this button...",
	"Over...",
	"And over...",
	"And over again.",
	"Unbelievable.",
	"Do you really don't have somethign better to do with your live?",
	"Something...",
	"more productive.",
	"Something.. more aducational maybe?",
	"Or just something more diverse?",
	"Anything that is not just presing this button over and over again?",
	"Followed up by waitong for it to be pressable again...",
	"No?",
	"Okay then.",
	"It's your life.",
	"So just do it.",
	"Press that button again.",
	"And again.",
	"And again.",
	"If that's what makes you happy.",
	"I won't bother anymore.",
	""
]
var msgIndex = 0
const CHAR_PRINT_DELAY = .03

@onready var tween = create_tween()

func _ready():
	tween.kill()
	pass

func setText(index):
	self.text = msgs[index]
	self.visible_ratio = 0
	tween.stop()
	tween.kill()
	tween = create_tween()
	tween.tween_property(self, "visible_ratio", 1, len(self.text) * CHAR_PRINT_DELAY)
	tween.play()
	

func _on_button_next_msg():
	setText(msgIndex)
	if msgIndex < msgs.size() - 1:
		msgIndex += 1
C��2뚐���	extends Node

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
	
�e.�4�����rclass_name RefClass

var nonStaticVar := 0

static var staticVar = 0:
	get:
		return staticVar

func _init():
	staticVar += 1
	nonStaticVar += 1


gQv�9q�E�&��GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح����mow�*��f�&��Cp�ȑD_��ٮ}�)� C+���UE��tlp�V/<p��ҕ�ig���E�W�����Sթ�� ӗ�A~@2�E�G"���~ ��5tQ#�+�@.ݡ�i۳�3�5�l��^c��=�x�Н&rA��a�lN��TgK㼧�)݉J�N���I�9��R���$`��[���=i�QgK�4c��%�*�D#I-�<�)&a��J�� ���d+�-Ֆ
��Ζ���Ut��(Q�h:�K��xZ�-��b��ٞ%+�]�p�yFV�F'����kd�^���:[Z��/��ʡy�����EJo�񷰼s�ɿ�A���N�O��Y��D��8�c)���TZ6�7m�A��\oE�hZ�{YJ�)u\a{W��>�?�]���+T�<o�{dU�`��5�Hf1�ۗ�j�b�2�,%85�G.�A�J�"���i��e)!	�Z؊U�u�X��j�c�_�r�`֩A�O��X5��F+YNL��A��ƩƗp��ױب���>J�[a|	�J��;�ʴb���F�^�PT�s�)+Xe)qL^wS�`�)%��9�x��bZ��y
Y4�F����$G�$�Rz����[���lu�ie)qN��K�<)�:�,�=�ۼ�R����x��5�'+X�OV�<���F[�g=w[-�A�����v����$+��Ҳ�i����*���	�e͙�Y���:5FM{6�����d)锵Z�*ʹ�v�U+�9�\���������P�e-��Eb)j�y��RwJ�6��Mrd\�pyYJ���t�mMO�'a8�R4��̍ﾒX��R�Vsb|q�id)	�ݛ��GR��$p�����Y��$r�J��^hi�̃�ūu'2+��s�rp�&��U��Pf��+�7�:w��|��EUe�`����$G�C�q�ō&1ŎG�s� Dq�Q�{�p��x���|��S%��<
\�n���9�X�_�y���6]���մ�Ŝt�q�<�RW����A �y��ػ����������p�7�l���?�:������*.ո;i��5�	 Ύ�ș`D*�JZA����V^���%�~������1�#�a'a*�;Qa�y�b��[��'[�"a���H�$��4� ���	j�ô7�xS�@�W�@ ��DF"���X����4g��'4��F�@ ����ܿ� ���e�~�U�T#�x��)vr#�Q��?���2��]i�{8>9^[�� �4�2{�F'&����|���|�.�?��Ȩ"�� 3Tp��93/Dp>ϙ�@�B�\���E��#��YA 7 `�2"���%�c�YM: ��S���"�+ P�9=+D�%�i �3� �G�vs�D ?&"� !�3nEФ��?Q��@D �Z4�]�~D �������6�	q�\.[[7����!��P�=��J��H�*]_��q�s��s��V�=w�� ��9wr��(Z����)'�IH����t�'0��y�luG�9@��UDV�W ��0ݙe)i e��.�� ����<����	�}m֛�������L ,6�  �x����~Tg����&c�U��` ���iڛu����<���?" �-��s[�!}����W�_�J���f����+^*����n�;�SSyp��c��6��e�G���;3Z�A�3�t��i�9b�Pg�����^����t����x��)O��Q�My95�G���;w9�n��$�z[������<w�#�)+��"������" U~}����O��[��|��]q;�lzt�;��Ȱ:��7�������E��*��oh�z���N<_�>���>>��|O�׷_L��/������զ9̳���{���z~����Ŀ?� �.݌��?�N����|��ZgO�o�����9��!�
Ƽ�}S߫˓���:����q�;i��i�]�t� G��Q0�_î!�w��?-��0_�|��nk�S�0l�>=]�e9�G��v��J[=Y9b�3�mE�X�X�-A��fV�2K�jS0"��2!��7��؀�3���3�\�+2�Z`��T	�hI-��N�2���A��M�@�jl����	���5�a�Y�6-o���������x}�}t��Zgs>1)���mQ?����vbZR����m���C��C�{�3o��=}b"/�|���o��?_^�_�+��,���5�U��� 4��]>	@Cl5���w��_$�c��V��sr*5 5��I��9��
�hJV�!�jk�A�=ٞ7���9<T�gť�o�٣����������l��Y�:���}�G�R}Ο����������r!Nϊ�C�;m7�dg����Ez���S%��8��)2Kͪ�6̰�5�/Ӥ�ag�1���,9Pu�]o�Q��{��;�J?<�Yo^_��~��.�>�����]����>߿Y�_�,�U_��o�~��[?n�=��Wg����>���������}y��N�m	n���Kro�䨯rJ���.u�e���-K��䐖��Y�['��N��p������r�Εܪ�x]���j1=^�wʩ4�,���!�&;ج��j�e��EcL���b�_��E�ϕ�u�$�Y��Lj��*���٢Z�y�F��m�p�
�Rw�����,Y�/q��h�M!���,V� �g��Y�J��
.��e�h#�m�d���Y�h�������k�c�q��ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[  �c�X���[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://b8shpyax2hdua"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 M?>���ǿf����extends Node2D
�RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://main.gd ��������   Script !   res://gdScriptRef/gdScriptRef.gd ��������   Script    res://buttonGame/textBox.gd ��������   Script    res://buttonGame/button.gd ��������      local://PackedScene_yd4j6 �         PackedScene          	         names "   /      main 	   position    script    Node2D    GDScriptRef    Node    CanvasLayer    VSplitContainer    anchors_preset    anchor_left    anchor_top    anchor_right    anchor_bottom    offset_left    offset_top    offset_right    offset_bottom    grow_horizontal    grow_vertical    size_flags_horizontal    size_flags_vertical    split_offset    dragger_visibility    TextBoxContainer    self_modulate    layout_mode    PanelContainer    Panel    MarginContainer %   theme_override_constants/margin_left $   theme_override_constants/margin_top &   theme_override_constants/margin_right '   theme_override_constants/margin_bottom    TextBox    horizontal_alignment    autowrap_mode    Label    ButtonContainer    Button    text    Overlay    mouse_filter 
   ColorRect    _on_button_next_msg 	   next_msg    _on_pressed    pressed    	   variants       
          @                               ?    �2�    �G�    �2C    �GC               M           ��Y?      �?                            d        �?  �?  �?       	   A Button                         ��M?            C     XB      node_count             nodes     �   ��������       ����                                  ����                           ����                     ����         	      
                                             	      	      
      
                                ����            	                    ����      	                    ����      	                                       $   !   ����      	   "      #                             ����      	                             %   ����            	       	       &   &   ����      	   '                
       *   (   ����                           )   	             conn_count             conns        
      ,   +              
   
   .   -                    node_paths              editable_instances              version             RSRCWG�1lq�@����4�[remap]

path="res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn"
hB��GI��RL�3$list=Array[Dictionary]([{
"base": &"RefCounted",
"class": &"RefClass",
"icon": "",
"language": &"GDScript",
"path": "res://gdScriptRef/RefClass.gd"
}])
���E�*�<svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
D ����u�(�   |"Q4Y��A   res://icon.svg�~�f��
b   res://main.tscn3���GECFG      application/config/name         firstProject   application/run/main_scene         res://main.tscn    application/config/features$   "         4.1    Forward Plus       application/config/icon         res://icon.svg  �sp�rW����'