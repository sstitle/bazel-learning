#pragma once

#include <SI/length.h>
#include <SI/area.h>

namespace shapes {
    
// Calculate area of a circle given radius
SI::square_metre_t<double> CircleArea(SI::metre_t<double> radius);

// Calculate area of a square given side length  
SI::square_metre_t<double> SquareArea(SI::metre_t<double> side_length);

}
