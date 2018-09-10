class HashClass
  attr_accessor :size

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    i = self.index(key, self.size)
    hash_item = @items[i]
    if hash_item != nil
      # check for collision
      if hash_item.value != value
        resize
        if hash_item.key != key
          self.[]=(key, value)
        end
      end
    end

    if hash_item == nil
      @items[i] = HashItem.new(key, value)
    end
  end

  def [](key)
    i = self.index(key, @items.length)
    if @items[i] != nil
      return @items[i].value  
    else
      return nil
    end
  end

  def resize
    # first double the size of the array
    @size = @size * 2
    
    # Get an array that contains the items from the @items array.  Ignore nil items
    temp_array = []
    @items.each do |item|
      if item != nil
        temp_array.push(item)
      end
    end

    # recalc the index of each item in the temp array.
    @items = Array.new(@size)
    temp_array.each do |item|
      self.[]=(item.key, item.value)
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    return @size
  end

end
