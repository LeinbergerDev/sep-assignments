require_relative 'node'
require 'prime'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    if key == nil || value == nil
      return
    end
    i = index(key, size)
    if @items[i] == nil
      @items[i] = Node.new(key, value)
      return
    else
      next_index = next_open_index(i)
      if next_index != -1
        @items[next_index] = Node.new(key, value)
        return
      end
    end
    resize
    self.[]=(key, value)
  end

  def [](key)
    i = index(key, size)
    if @items[i] != nil && @items[i].key == key
      return @items[i].value
    else
      # search for key
      for index in i..@items.length
        puts(index.to_s)
        if @items[index] != nil && @items[index].key == key
          return @items[index].value
        end
      end
    end
  end
          

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    i = key.sum % size  
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)   
    for i in index..@items.length
      if i < @items.length && @items[i] == nil
       return i
      end
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

  # Resize the hash
  def resize
    new_size = size * 2

    temp_array = []
    @items.each do |item|
      temp_array.push(Node.new(item.key, item.value)) if item != nil
    end

    @items = Array.new(new_size)
    temp_array.each do |node|
      self.[]=(node.key, node.value)
    end
  end

  def load_factor
    total_nodes = 0.0
    @items.each do |item|
      if item != nil
        total_nodes = total_nodes + 1.0
      end
    end
    factor = total_nodes / size
  end

  def print
    puts("-----------------------------------------------------")
    puts("Load Factor: " + load_factor.to_s)
    puts("Array size: " + size.to_s)
    i = -1
    @items.each do |item|
      i = i + 1
      if item == nil
        puts("Index " + i.to_s + " is empty")
      else
        puts("Index " + i.to_s + " key: " + item.key + " value: " + item.value)
      end
    end
    puts("-----------------------------------------------------")
  end

end