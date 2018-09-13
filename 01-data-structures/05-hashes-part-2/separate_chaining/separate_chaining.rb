require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor
  attr_reader :items

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, size)
    if @items[i] == nil
      @items[i] = LinkedList.new
      @items[i].add_to_front(Node.new(key, value))
    else
      if @items[i].head != nil
        @items[i].add_to_tail(Node.new(key, value))
      end
    end
    load_factor
  end

  def [](key)
    i = index(key, size)
    if @items[i] == nil
      return
    else
      # look for the key in the linked list
      current = @items[i].find_key(key)
      return current.value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    total_nodes = 0.0
    index = -1
    @items.each do |item|
      index = index + 1
      if item != nil
        total_nodes = total_nodes + item.count
      end
    end
    factor = total_nodes / size
    if factor > 0.7
      resize
    end
    return factor
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

  # Resize the hash
  def resize
    # copy the items array into a temp_array
    temp_array = @items
    # double the size of the array 
    @items = Array.new(size * 2)
    # recalculate each node and place it in the resized array
    temp_array.each do |item|
      if item != nil
        if item.head != nil
          current = item.head
          self.[]=(current.key, current.value)
          while current.next != nil
            self.[]=(current.next.key, current.next.value)
            current = current.next
          end
        end
      end
    end
  end

  def print 
    puts("---------------------------------------------------------------")
    puts("Load Factor: " + load_factor.to_s)
    puts("Array Size: " + size.to_s)
    i = -1
    @items.each do |item|
      i = i + 1
      puts("Bucket @ index: " + i.to_s )
      if item == nil
        puts("-----------")
        puts("     Bucket is empty")
        puts("-----------")
      end
      
      if item != nil
        puts("-----------")
        current = item.head
        puts("Head key: " + current.key + " value: " + current.value)
        while current.next != nil
          puts("Next key: " + current.next.key + " value: " + current.next.value)
          current = current.next
        end
        puts("-----------")
      end
    end
  end
end
