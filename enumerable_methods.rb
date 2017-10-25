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
    answer = [] if self.class == Array
    self.my_each do |element, value|
      #answer.push(element) if yield(element) != false
      answer << (element) if (yield(element) != false) && (self.class == Array)
      if (yield(element, value) != false) && (self.class == Hash)
        answer[element] = value
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
        # puts "no block"
        # puts "arg1: #{arg1.join("")} element: #{element}"
        count +=1 if element == arg1.join("").to_i
      else
        count += 1 if yield(element)
        # puts "block present"
      end
    end
    count
  end
end

module Enumerable
  def my_map
    new_object = []
    self.my_each do |element|
      new_object.push(yield element)
    end
    new_object
  end
end

# Same as above, but can take either a proc or a block

module Enumerable
  def my_map(someProc = nil)
    new_object = []
    if someProc.class == Proc
      self.my_each do |element|
        new_object.push(someProc.call(element))
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

# def multiply_els(array)
#   array.my_inject(1) {|running_total, element| running_total * element}
# end
