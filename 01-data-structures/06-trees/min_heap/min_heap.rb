require_relative 'node'


class Minheap
    attr_accessor :root

    def initialize(root)
        @root = root
    end

    def insert(root, data)
        @root = root if @root == nil

        if root.rating > data.rating
            temp = root
            @root = data
            data = temp
            insert(@root, data)
        else
            if root.left.nil?
                root.left = data
            elsif root.right.nil? && root.left != nil
                root.right = data
            elsif root.left != nil && root.right != nil && root.left.left != nil && root.left.right != nil
                insert(root.right, data)
            elsif root.left != nil && root.right != nil
                insert(root.left, data)
            end
        end
    end

    def delete(root, data)
        if root == nil || data == nil
            return nil
        else
            node_to_delete = find(root, data)
            if node_to_delete
                node_to_delete.title = nil
                node_to_delete.rating = nil
            end
        end
    end

    def find(root, data)
        if root == nil || data == nil
            return nil
        else
            if root.title == data
                return root
            else
                if root.title == data
                    return root
                elsif root.left != nil
                    find(root.left, data)
                elsif root.right != nil
                    find(root.right, data)
                end
            end
        end
    end

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