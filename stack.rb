# Static stack implementation using static array
class Stack
  def initialize(size)
    @top = -1
    @stack = Array.new(size)
  end

  def push(element)
    if full? || element.nil?
      puts 'Stack if full :('
      nil
    else
      @top += 1
      @stack[@top] = element
      self
    end
  end

  def pop
    if empty?
      puts 'Nothing to pop'
      nil
    else
      element = @stack[@top]
      @stack[@top] = nil
      @top -= 1
      element
    end
  end

  def size
    @stack.size
  end

  def look
    @stack[@top]
  end

  private

  def full?
    @top == @stack.size - 1
  end

  def empty?
    @top == -1
  end
end

s = Stack.new(2)
s.push(24).push(32)
p s
s.pop
p s
