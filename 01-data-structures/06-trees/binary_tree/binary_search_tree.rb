require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating < node.rating
      if root.left == nil
        root.left = node
      end
      if root.right == nil
        root.right = node
      end
    else
      tempNode = root
      root = node
      if tempNode.left != nil
        root.left = tempNode.left
      end
      if tempNode.right != nil
        root.right = tempNode.right
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if data ==  nil || root == nil
      return nil
    end
    
    if root.title == data
      return root
    end

    if root.left != nil
      if root.left.title == data
        return root.left
      else
        foundNode = find(root.left, data)
        if foundNode != nil
          return foundNode
        end
      end
    end

    if root.right != nil
      if root.right.title == data
        return root.right
      else
        foundNode = find(root.right, data)
        if foundNode != nil
          return foundNode
        end
      end
    end

    if root.left == nil && root.right == nil
      return nil
    end

  end

  def delete(root, data)
    if root.title == data
      if root.left != nil
        @root = root.left
      end
      if root.right != nil
        @root = root.right
      end
    end
    if root.left != nil
      if root.left.title == data
        root.left = root.left.left
        return
      else
        delete(root.left, data)
      end
    end

    if root.right != nil
      if root.right.title == data
        root.right = root.right.right
        return
      else
        delete(root.right, data)
      end
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    if @root != nil
      queue = Queue.new
      queue.enq(@root)
      result = nil
      while !queue.empty?
        node = queue.deq
        puts(node.to_s)
        queue.enq(node.left) if node.left
        queue.enq(node.right) if node.right
      end
    end
  end

 
end
