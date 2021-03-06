# RubyMonk
def random_select(array, n)
  rand_num = []
  n.times do
    rand_num << array[rand(array.length)]
  end
  rand_num
end

def palindrome?(sentence)
  no_space_sen = sentence.downcase.gsub(/\s+/, '')
  no_space_sen == no_space_sen.reverse
end

def sum_of_cubes(n, m)
  (n..m).inject(0) { |a, e| a + e**3 }
end

def non_duplicated_values(values)
  values.find_all { |e| values.count(e) == 1 }
end

def array_of_fixnum?(array)
  array.all { |e| e.is_a? Fixnum }
end

def find_end_point(k_sq, k_size)
  k_sq.length.even? ? k_size - 1 : k_size - 2
end

def kaprekar?(k)
  k_size = k.to_s.length
  k_sq = (k**2).to_s
  end_point = find_end_point k_sq, k_size
  l_digits = k_sq[0..end_point]
  r_digits = k_sq[-k_size..-1]
  k == l_digits.to_i + r_digits.to_i
end

def factorial(k)
  k.downto(1).inject(:*)
end

def number_shuffle(number)
  digits = number.to_s.split(//)
  facto = factorial digits.length

  results = []
  while results.length != facto
    results << digits.shuffle.join.to_i
    results.uniq!
  end
  results.sort!
end

def cost(*orders)
  menu = { rice: 3, noodles: 2 }
  orders.inject(0) do |total_cost, order|
    total_cost + order.keys.inject(0) do |cost, item|
      cost + (menu[item] * order[item])
    end
  end
end

def my_array_sum(initial_value = 0)
  array = [1, 2, 3]
  return array.inject(initial_value) { |a, e| a + yield(e) } if block_given?
  array.inject(initial_value, :+)
end
