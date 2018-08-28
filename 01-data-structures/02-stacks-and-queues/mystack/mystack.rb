class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    @index = -1
    self.top = nil
  end

  def push(item)
    @index += 1
    @stack.insert(@index, item)
    self.top = @stack[@index]
  end

  def pop
    value = @stack[@index]
    @stack.delete_at(@index)
    @index -= 1
    self.top = @stack[@index]
    return value;
  end

  def empty?
    if @index == -1
      return true
    else
      return false
    end
  end
  
end