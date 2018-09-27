require_relative 'node'

class Minheap
    attr_accessor :root

    def initialize(root)
        @root = root
    end

    def insert(root, data)
        if root.rating < data.rating
            if root.right == nil
                root.right = data
            else
                insert(root.right, data)
            end
            else
            if root.left == nil
                root.left = data
            else
                insert(root.left, data)
            end
        end
    end

    def delete(root, data)

    end

    def find(root, data)

    end

    def print(root)

    end

end