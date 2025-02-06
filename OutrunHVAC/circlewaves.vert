#version 440

layout(location = 0) in vec4 qt_Vertex;
layout(location = 1) in vec2 qt_MultiTexCoord0;
layout(location = 0) out vec2 texCoord;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    float iTime;
    float showState;
};


void main() {
    texCoord = qt_MultiTexCoord0;
    vec4 vertPosition = qt_Vertex;
    gl_Position = qt_Matrix * vertPosition;
}
