# Interview
def fib_seq(k, fibs = [0, 1])
  k.times do
    fibs << fibs[-1] + fibs[-2]
  end
  fibs
end

def fib_seq_recursive(k, fibs = [0, 1])
  return [0] if k == 1
  return fibs if k == fibs.length - 1
  fibs << fibs[-1] + fibs[-2]
  fib_seq_recursive(k, fibs)
end

def fib_seq_inject(n)
  (0..n).inject([0, 1]) { |a, _e| a << a.last(2).inject(&:+) }
end

def fib_value_at(n)
  (0..1).include?(n) ? n : fib_value_at(n - 1) + fib_value_at(n - 2)
end

def fib_even_sums(k)
  seq = fib_seq k
  seq.inject(0) { |a, e| e.even? ? a + e : a }
end

def fact_recursive(n)
  n == 0 ? 1 : n * fact_recursive(n - 1)
end

def pali_recursive(word)
  if word.length == 1 || word.length == 0
    true
  else
    if word[0].downcase == word[-1].downcase
      p word[1..-2]
      pali_recursive(word[1..-2].gsub(/\s+/, ''))
    else
      false
    end
  end
end

def bottels(n)
  if n == 0
    puts 'no more bottles of beer on the wall'
  else
    puts "#{n} bottles of beer on the wall"
    bottels(n - 1)
  end
end

def array_flatten(array, result = [])
  array.each do |e|
    if e.is_a? Array
      array_flatten(e, result)
    else
      result << e
    end
  end
  result
end

def quicksort(array, low, high)
  return if low > high
  partition = qs_partition(array, low, high)
  quicksort(array, low, partition - 1)
  quicksort(array, partition + 1, high)
  array
end

# rubocop:disable ParallelAssignment
def qs_partition(array, low, high)
  pivot = array[high]
  i = low

  (low..(high - 1)).each do |j|
    # puts "array[#{i}]: #{array[i]}, array[#{j}]: #{array[j]}, pivot: #{pivot}"

    # if array[j] <= pivot
    next if array[j] > pivot

    # puts "#{array}"
    array[i], array[j] = array[j], array[i]
    # puts "#{array}"

    i += 1
  end

  # puts "array[i]: #{array[i]}, array[high]: #{array[high]}, pivot: #{pivot}"
  # puts "#{array}"
  array[i], array[high] = array[high], array[i]
  # puts "#{array}"

  i
end
# rubocop:enable ParallelAssignment

def merge_sort(array)
  return array if array.size <= 1
  left = merge_sort(array[0...(array.size / 2)])
  right = merge_sort(array[(array.size / 2)...array.size])
  # puts "left: #{left}, right: #{right}"
  result = merge(left, right)
  # puts "result: #{result}"
  # puts
  result
end

def merge(left, right)
  merged = []
  while left.size > 0 && right.size > 0
    if left[0] <= right[0]
      merged << left.shift
    else
      merged << right.shift
    end
  end
  merged.concat(left).concat(right)
end

def binary_search(array, n, min = 0, max = nil)
  max = (array.size - 1) unless max
  mid = (min + max) / 2

  return nil if min > max

  if n == array[mid]
    return mid
  elsif n > array[mid]
    binary_search(array, n, mid + 1, max)
  else
    binary_search(array, n, min, mid - 1)
  end
end

def include_dup?(string)
  string.size == string.split('').uniq.size
end

def remove_dump(array)
  array.delete_if { |e| array.count(e) > 1 }
end

def first_alpha(input_string)
  input_string.scan(/[[:alpha:]]+/).sort!.first
end
