shader_type canvas_item;


uniform sampler2D noise_texture : repeat_enable;
uniform float noiseTiling : hint_range(0.0,5.0)=1.5;
uniform float strength : hint_range(0.0,5.0)=1.5;
uniform float speed : hint_range(0.0,20.0)=10.0;
uniform float frames : hint_range(1.0,10.0)=5.0; 

void vertex() {
}

void fragment() {
	float stepped_time = floor(TIME*frames)/frames;

    vec2 noise_uv = UV + (stepped_time * speed);
	vec4 noise_color = texture(noise_texture, noise_uv*noiseTiling);
	vec2 offset;
    offset.x = (noise_color.r - 0.5) * strength;
    offset.y = (noise_color.g - 0.5) * strength;
    // Bozunmuş UV'den rengi alıyoruz
    COLOR = texture(TEXTURE, UV + offset);
} 

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
