class DoublyLinkedList
  # Doubly linked list differs from regular linked-list 
  # by having reference to the previous node and
  # having a reference to the last element

  # Doubly linked list can iterate from head to tail and vice versa

  @@node_template = Struct.new("Node", :element, :next, :previous)

  attr_accessor :length, :head, :tail

  def initialize
    @length = 0
    @head = nil
    @tail = nil
  end

  def create_node(elem)
    @@node_template.new(elem, nil, nil)
  end

  def insert(position, elem)
    node = @@node_template.new(elem)

    return false if position < 0 || position > @length

    if position == 0 # at begin of list
      current = @head
      if @head
        node.next = current
        current.previous = node # For DoublyLinkedList
        @head = node
      else # list is empty
        @head = node
        @tail = node
      end
    elsif position == @length # at end of list
      current = @tail
      current.next = node
      node.previous = current
      @tail = node
    else # somewhere in the middle
      current = @head
      index = 0
      while index < position
        previous = current
        current = current.next
        index += 1
      end
      node.next = current
      previous.next = node

      node.previous = previous # For DoublyLinkedList
      current.previous = node # For DoublyLinkedList
    end
    @length += 1
    true
  end

  def remove_at(position)
    return nil if position < 0 || position >= @length
    current = @head

    if position == 0 # at begin of list
      @head = current.next
      if @length == 1
        @tail = nil
      else
        @head.previous = nil
      end
    elsif position == @length # at end of list
      @tail = @tail.previous
      @tail.next = nil
    else
      index = 0
      while index < position
        previous = current
        current = current.next
        index += 1
      end
      previous.next = current.next
      current.next.previous = previous
    end
    @length -= 1
    current
  end
end