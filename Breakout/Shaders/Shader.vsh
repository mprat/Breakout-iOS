//
//  Shader.vsh
//  Breakout
//
//  Created by Michele Pratusevich on 10/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

attribute vec4 position;
attribute vec2 texcoord;
varying highp vec2 tcoord;

uniform mat4 modelViewProjectionMatrix;
void main()
{
    tcoord = texcoord;
    gl_Position = modelViewProjectionMatrix * position;
}
