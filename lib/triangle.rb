class Triangle

  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
  end

  def kind
    if [@side_a, @side_b, @side_c].any? {|x| x <= 0}
      raise TriangleError
    elsif @side_a >= @side_b + @side_c || @side_b >= @side_a + @side_c || @side_c >= @side_a + @side_b
      raise TriangleError
    end
    if @side_a == @side_b && @side_b == @side_c
      @kind = :equilateral
    elsif @side_a == @side_b || @side_a == @side_c || @side_b == @side_c
      @kind = :isosceles
    else
      @kind = :scalene
    end
  end

  class TriangleError < StandardError
    # triangle error code
  end

end
