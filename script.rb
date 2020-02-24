module Enumerable
  def my_each
    i = 0
    while i < length
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    temp = []
    i = 0
    while i < length
      temp << self[i] if yield(self[i])
      i += 1
    end
    temp
  end

  def my_all?
    i = 0
    while i < length
      return true if yield(self[i]) && yield(self[i + 1])

      i += 1
      return false
    end
  end

  def my_any?
    i = 0
    while i < length
      return true if yield(self[i]) || yield(self[i + 1])

      i += 1
      return false
    end
  end

  def my_none?
    i = 0
    while i < length
      return true unless yield(self[i])

      i += 1
      return false
    end
  end

  def my_count
    cont = 0
    i = 0
    while i < length
      cont += 1 if yield(self[i])
      i += 1
    end
    cont
  end

  def my_map
    temp = []
    i = 0
    while i < length
      temp << yield(self[i])
      i += 1
    end
    temp
  end

  def my_inject
    temp = 0
    n = 0
    i = 0
    while i < length
      puts yield(self[i], n)
      puts 'end'
      i += 1
    end
    temp
  end
end

def multiply_els(array)
  i = 0
  aux = 1
  while i < array.length
    aux *= array[i]
    i += 1
  end
  print aux
end

array = [2, 4, 5]

puts 'Test my_each method:'
array.my_each do |num|
  puts num
end

puts 'Test my_each_with_index method'
array.my_each_with_index do |num, index|
  puts "#{num}, #{index}"
end

puts 'Test my_select method:'
result = array.my_select do |num|
  num < 3
end
puts result

puts 'Test my_all method:'
result = array.my_all? do |num|
  num < 6
end
puts result

puts 'Test my_any method:'
result = array.my_any? do |num|
  num < 3
end
puts result

puts 'Test my_none method:'
result = array.my_none? do |num|
  num < 4
end
puts result

puts 'Test my_each method:'
result = array.my_count do |num|
  num
end
puts result

puts 'Test my_map method:'
result = array.my_map do |num|
  num * 2
end
puts result
=begin
puts 'Test my_inject method:'
puts array.my_inject { |num, n| num + n }
=end
