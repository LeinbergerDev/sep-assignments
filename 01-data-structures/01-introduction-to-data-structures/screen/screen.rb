require_relative 'pixel'
require 'matrix'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width
    self.height = height
    self.matrix = Matrix.build(height, width){|row, col| col - row}
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    self.matrix[x,y]=pixel
  end

  def at(x, y)
    if inbounds(x,y)
     value = self.matrix[x,y]
     if value.kind_of? Pixel
      return value
     else
      return nil
     end
    else
     return nil
    end
  end

  private

  def inbounds(x, y)
    if x < 0 || y < 0
      return false
    else
      return true
    end
  end

end

class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end
