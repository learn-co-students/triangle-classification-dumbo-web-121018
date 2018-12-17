class Triangle
  attr_accessor :x, :y, :z, :kind

  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z

    case
    when x + y < z || z + y < x || x + z < y
      begin
        raise TriangleError
      rescue TriangleError => error
        puts error.message
      end
    when x == y && y == z && x == z
      @kind = :equilateral
    when x == y || y == z || x == z
      @kind = :isosceles
    when x != y && y != z && z != x
      @kind = :scalene
    when x == 0 || y == 0 || z == 0
      begin
        raise TriangleError
      rescue TriangleError => error
        puts error.message
      end
    end

  end

  class TriangleError < StandardError
    def message
      "This is not a triangle."
    end
  end
end
