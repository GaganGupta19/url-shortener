class CheckParantheses

  attr_accessor :input

  def initialize
    @opening_brackets = ["{", "[", "("]
    @closing_brackets = ["}", "]", ")"]
    @stack = []
  end

  def get_input
    puts "Enter the string : "
    @input = gets.chomp
  end

  def process_stack
    input.split("").each {|item| are_opposite?(item) && is_match?(item) ? @stack.pop : @stack.push(item)}
    puts @stack.length == 0
  end

  #if index of closing and opening is same
  def is_match?(item)
    @opening_brackets.find_index(@stack.last) == @closing_brackets.find_index(item)
  end

  #if last item is an opening bracket and new item is a closing one
  def are_opposite?(item)
    @opening_brackets.include?(@stack.last) and @closing_brackets.include?(item)
  end

end

instance = CheckParantheses.new
instance.get_input
instance.process_stack