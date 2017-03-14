class Triangle

  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    first_try
    if @side1 == @side2 && @side2 == @side3
      return :equilateral
    elsif @side1 == @side2 || @side1 == @side3 || @side2 == @side3
      return :isosceles
    else
      return :scalene
    end
  end

  def first_try
    triangle = [(@side1 + @side2 > @side3), (@side1 + @side3 > @side2), (@side2 + @side3 > @side1)]
    [@side1, @side2, @side3].each do |s|
      triangle << false if s <= 0
    end
    raise TriangleError if triangle.include?(false)
  end
  end

class TriangleError < StandardError

end
