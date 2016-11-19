class Node
  attr_reader :children, :parent, :value
  def initialize(value, parent = nil)
    @parent = parent
    @value = value
    @children = []
  end

  def add_children(values)
    @children = values.map{|val| Node.new(val, self)}
  end

  def ==(value)
    @value == value
  end
end
