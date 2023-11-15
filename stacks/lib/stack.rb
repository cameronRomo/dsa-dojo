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
      temp = @first
      @first = new_node
      @first.next = temp
    end

    @count += 1
  end

  def pop
    return nil if @first.nil?
    
    temp = @first
    
    if @first == @last
      @last = nil
    end
    
    @first = @first.next
    @count -= 1

    temp.value
  end

  def peek
    @first.value
  end

  def empty?
    @first&.value.nil? ? true : false
  end

  def is_valid? brackets
    bracket_map = { '(' => ')', '{' => '}', '[' => ']' }

    if brackets.empty?
      return false
    end

    brackets.each_char do |char|
      if bracket_map.key? char
        push char
      elsif (bracket_map.key? @first&.value) && (bracket_map.value? char)
        pop
      else
        false
      end
    end

    @first&.value.nil? ? true : false
  end
end
