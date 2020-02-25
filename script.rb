# rubocop:disable Style/CaseEquality, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
module Enumerable
  def my_each
    i = 0
    while i < length
      return to_enum unless block_given?

      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    while i < length
      return to_enum unless block_given?

      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    temp = []
    i = 0
    while i < length
      return to_enum unless block_given?

      temp << self[i] if yield(self[i])
      i += 1
    end
    temp
  end

  def my_all?(arg = nil)
    i = 0
    while i < length
      if block_given?
        return false unless yield(self[i])
      elsif !arg.nil?
        return false unless arg === self[i]
      else
        return false unless self[i]
      end
      i += 1
    end
    true
  end

  def my_any?
    i = 0
    while i < length
      if block_given?
        return true if yield(self[i])
      elsif !arg.nil?
        return true if arg === self[i]
      else
        return true if self[i]
      end
      i += 1
    end
    false
  end

  def my_none?
    i = 0
    while i < length
      if block_given?
        return false if yield(self[i])
      elsif !arg.nil?
        return false if arg === self[i]
      else
        return false if self[i]
      end
      i += 1
    end
    true
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

  def my_map(my_proc = nil)
    temp = []
    i = 0
    while i < length
      temp << if my_proc
                my_proc.call(self[i])
              else
                yield(self[i])
              end
      i += 1
    end
    temp
  end

  def my_inject
    i = 1
    temp = self[0]
    while i < length
      temp = yield(temp, self[i])
      i += 1
    end
    temp
  end
end

def multiply_els(array)
  array.my_inject do |num, n|
    num * n
  end
end

# array = [4, 5, 5]

puts [1, true, 'hi', []].my_all?

puts %w[ant bear cat].my_all?(/c/)
=begin
puts [1, true, 'hi', []].my_all? != [1, true, 'hi', []].all?
puts [1, false, 'hi', []].my_all? != [1, false, 'hi', []].all?
puts [1,2,3,4,5].my_all?(Integer) != [1,2,3,4,5].all?(Integer)
puts ["word",2,3,4,5].my_all?(Integer) != ["word",2,3,4,5].all?(Integer)
puts ['saheed', 'oladele', 'suretrust'].my_all?(/d/) != ['saheed', 'oladele', 'suretrust'].all?(/d/)
puts [1,2,3,4,5].my_all?(3) != [1,2,3,4,5].all?(3)
=end
=begin
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
  num > 4
end
puts result

puts 'Test my_any method:'
result = array.my_any? do |num|
  num < 3
end
puts result

puts 'Test my_none method:'
result = array.my_none? do |num|
  num < 5
end
puts result

puts 'Test my_each method:'
result = array.my_count do |num|
  num
end
puts result

puts 'Test my_map method:'
my_proc = proc do |num|
  num * 2
end
result = array.my_map(my_proc)
puts result

puts 'Test my_inject method:'
result = array.my_inject do |num, n|
  num + n
end
puts result

puts 'Test multiply_els with my_inject'
puts multiply_els(array)
=end

# rubocop:enable Style/CaseEquality, Metrics/CyclomaticComplexity, Metrics/CyclomaticComplexity