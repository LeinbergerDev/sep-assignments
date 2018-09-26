require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    puts(root.rating.to_s + "|" + node.rating.to_s)
    if root.rating < node.rating
      if root.right == nil
        root.right = node
        puts("added " + root.right.title + " to right side")
      else
        insert(root.right, node)
      end
    else
      if root.left == nil
        root.left = node
        puts("added " + root.left.title + " to left side")
      else
        insert(root.left, node)
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
    myRoot = @root
    printComplete = false
    while searchComplete == false
      if myRoot == nil
        searchComplete = true
      end
      if myRoot != nil
        puts(myRoot.to_s)
        leftRoot = myRoot.left
        rightRoot = myRoot.right
        
    end

    

    # root = nil
    # if children == nil
    #   root = @root
    #   puts(root.to_s)
    # else
    #   root = children
    # end
    # if root.left
    #   puts(root.left.to_s)
    # end
    # if root.right
    #   puts(root.right.to_s)
    # end
    # if root.left
    #   printr(root.left)
    # end
    # if root.right
    #   printr(root.right)
    # end


    # nodeLeft = root.left
    # if nodeLeft 
    #   puts(nodeLeft.to_s)
    # end
    # nodeRight = root.right
    # if nodeRight
    #   puts(nodeRight.to_s)
    # end

    # if nodeLeft != nil
    #   if nodeLeft.left != nil
    #     puts(nodeLeft.left.to_s)
    #   end
    #   if nodeLeft.right != nil
    #     puts(nodeLeft.right.to_s)
    #   end
      
    # end

    # if nodeRight !=nil
    #   if nodeRight.left != nil
    #     puts(nodeRight.left.to_s)
    #   end
    #   if nodeRight.right != nil
    #     puts(nodeRight.right.to_s)
    #   end
    # end
    # if nodeLeft
    #   if nodeLeft.left
    # printf(nodeLeft.left)
    #   end
    #   if nodeLeft.right
    # printf(nodeLeft.right)
    #   end 
    # end
    # if nodeRight
    #   if nodeRight.left
    # printf(nodeRight.left)
    #   end
    #   if nodeRight.right
    #     printf(nodeRight.right)
    #   end
    # end
    

  end

  def printRoot
    puts(@root.to_s)
  end

  def printLevel(index)
    if index == 0
      puts(@root.to_s)
    end

  end

end
