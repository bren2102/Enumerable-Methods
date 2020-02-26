# rubocop:disable Style/CaseEquality, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength, Metrics/ModuleLength
module Enumerable
  def my_each
    i = 0
    while i < length
      return to_enum(__method__) unless block_given?

      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < length
      return to_enum(__method__) unless block_given?

      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    temp = []
    i = 0
    while i < length
      return to_enum(__method__) unless block_given?

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

  def my_any?(arg = nil)
    i = 0
    while i < length
      if block_given?
        return true if yield(self[i])
      elsif !arg.nil?
        return true if arg === self[i]
      elsif self[i]
        return true
      end
      i += 1
    end
    false
  end

  def my_none?(arg = nil)
    i = 0
    while i < length
      if block_given?
        return false if yield(self[i])
      elsif !arg.nil?
        return false if arg === self[i]
      elsif self[i]
        return false
      end
      i += 1
    end
    true
  end

  def my_count(arg = nil)
    cont = 0
    i = 0
    while i < length
      if block_given?
        cont += 1 if yield(self[i])
      elsif !arg.nil?
        cont += 1 if arg == self [i]
      else
        cont += 1
      end
      i += 1
    end
    cont
  end

  def my_map(my_proc = nil)
    temp = []
    i = 0
    while i < length
      return to_enum(__method__) unless block_given? || my_proc

      temp << if my_proc
                my_proc.call(self[i])
              else
                yield(self[i])
              end
      i += 1
    end
    temp
  end

  def my_inject(arg = nil, arg2 = nil)
    arr = self
    arr = to_a if is_a? Range
    if block_given? && arg.nil?
      temp = arr[0]
      i = 1
    elsif !arg.nil? && arg2.nil?
      arg2 = arg
      i = 1
      temp = arr[0]
    else
      temp = arg
      i = 0
    end
    while i < arr.length
      temp = if block_given?
               yield(temp, arr[i])
             elsif !arg.nil? && !arg2.nil?
               temp.send(arg2, arr[i])
             end
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

# rubocop:enable Style/CaseEquality, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength, Metrics/ModuleLength
