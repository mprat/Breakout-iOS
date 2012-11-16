//
//  Shader.fsh
//  Breakout
//
//  Created by Michele Pratusevich on 10/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

varying highp vec2 tcoord;
uniform sampler2D tex;

void main()
{
    gl_FragColor = texture2D(tex, tcoord);
//    gl_FragColor = vec4(tcoord.xy, 0.0, 1.0);
//    gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
//    gl_FragColor = vec4(0, 0, 1.0, 0);
}
