module Enumerable
  def my_each
    for i in 0...self.length
      yield(self[i])
    end
  end

  def my_each_with_index
    for i in 0...self.length
      yield(self[i] , i)
    end
  end
  
  def my_select
    temp=[]
    for i in 0...self.length
      if yield(self[i])
        temp<<self[i]
      end
    end
    temp
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

array.my_each do |num| puts num end
  
array.my_each_with_index do |num,index| puts "#{num}, #{index}" end

puts array.my_select { |num| num < 3 }