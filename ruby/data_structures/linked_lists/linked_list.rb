class LinkedList
  @@node_template ||= Struct.new("Node", :element, :next)

  attr_accessor :length, :head

  def initialize
    @head = nil
    @length = 0
  end

  def create_node(elem)
    @@node_template.new(elem, nil)
  end

  def append(elem)
    node = create_node(elem)
    if @head.nil?
      @head = node
    else
      current = head
      until current.next.nil? do
        current = current.next
      end
      current.next = node
    end
    @length += 1
  end

  def insert(position, elem)
    return false if position < 0 || position > @length

    current = head
    node = create_node(elem)

    if position == 0
      @head = node
      node.next current
    else
      index = 0
      while index < position
        previos = current
        current = current.next
        index += 1
      end
      previos.next = node
      node.next = current
    end
    @length += 1
    return true
  end

  def index_of(elem)
    current = @head
    index = 0

    while current
      if current.element == elem
        return index
      else
        index += 1
        current = current.next
      end
    end
    # Compared all nodes already
    return -1
  end

  def remove_at(position)
    return if position < 0 || position >= @length
    current = @head

    if position == 0
      @head = current.next
    else
      index = 0
      while index < position
        previous = current
        current = current.next
        index +=1 
      end
      previous.next = current.next
    end
    @length -= 1
    current
  end

  def empty?
    return @length == 0
  end

  def size
    @length
  end

  def head
    @head
  end

  def to_s
    current = @head
    string = nil

    while current
      string = string.nil? ? current.element.to_s : string + ", " + current.element.to_s
      current = current.next
    end
    string
  end
end
