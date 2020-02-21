module Enumerable
  def my_each
    for i in 0...self.length
      yield (self[i])
    end
  end

=begin
  def my_each_with_index
    for i in 0...self.length
      yield (self[i] , i)
    end
  end
=end
  
  def my_select
    for i in 0...self.length
      if yield(self[i]) < 3
        temp<<yield(self[i])
        new_array=temp.to_a
      end
    end
  end

  def my_all?
  end
  def my_any?
  end
  def my_none?
  end
  def my_count
  end
  def my_map
  end
  def my_inject
  end
end

def multiply_els(array)
  i = 0
  aux = 1
  while i < array.length
    aux *= array[i]
    i = i + 1
  end
  print aux
end

array=[2,4,5]

#array.my_each do |num| puts num end
=begin
array.my_each_with_index do |num,index| 
  puts "#{num}, #{index}"
end
=end

array.my_select do |num| puts num end
