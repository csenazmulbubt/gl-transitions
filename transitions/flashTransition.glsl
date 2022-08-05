// Author: Nazmul Hoda
// License: MIT

uniform float flashPhase; // = 0.3
uniform float flashIntensity; // = 3.0
uniform float flashZoomEffect; // = 0.5

vec4 transition(vec2 p) {
  vec3 flashColor = vec3(1.0, 0.8, 0.3);
  float flashVelocity = 3.0;
   vec4 fc = getFromColor(p);
   vec4 tc = getToColor( p);
   
  float intensity = mix(1.0, 2.0*distance(p, vec2(0.5, 0.5)), flashZoomEffect) * flashIntensity *   pow(smoothstep(flashPhase, 0.0, distance(0.5, progress)), flashVelocity);
  vec4 c = mix(getFromColor(p), getToColor(p), smoothstep(0.5*(1.0-flashPhase), 0.5*(1.0+flashPhase), progress));
  
  return c += intensity * vec4(flashColor, 1.0);
   
}
