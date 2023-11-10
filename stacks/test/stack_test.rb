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

  def test_is_valid
    stack = Stack.new
    validated_string = stack.is_valid? "(()()())()"
    assert_equal(true, validated_string)
  end

  def test_empty_string_not_valid
    stack = Stack.new
    assert_equal(false, stack.is_valid?(""))
  end

  def test_invalid_string
    stack = Stack.new
    validated_string = stack.is_valid? "(()()()()"
    assert_equal(false, validated_string)
  end
end