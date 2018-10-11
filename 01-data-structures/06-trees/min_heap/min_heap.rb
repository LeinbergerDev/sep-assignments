require_relative 'node'

class Minheap
    attr_accessor :root

    def initialize(root)
        @root = root
    end

    def insert(data)
        if @root == nil
            @root = data
        end
        if @root.rating > data.rating
            temp = @root
            @root = data
            insert(temp)
        end
        if @root.left == nil
            @root.left = data
            return
        end
        if @root.right == nil
            if @root.left.rating > data.rating
                @root.right = @root.left
                @root.left = data
                return
            else
                @root.right = data
                return
            end
        end
        if @root.right != nil && @root.right != nil
            #step through each layer to find the correct spot for the node
            queue = Queue.new
            queue.enq(@root)
            result = nil
            while !queue.empty?
                node = queue.deq
                if node.left != nil
                    # if the rating of node.left is less than data.rating 
                    # then I need to insert the data node here.
                    if node.left.rating > data.rating
                        insertAtNode(node.left, data)
                    else
                        queue.enq(node.left)
                    end
                end
                if node.right != nil
                    queue.enq(node.right)
                end
            end
        end
    end

    def insertAtNode(root, data)
        if root.rating > data.rating
            temp = root
            root = data
            insertAtNode(root, temp)
        else
            if root.left == nil
                root.left = data
            else
                if root.right == nil
                    if root.left.rating > data.rating
                        root.right = root.left
                        root.left = data
                    else
                        root.right = data
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