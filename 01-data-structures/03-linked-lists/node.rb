class Node
  attr_accessor :next
  attr_accessor :data

  def initialize(data)
    @data = data
    @next = nil
  end

  def to_str
    return @data.to_s
  end
end