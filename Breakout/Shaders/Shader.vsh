//
//  Shader.vsh
//  Breakout
//
//  Created by Michele Pratusevich on 10/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

attribute vec4 position;
varying highp vec4 tcoord;

uniform mat4 modelViewProjectionMatrix;
void main()
{
    tcoord = position;
    gl_Position = modelViewProjectionMatrix * position;
}
