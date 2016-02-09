module BinaryTree
  # BinaryTree Node
  class Node
    attr_reader :value
    attr_accessor :left, :right

    def initialize(value)
      @value = value
    end

    def insert(value)
      case @value <=> value
      when 1
        insert_left(value)
      when 0
        false
      when -1
        insert_right(value)
      end
    end

    def inspect
      "#{value}->[L:#{left.inspect} - R:#{right.inspect}]"
    end

    private

    def insert_left(value)
      if @left.nil?
        @left = Node.new(value)
      else
        @left.insert(value)
      end
    end

    def insert_right(value)
      if @righ.nil?
        @right = Node.new(value)
      else
        @right.insert(value)
      end
    end
  end
end

tree = BinaryTree::Node.new(6)
tree.insert(2)
tree.insert(4)
p tree.inspect
