class Node
  attr_reader :value
  attr_accessor :next_node
  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  attr_accessor :head, :tail
  # def initialize
  #   @head = nil
  #   @tail = nil
  # end

  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def pop
    return nil if tail.nil?

    if head.next_node.nil?
      value = head.value
      head = nil
      return value
    end

    first = self.head
    second = first.next_node
    while second.next_node do
      first = second
      second = second.next_node
    end
    tail = first
    tail.next_node = nil
    return second.value
  end

  def size
    res = 0
    pointer = head
    while pointer do
      res += 1
      pointer = pointer.next_node
    end

    res
  end

  def find(value)
    index = 0
    pointer = head
    while pointer do
      return index if pointer.value.eql?(value)
      index += 1
      pointer = pointer.next_node
    end

    return nil
  end

  def contains?(value)
    find(value).nil? ? false : true
  end

  def at(index)
    return nil if index < 0

    pointer = head
    index.times {|_| pointer = pointer.next_node}
    pointer.value
  rescue
    nil
  end


  def to_s
    return "nil" if head.nil?

    res = "( #{head.value} )"

    pointer = head.next_node
    while pointer do
      res += " -> ( #{pointer.value} )"
      pointer = pointer.next_node
    end

    res + " -> nil"
  end
end

list = LinkedList.new
list.append(123)
list.append(456)
list.prepend("mother")
list.prepend(:duty)
list.append(123)
list.append(456)
list.prepend("mother")
list.prepend(:duty)
list.append({a:5,b:'b',c: :c})
list.append('Hello, world')
list.append(3.14159265358979323)

pp "list.to_s = #{list.to_s}"
pp "list.size = #{list.size}"
pp list.pop
pp list.find(8)
pp list.contains?(456)

pp "list.at(2) = #{list.at(2)}"
pp "list.at(-5) = #{list.at(-5)}"
pp "list.at(7) = #{list.at(7)}"
pp "list.at(12) = #{list.at(12)}"
