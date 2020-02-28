load 'script.rb'

array = [4, 5, 5]

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
