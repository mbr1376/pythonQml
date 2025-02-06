#version 440

layout(location = 0) in vec2 texCoord;
layout(location = 0) out vec4 fragFinalColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    float iTime;
    float showState;
};


/**
* Applies smooth displacement to the circumference of the circle.
**/
float variation(vec2 v1, vec2 v2, float strength, float speed) {
	return sin(
        dot(normalize(v1), normalize(v2)) * strength + iTime * speed) / 100.0;
}
/**
* Draws a circle with smooth variation to its circumference over time. 
* @rad - the radius of the circle
* @width - how thick the circle is
* @index - what circle is currently being drawn? Currently, every odd circle is drawn with opposing displacement for effect
**/
vec3 paintCircle (vec2 uv, vec2 center, float rad, float width, float index) {
    vec2 diff = center-uv;
    float len = length(diff);
    float scale = rad;
    float mult = mod(index, 2.) == 0. ? 1. : -1.; 
    len += variation(diff, vec2(rad*mult, 1.0), 1.0*scale + 4.0 * sin(0.6 * iTime), 2.0);
    len -= variation(diff, vec2(1.0, rad*mult), 2.0*scale, 2.0);
    float circle = smoothstep((rad-width)*scale, (rad)*scale, len) - smoothstep((rad)*scale, (rad+width)*scale, len);
    return vec3(circle);
}
/**
* A ring consists of a wider faded circle with an overlaid white solid inner circle. 
**/
vec3 paintRing(vec2 uv, vec2 center, float radius, float index){
     //paint color circle
    vec3 color = paintCircle(uv, center, radius, 0.125, index);
    //this is where the blue color is applied - change for different mood
    color *= vec3(0.6, 0.02, 0.8 + 0.1*sin(iTime * 0.5));
    //paint white circle
    color += 0.3 * paintCircle(uv, center, radius, 0.015, index);
    return color;
}


void main() {
    vec4 fragColor = vec4(0.0);
    vec2 uv = texCoord;
    const int numRings = 10;
    vec2 center = vec2(0.5);
    const float spacing = 1. / numRings;
    const float slow = 10.;
    const float cycleDur = 1.0;
    const float tunnelElongation = .25;
    float radius = mod(-iTime/slow, cycleDur);
    vec3 color = vec3(0.0);
    
    // Move the center and scale
    uv.y -= 0.35;
    uv.x += 0.05;
    
    // Apply showing scaling
    uv *= 1.0 / showState;
    center *= 1.0 / showState;
    
    for(int i=0; i<numRings; i++) {
       color += paintRing(uv, center, tunnelElongation*log(mod(radius + i * spacing, cycleDur)), i ); //these are the fast circles
       color += paintRing(uv, center, log(mod(radius + i * spacing, cycleDur)), i); //these are essentially the same but move at a slower pace
    }
    // Fade to transparent from center and edges
    float dist = distance(uv, center); 
    color = mix(color, vec3(0.), max(0.0 , 1.4 - 8.0 * dist) + 1.9 * dist);
    // Make sure color is in range
    // TODO: Not all of these are actually needed
    color = clamp(color, vec3(0.0), vec3(1.0));
    color.r = max(0.0, color.r);
    color.g = max(0.0, color.g);
    color.b = max(0.0, color.b);
    color.r = min(1.0, color.r);
    color.g = min(1.0, color.g);
    color.b = min(1.0, color.b);
    float alpha = (color.r+color.g+color.b) / 2.0;
    alpha = min(1.0, alpha);
    alpha = max(0.0, alpha);
    
    fragColor = vec4(color, alpha);
    fragFinalColor = fragColor * qt_Opacity;
}
