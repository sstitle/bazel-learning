#include <spdlog/spdlog.h>
#include "foobar/foobar.hpp"
#include "shapes/shapes.hpp"
#include <SI/length.h>
#include <SI/area.h>

using namespace SI::literals;

int main() {
  spdlog::info("Hello, World!");
  Foobar();

  // Use the shapes library to calculate areas
  auto radius = 2.0_m;
  auto square_side = 3.0_m;

  auto circle_area = shapes::CircleArea(radius);
  auto square_area = shapes::SquareArea(square_side);

  spdlog::info("Circle area with radius {} = {}", radius.value(), circle_area.value());
  spdlog::info("Square area with side {} = {}", square_side.value(), square_area.value());

  return 0;
}
