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
    for i in 0...self.length
      if yield(self[i]) && yield(self[i+1])
        return true
      else
        return false
      end
    end
  end
 
  def my_any?
    for i in 0...self.length
      if yield(self[i]) || yield(self[i+1])
        return true
      else
        return false
      end
    end
  end
 
  def my_none?
    for i in 0...self.length
      if !yield(self[i])
        return true
      else
        return false
      end
    end
  end

  def my_count
    cont = 0
    for i in 0...self.length
      if yield(self[i])
        cont+=1
      end
    end
    cont
  end

  def my_map
    temp = []
    for i in 0...self.length
      temp << yield(self[i])
    end
    temp
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
=begin
array.my_each do |num| puts num end
  
array.my_each_with_index do |num,index| puts "#{num}, #{index}" end

puts array.my_select { |num| num < 3 }

puts array.my_all? { |num| num < 6 }

puts array.my_any? { |num| num < 3 }

puts array.my_none? { |num| num < 1 }

puts array.my_count { |num| num }
=end
puts array.my_map { |num| num * 2 }