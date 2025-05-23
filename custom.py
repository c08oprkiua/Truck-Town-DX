#Truck town custom compilation
target = 'release'
tools = 'no'

SCONS_CACHE = 'scons_cache'

CFLAGS = '-flto'
CCFLAGS = '-flto'

pck = 'yes'
minizip = 'no'
single_pack_source = 'yes'

#vorbis = 'yes'
musepack = 'no'
speex = 'no'
#theora = 'no'
openssl = 'no'


disable_advanced_gui = 'yes'

disable_classes = """
Popup,
WindowDialog,
AcceptDialog,
ConfirmationDialog,
FileDialog,
PopupDialog,
PopupMenu,
PopupPanel,
CheckButton,
ColorPickerButton,
MenuButton,
OptionButton,
TextureButton,
Container,
BoxContainer,
HBoxContainer,
ColorPicker,
VBoxContainer,
CenterContainer,
GridContainer,
SplitContainer,
HSplitContainer,
VSplitContainer,
MarginContainer,
PanelContainer,
ScrollContainer,
ButtonArray,
HButtonArray,
VButtonArray,
ButtonGroup,
EmptyControl,
Node2D,
AnimatedSprite2D,
CollisionObject2D,
Area2D,
PhysicsBody2D,
CharacterBody2D,
RigidBody2D,
StaticBody2D,
Camera2D,
CollisionPolygon2D,
CollisionShape2D,
Joint2D,
DampedSpringJoint2D,
GrooveJoint2D,
PinJoint2D,
ParallaxLayer,
ParticleAttractor2D,
Particles2D,
Path2D,
PathFollow2D,
Polygon2D,
Position2D,
RayCast2D,
RemoteTransform2D,
SoundPlayer2D,
SamplePlayer2D,
Sprite2D,
TileMap,
TouchScreenButton,
ViewportSprite,
VisiblityNotifier2D,
VisiblityEnabler2D,
YSort,
Shape2D,
CapsuleShape2D,
CircleShape2D,
ConcavePolygonShape2D,
ConvexPolygonShape2D,
LineShape2D,
RayShape2D,
RectangleShape2D,
SegmentShape2D,
CubeMap,
Curve2D,
EventStream,
EventStreamChibi,
TileSet,
VideoStream,
VideoStreamTheoraplayer,
World2D,
"""
