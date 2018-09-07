require 'benchmark'

require_relative 'node'
require_relative 'linked_list'



def createArray(n) 
  array = []
  for i in 0..n
    array.push(i)
  end
  return array
end

def createList(n)
  list = LinkedList.new
  for i in 0..n
    list.add_to_tail(Node.new(i))
  end
  return list
end

def findArrayItem(array, i)
  return array[i]
end

def findListItem(list, item)
  return list.find(item)
end

array1 = [1..10000]

list1 = LinkedList.bechmarkList(10000)

Benchmark.bm do |x|
  x.report("Create Array:") {createArray(10000);}
  x.report("Create list:") {createList(10000);}
  x.report("Find Array Item:") {findArrayItem(array1, 5000);}
  x.report("Find List Item 5000: ") {findListItem(list1, Node.new(5000));}
  x.report("Find List Item 1: ") {findListItem(list1, Node.new(1));}
  x.report("Remove array item: " ) {array1.delete_at(5000);}
  x.report("Remove list item 5000: " ) { list1.delete(Node.new(5000))}
end