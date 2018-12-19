class Triangle
  # write code here
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def one_side_is_zero?
    @side1 == 0 || @side2 == 0 || @side3 == 0
  end

  def triangle_inequality?
    sum1_2 = @side1 + @side2
    sum2_3 = @side2 + @side3
    sum1_3 = @side1 + @side3
    sum1_2 > @side3 && sum2_3 > @side1 && sum1_3 > @side2
  end

  def kind_check
    if @side1 != @side2 && @side2 != @side3 && @side1 != @side3
      :scalene
    elsif @side1 == @side2 && @side2 == @side3 && @side1 == @side3
      :equilateral
    elsif @side1 == @side2 || @side2 == @side3 || @side1 == @side3
      :isosceles
    else
      "Not a valid triangle."
    end
  end


  def kind
    if one_side_is_zero?
      raise TriangleError
    elsif !triangle_inequality?
      raise TriangleError
    else
      kind_check
    end
  end



  class TriangleError < StandardError
    def message_for_zero
      puts "None of the sides of the Triangle can equal 0. Please check the input values."
    end

    def message_for_triangle_inequality
      puts "One of the sides is too big to form a triangle. Please check the input values."
    end
  end
end
