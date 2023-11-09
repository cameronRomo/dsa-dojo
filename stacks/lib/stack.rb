class Node
  attr_accessor :value, :next

  def initialize value
    @value = value
    @next = nil
  end
end

class Stack
  attr_reader :count

  def initialize()
    @first = nil
    @last = nil
    @count = 0
  end

  def push value
    new_node = Node.new value
    if @first.nil?
      @first = new_node
      @last = new_node
    else
      @first.next = new_node
      @first = new_node
    end

    @count += 1
  end
end