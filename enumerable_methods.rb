module Enumerable
  def my_each
    for element in self
      yield element
    end
    self
  end
end

module Enumerable
  def my_each_with_index
    i = 0
    self.my_each do |element|
      yield element, i
      i += 1
    end
    self
  end
end


module Enumerable
  def my_select
    answer = {} if self.class == Hash
    answer = [] if self.class == Array || self.class == Range
    if self.class == Array || self.class == Range
      self.my_each do |element|
        answer << element if yield(element)
      end
    elsif self.class == Hash
      for key, value in self
        answer[key] = value if (yield(key, value))
      end
    end
    answer
  end
end



module Enumerable
  def my_all?
    self.my_each do |element|
      return false if !yield(element)
    end
    true
  end
end


module Enumerable
  def my_any?
    self.my_each do |element|
      return true if yield(element)
    end
    false
  end
end


module Enumerable
  def my_none?
    self.my_each do |element|
      return false if yield(element)
    end
    true
  end
end

module Enumerable
  def my_count(*arg1)
    count = 0
    self.my_each do |element|
      if !block_given?
        count +=1 if element == arg1.first
      else
        count += 1 if yield(element)
      end
    end
    count
  end
end



module Enumerable
  def my_map_block_only
    new_object = []
    self.my_each do |element|
      new_object.push(yield element)
    end
    new_object
  end
end

# Same as above, but can take either a proc or a block

module Enumerable
  def my_map(some_arg = nil)
    new_object = []
    if some_arg.class == Proc
      self.my_each do |element|
        new_object.push(some_arg.call(element))
      end
    else
      self.my_each do |element|
        new_object.push(yield (element))
      end
    end
    new_object
  end
end



module Enumerable
  def my_inject(running_total = 0)
    self.my_each do |element|
      running_total = yield(running_total, element)
    end
    running_total
  end
end
