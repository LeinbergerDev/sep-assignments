class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @index = -1
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[@index]
  end

  def enqueue(element)
    @index += 1
    @queue.insert(@index, element)
    @head = @queue[0]
    @tail = @queue[@index]
  end

  def dequeue
    if empty?
     return nil
    else
     @index -= 1
     value = @queue[0]
     @queue.delete_at(0)
     @head = @queue[0]
     @tail = @queue[@index]
     return value
    end
  end

  def empty?
    if @queue.length == 0
      return true
    else
      return false
    end
  end
end