require 'minitest'
require 'minitest/autorun'
require './stacks/lib/stack.rb'

class StackTest < Minitest::Test
  def test_it_pushes
    stack = Stack.new
    stack.push("A")
    stack.push("B")
    stack.push("C")
    assert_equal(3, stack.count)
  end

  def test_it_pops
    stack = Stack.new
    stack.push("A")
    stack.push("B")
    stack.push("C")
    assert_equal("C", stack.pop)
    assert_equal("B", stack.pop)
    assert_equal("A", stack.pop)
  end

  def test_it_peeks
    stack = Stack.new
    stack.push("A")
    stack.push("B")
    stack.push("C")
    assert_equal("C", stack.peek)
    assert_equal(3, stack.count)
  end

  def test_is_empty
    stack = Stack.new
    assert_equal(true, stack.empty?)
  end
  
  def test_is_not_empty
    stack = Stack.new
    stack.push("A")
    stack.push("B")
    stack.push("C")
    assert_equal(false, stack.empty?)
  end
end