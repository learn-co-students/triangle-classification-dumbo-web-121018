require 'pry'
class Triangle
  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3
  end

  def kind
    array = [@length1, @length2, @length3].sort
    if (array[0] + array[1] <= array[2]) || array.include?(0)
        raise TriangleError
    elsif @length1 == @length2 && @length2 == @length3
      :equilateral
    elsif array.uniq.length != array.length
      :isosceles
    else
      :scalene
    end
    # Will return either :equilateral, :isosceles, or :scalene
  end

  class TriangleError < StandardError
    puts "Custom Error: Invalid triangle."
  end

end
