class Numeric
  def fib
   return 0 if self.zero?
   return 1 if self <= 2
   return self.pred.fib + self.pred.pred.fib
 end
end

class Array
  def merge_sort
    return self if self.size == 1
    bp = self.size.div(2) #breaking_point
    left = self[0,bp].merge_sort
    right = self[bp..].merge_sort

    res = []

    until left.empty? || right.empty?
      if left.first <= right.first
        res << left.shift
      else
        res << right.shift
      end
    end
    res + left + right

  end
end

puts "10.fib -> #{10.fib}"
p arr = (1..20).to_a.shuffle
p arr.merge_sort
