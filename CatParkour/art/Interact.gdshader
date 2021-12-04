shader_type spatial;
uniform float strength;

void fragment() {
	ALBEDO = vec3(0.0, 0.0, .85);
	ALPHA = strength;
}