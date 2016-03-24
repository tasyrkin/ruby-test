
class BSTNode
  def initialize(data, left, right)
    @data = data
    @left = left
    @right = right
  end

  attr_reader :data
  attr_reader :left
  attr_reader :right

  def size
    (@left.nil? ? 0 : @left.size) + 1 + (@right.nil? ? 0 : @right.size)
  end

  def to_s
    "Node{data=#{@data}, left=#{@left}, right=#{@right}}"
  end

end

def to_array(bst_node, array, idx_start, idx_end)

  if bst_node.nil?
    return
  end

  if idx_start > idx_end
    return
  end

  idx_middle = idx_start + (idx_end-idx_start)/2
  to_array(bst_node.left, array, idx_start, idx_middle-1)
  array[idx_middle] = bst_node.data
  to_array(bst_node.right, array, idx_middle+1, idx_end)
end

node5 = BSTNode.new(5, nil, nil)
node20 = BSTNode.new(20, nil, nil)

node10 = BSTNode.new(10, node5, node20)

result_array = Array.new(node10.size)

to_array(node10, result_array, 0, result_array.size-1)

puts result_array.join(' ')

def from_array(array, idx_start, idx_end)
  if idx_start > idx_end
    return nil
  end

  idx_middle = idx_start + (idx_end - idx_start) / 2

  left = from_array(array, idx_start, idx_middle-1)
  right = from_array(array, idx_middle+1, idx_end)

  BSTNode.new(array[idx_middle], left, right)
end

node = from_array([5, 10, 20], 0, 2)
puts node.to_s

def merge_arrays(a1, a2)

  a1 = a1.nil? ? [] : a1
  a2 = a2.nil? ? [] : a2

  new_array = []
  while !a1.empty? && !a2.empty?
    if a1[0] < a2[0]
      new_array << a1[0]
      a1.delete_at(0)
    else
      new_array << a2[0]
      a2.delete_at(0)
    end
  end

  if a1.empty?
    new_array = new_array + a2
  end
  if a2.empty?
    new_array = new_array + a1
  end

  new_array
end

puts merge_arrays([1,2,3], [4,5,6]).join(' ')

puts merge_arrays(nil, [4,5,6]).join(' ')

puts merge_arrays([1,2,3], nil).join(' ')

def merge_bsts(bst_node1, bst_node2)

  arr1 = Array.new(bst_node1.size)
  to_array(bst_node1, arr1, 0, arr1.size-1)

  arr2 = Array.new(bst_node2.size)
  to_array(bst_node2, arr2, 0, arr2.size-1)

  sorted_array = merge_arrays(arr1, arr2)

  from_array(sorted_array, 0, sorted_array.size-1)
end

tree1 = from_array([0, 1, 2], 0, 2)
tree2 = from_array([0, 100], 0, 2)

result = merge_bsts(tree1, tree2)
puts result