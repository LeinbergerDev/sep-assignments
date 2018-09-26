class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :left
  attr_accessor :right

  def initialize(title, rating)
    @title = title
    @rating = rating
  end

  def to_s
    return @title + ": " + @rating.to_s
  end
end