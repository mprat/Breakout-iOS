//
//  Shader.fsh
//  Breakout
//
//  Created by Michele Pratusevich on 10/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
