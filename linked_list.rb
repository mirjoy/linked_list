class Node
  attr_accessor :val, :next_node

  def initialize(val, next_node=nil)
    @val = val
    @next_node = next_node
  end
end

#1. Find the end of the list
#2. Create a new node with next_node value of nil
#3. Set the new node as next_node of previous

class IterativeLinkedList
  attr_accessor :head, :count

  def initialize
    @head
    @count = 0
  end

  def push(new_value)
    # check if current.next_thing == nil
    #   replace current.next_thing = newnode
    # then set newnode as current
    # check again until current.next_thing == nil

    current_node = @head

    if @head == nil
      @head = Node.new(new_value)
    else
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(new_value)
    end
      @count +=1
  end


  def pop
    #find the last element
    #remove the last element
    #change previous element's "next_node" to be nil
    #change count
    #return the last element
    current_node = @head
    penultimate_node = nil

    if @head == nil
      return nil
    else
      while current_node.next_node != nil
        penultimate_node = current_node
        current_node = current_node.next_node
      end
        if penultimate_node == nil
          #list is length of one
          old_val = current_node.val
          current_node = nil
          @count -= 1
          return old_val
        else
          penultimate_node.next_node = nil
          @count -= 1
          return current_node.val
        end
    end
  end

  def delete(target_val)
    #find a specific element
    #remove the last element
    #change previous element's "next_node" to be nil
    #change count
    #return the last element
    if @head == nil
      #no objects in list
      return nil
    end

    current_node = @head
    penultimate_node = nil

    if  current_node.next_node == nil
      #list is length of one
      current_node = nil
      @count -= 1
      return
    end

    while current_node.val != target_val
        if current_node.next_node == nil && current_node.val != target_val
          #the input does not match anything in the list
          return nil
        end
        penultimate_node = current_node
        current_node = current_node.next_node
    end

    if penultimate_node == nil
      @head = @head.next_node
      @count -= 1
    else
      penultimate_node.next_node = current_node.next_node
      @count -= 1
    end

  end

  def to_a
    array = []

    current_node = @head

    if @head == nil
      return array
    elsif @head.next_node == nil
      array << @head.val
    end

    while current_node.next_node != nil
      array << current_node.val
      current_node = current_node.next_node
    end

    array << current_node.val
  end

  def last_node
    current_node = @head

    while current_node.next_node != nil
      current_node = current_node.next_node
    end

    current_node
  end

  def head_node
    @head
  end

  def include?(target_val)
    current_node = @head

    while current_node.val != target_val
      if current_node.next_node == nil
        return false
      end

      current_node = current_node.next_node
    end
      return true
  end

  def find(target_val)
    current_node = @head

    while current_node.val != target_val
      if current_node.next_node == nil
        return nil
      end
      current_node = current_node.next_node
    end
    return current_node
  end

  def insert(index, data)

    current_index = 0
    current_node = @head

    until current_index == index - 1
      current_node = current_node.next_node
      current_index += 1
    end

    new_node = Node.new(data)
    new_node.next_node = current_node.next_node
    current_node.next_node = new_node
  end

  def insert_after(word1, word2)

    current_node = @head

    until current_node.val == word1
      if current_node.next_node == nil
        return nil
      end
      current_node = current_node.next_node
    end

    new_node = Node.new(word2)
    new_node.next_node = current_node.next_node
    current_node.next_node = new_node
  end

  def index(data)
    current_index = 0
    current_node = @head

    until current_node.val == data
      current_node = current_node.next_node
      current_index += 1
    end

    return current_index
  end

end

list = IterativeLinkedList.new
list.push("hello")
list.push("world")

# binding.pry
