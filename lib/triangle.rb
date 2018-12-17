class Triangle
  attr_accessor :x, :y, :z, :kind

  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z

    case
    when x + y <= z || z + y <= x || x + z <= y
      raise TriangleError
    when x == y && y == z && x == z
      @kind = :equilateral
    when (x == y || y == z) || x == z
      @kind = :isosceles
    when (x != y && y != z) && z != x
      @kind = :scalene
    when (x <= 0 || y <= 0) || z <= 0
      raise TriangleError
    end

  end

  class TriangleError < StandardError
    def message
      "This is not a triangle."
    end
  end
end
