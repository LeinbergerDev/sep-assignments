require_relative 'node'

class Minheap
    attr_accessor :root

    def initialize(root)
        @root = root
    end

    def insert(root, data)
        # if @root is nil then insert data to @root.
        @root = data if @root == nil
        #check if root rating is greater than data.rating
        if root.rating > data.rating
            # store the root object in a temp node.
            temp = root
            # reset @root to the data node.
            @root = data
            # insert the temp node back into the heap.
            insert(@root, data)
        else
            # since @root rating is less than data rating insert data as a child.
            # if the left leaf is nil insert the data node there.
            if root.left == nil
                root.left = data
                # exit method
                return
            # if the left leaf has a value compare it to the data rating value.
            else
                if root.left < data.rating
                    # if the right node is nil enter it there.
                    if root.right == nil
                        root.right = data
                        # exit method
                        return
                    else 
                        # if the left node's left and right nodes are full then move to the right node.
                        if root.left.left == nil
                            root.left.left = data
                            return
                        elsif root.left.right == nil
                            if root.left.left.rating < data.rating
                                root.left.right = data
                                return
                            else
                                root.left.right = root.left.left
                                root.left.left = data
                                return
                            end
                        elsif root.right.left == nil
                            root.right.left = data
                            return
                        elsif root.right.right == nil
                            if root.right.left < data.rating
                                root.right.right = data
                            else
                                root.right.right = root.right.left
                                rooot.right.left = data
                            end
                        end
                    end
                end
            end 
        end

    end

    def delete(root, data)
        
    end

    def find(root, data)

    end

    def printf(children=nil)
        
    end
end