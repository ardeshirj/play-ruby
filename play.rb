require 'awesome_print'

# Play
def self.fib_seq(k, fibs = [0, 1])
  k.times do
    fibs << fibs[-1] + fibs[-2]
  end
  fibs
end

def self.fib_even_sums(k)
  seq = fib_seq k
  seq.inject(0) { |a, e| e.even? ? a + e : a }
end

def self.fact_recursive(n)
  n == 0 ? 1 : n * fact_recursive(n - 1)
end

def self.pali_recursive(word)
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

def self.bottels(n)
  if n == 0
    puts 'no more bottles of beer on the wall'
  else
    puts "#{n} bottles of beer on the wall"
    bottels(n - 1)
  end
end

def self.fib_value_at(n)
  (0..1).include?(n) ? n : fib_value_at(n - 1) + fib_value_at(n - 2)
end

def self.array_flatten(array, result = [])
  array.each do |e|
    if e.is_a? Array
      array_flatten(e, result)
    else
      result << e
    end
  end
  result
end


# RubyMonk
module RubyMonk
  def self.random_select(array, n)
    rand_num = []
    n.times do
      rand_num << array[rand(array.length)]
    end
    rand_num
  end

  def self.palindrome?(sentence)
    no_space_sen = sentence.downcase!.delete!(' ')
    no_space_sen == no_space_sen.reverse
  end

  def self.sum_of_cubes(n, m)
    (n..m).inject(0) { |a, e| a + e**3 }
  end

  def self.non_duplicated_values(values)
    values.find_all { |e| values.count(e) == 1 }
  end

  def self.array_of_fixnum?(array)
    array.all { |e| e.is_a? Fixnum }
  end

  def self.find_end_point(k_sq, k_size)
    k_sq.length.even? ? k_size - 1 : k_size - 2
  end

  def self.kaprekar?(k)
    k_size = k.to_s.length
    k_sq = (k**2).to_s
    end_point = find_end_point k_sq, k_size
    l_digits = k_sq[0..end_point]
    r_digits = k_sq[-k_size..-1]
    k == l_digits.to_i + r_digits.to_i
  end

  def self.factorial(k)
    k.downto(1).inject(:*)
  end

  def self.number_shuffle(number)
    digits = number.to_s.split(//)
    facto = factorial digits.length

    results = []
    while results.length != facto
      results << digits.shuffle.join.to_i
      results.uniq!
    end
    results.sort!
  end

  def self.cost(*orders)
    menu = { rice: 3, noodles: 2 }
    orders.inject(0) do |total_cost, order|
      total_cost + order.keys.inject(0) do |cost, item|
        cost + (menu[item] * order[item])
      end
    end
  end

  def self.my_array_sum(initial_value = 0)
    array = [1, 2, 3]
    return array.inject(initial_value) { |a, e| a + yield(e) } if block_given?
    array.inject(initial_value, :+)
  end
end

# RubyMonkAscent
module RubyMonkAscent
  def self.included(base)
    p "RubyMonk included to #{base}"
    base.extend ClassMethods
  end

  # ClassMethods
  module ClassMethods
    def guitar
      'gently weeps'
    end
  end

  def self.add_multi_dim_array_elements(ary)
    ary.map { |a, b| !b.nil? ? a + b : a } unless ary.nil?
  end

  def self.median(*list)
    return nil if list.size == 0
    list.sort!
    n = list.size
    mid = n / 2
    n.odd? ? list[mid] : (list[mid - 1] + list[mid]).to_f / 2
  end

  def self.zen(array)
    array = array.compact.flatten
    return array.size if array.index(42) == 5
  end

  def self.few2last(array)
    array.slice(-2..-1).join('|')
  end

  def self.remove_matrix_dup(matrix)
    matrix.delete_if do |a|
      matrix.include?([a.last, a.first]) && a.first != a.last
    end
  end

  def self.string_slice(*strings)
    p strings
    fail ArgumentError if strings.count > 5
    strings.map do |s|
      fail IndexError if s.size < 3
      s[0..2]
    end
  end

  def self.map_with_index(array, &block)
    return array.each unless block_given?
    array.each_with_index.map(&block)
  end

  def self.hash_keys(hash)
    keys = []
    hash.each_key { |k| keys << k }
    keys
  end

  def self.occurrences(str)
    str_array = str.scan(/\w+/)
    # items in each_with_object block are opposite of items in inject
    # block. (inject() { |a, e| } vs each_with_object { |e, a| } )
    str_array.each_with_object(Hash.new(0)) do |word, occured|
      occured[word.downcase] += 1
      occured
    end
  end

  def self.location_in_hierarchy(object, method)
    super_klass = object.class
    super_klasses = []

    until super_klass.nil?
      super_klasses << super_klass
      super_klass = super_klass.superclass
    end

    super_klasses.reverse.find do |klass|
      klass.instance_methods.include? method
    end
  end
end
