#include "shapes/shapes.hpp"
#include <cmath>

namespace shapes {

SI::square_metre_t<double> CircleArea(SI::metre_t<double> radius) {
    // A = π * r²
    auto radius_squared = radius * radius;
    return SI::square_metre_t<double>{M_PI * radius_squared.value()};
}

SI::square_metre_t<double> SquareArea(SI::metre_t<double> side_length) {
    // A = side²
    return side_length * side_length;
}

}
