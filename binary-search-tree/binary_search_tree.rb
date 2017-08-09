# Binary Search Tree
class Bst
  include Enumerable

  def initialize(data = nil)
    if data
      @root = Node.new(data)
    else
      @root = NullNode.new
    end
  end

  def data
    @root.data
  end

  def left
    @root.left
  end

  def right
    @root.right
  end

  def each(&block)
    return enum_for :each unless block_given?
    @root.each &block
    self
  end

  def insert(value)
    @root.insert(value) or @root = Node.new(value)
  end

  class Node
    attr_reader :data, :left, :right
    def initialize(data)
      @data = data
      @left = NullNode.new
      @right = NullNode.new
      @size = 1
    end

    def insert(value)
      if value <= data
        left.insert(value) or @left = Node.new(value)
      else
        right.insert(value) or @right = Node.new(value)
      end
      @size += 1
    end

    def each(&block)
      left.each(&block)
      yield data
      right.each(&block)
    end
  end

  class NullNode < Node
    def initialize
      @data = nil
      @size = 0
    end

    def insert(*)
      false
    end

    def each(&block)

    end
  end

  VERSION = 1
end
