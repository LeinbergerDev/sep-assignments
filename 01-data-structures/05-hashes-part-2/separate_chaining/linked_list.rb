require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
     if @head == nil
      @head = node
      @head.next = nil
      @tail = @head
      @tail.next = nil
      
    else
      #current = find_tail
      #current.next = node
      temp_node = @tail
      temp_node.next = node
      @tail = temp_node.next
          
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head == @tail
      @head = nil
      @tail = nil
      return
    end
    current = find_tail
    if current 
      last_node = find_before(current)
      if last_node
        last_node.next = nil
        @tail = last_node
      end
    end
  end

  # This method prints out a representation of the list.
  def print
    if @head
      current = @head
      while current.next != nil
        puts(current.to_str)
        current = current.next
      end
      puts(current.to_str)
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head == node
      temp_node = @head
      @head = @head.next
      @head.next = temp_node.next.next
    end
    if @tail == node
      current = find_before(node)
      current.next = nil
      @tail = current
    end
    current = find_before(node)
    if current
      current.next = current.next.next
      return
    end

  end

  def find(node)
    if @head == node
      return node
    end
    if @tail == node
      return node
    end
    if @head
      current = @head
      while current.next != nil
        if current == node || current.next == node
          return node
        end
        current = current.next
      end
    end
    return nil
  end

  def find_key(key)
    if @head.key == key
      return @head
    end
    if @tail.key == key
      return @tail
    end
    if @head
      current = @head
      if current.key == key
        return current
      end
      while current.next != nil
        if current.next.key == key
          return current.next
        end
        current = current.next
      end
    end
    return nil
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head == nil
      @head = node
      @tail = @head
      return
    end
    temp_node = @head
    if temp_node
      @head = node
      @head.next = temp_node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head == nil
      return
    end
    if @head.next != nil
      temp_node = @head
      @head = temp_node.next
      @head.next = (temp_node.next).next
      return temp_node
    else
      @head = nil
      return @head
    end

  end

  def count
    i = 0
    current = @head
    if current == nil 
      return
    else
      i = 1
      while current.next != nil
        i = i + 1
        current = current.next
      end
    end
    return i
  end

  private

  def find_tail
    current = @head
    while current.next != nil
      current = current.next
    end
    return current
  end

  def find_before(node)
    current = @head
    while current.next != nil
      if current.next.value == node.value
        return current
      end
      current = current.next
    end
    return nil
  end

end