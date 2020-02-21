module Enumerable
  def my_each
  end
  def my_each_with_index
  end
  def my_select
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


multiply_els([2,4,5])