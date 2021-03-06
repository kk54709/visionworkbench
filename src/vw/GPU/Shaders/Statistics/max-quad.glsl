// __BEGIN_LICENSE__
// Copyright (C) 2006-2011 United States Government as represented by
// the Administrator of the National Aeronautics and Space Administration.
// All Rights Reserved.
// __END_LICENSE__


uniform sampler2DRect image;

void main() {
   vec2 coord = gl_TexCoord[0].st;

   vec4 cPixel = texture2DRect(image, coord);
   float cMax = cPixel.r;

   cPixel = texture2DRect(image, coord + vec2(1.0, 0.0));
   cMax = max(cMax, cPixel.r);

   cPixel = texture2DRect(image, coord + vec2(0.0, 1.0));
   cMax = max(cMax, cPixel.r);

   cPixel = texture2DRect(image, coord + vec2(1.0, 1.0));
   cMax = max(cMax, cPixel.r);

   gl_FragColor.r = cMax;
}
