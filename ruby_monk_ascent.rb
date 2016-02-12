# RubyMonkAscent
def included(base)
  p "RubyMonk included to #{base}"
  base.extend ClassMethods
end

# ClassMethods
module ClassMethods
  def guitar
    'gently weeps'
  end
end

def add_multi_dim_array_elements(ary)
  ary.map { |a, b| !b.nil? ? a + b : a } unless ary.nil?
end

def median(*list)
  return nil if list.size == 0
  list.sort!
  n = list.size
  mid = n / 2
  n.odd? ? list[mid] : (list[mid - 1] + list[mid]).to_f / 2
end

def zen(array)
  array = array.compact.flatten
  return array.size if array.index(42) == 5
end

def few2last(array)
  array.slice(-2..-1).join('|')
end

def remove_matrix_dup(matrix)
  matrix.delete_if do |a|
    matrix.include?([a.last, a.first]) && a.first != a.last
  end
end

def string_slice(*strings)
  p strings
  fail ArgumentError if strings.count > 5
  strings.map do |s|
    fail IndexError if s.size < 3
    s[0..2]
  end
end

def map_with_index(array, &block)
  return array.each unless block_given?
  array.each_with_index.map(&block)
end

def hash_keys(hash)
  keys = []
  hash.each_key { |k| keys << k }
  keys
end

def occurrences(str)
  str_array = str.scan(/\w+/)
  # items in each_with_object block are opposite of items in inject
  # block. (inject() { |a, e| } vs each_with_object { |e, a| } )
  str_array.each_with_object(Hash.new(0)) do |word, occured|
    occured[word.downcase] += 1
    occured
  end
end

def location_in_hierarchy(object, method)
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
