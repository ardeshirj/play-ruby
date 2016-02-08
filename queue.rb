# Static queue implementation using static array
class Queue
  def initialize(size)
    @tail = 0  # Move the tail
    @head = -1 # Pop the head
    @queue = Array.new(size)
  end

  def enqueue(element)
    if full? || element.nil?
      puts 'Queue is full :('
      nil
    else
      @tail -= 1
      @queue[@tail] = element
      self
    end
  end

  def dequeue
    if empty?
      puts 'Nothing to dequeue'
      nil
    else
      element = @queue[@head]
      @queue.pop
      @queue.unshift(nil)
      @tail += 1
      element
    end
  end

  def size
    @queue.size
  end

  private

  def full?
    @tail.abs == size
  end

  def empty?
    @tail == 0 && @head == -1
  end
end

q = Queue.new(2)
q.enqueue 12
p q
q.enqueue 22
p q
q.enqueue 40
p q
q.dequeue
p q
q.dequeue
p q
q.dequeue
p q
