# Copyright:: Copyright (c) 2015 Daniel Imms
# License::   MIT License

module Heapsort
  # Sorts an array using heapsort.
  def self.sort(array, compare = lambda { |a, b| a <=> b })
    heap_size = array.length
    self.build_heap(array, heap_size, compare)
    while heap_size > 1
      heap_size -= 1
      array[0], array[heap_size] = array[heap_size], array[0]
      self.heapify(array, heap_size, 0, compare)
    end
  end

private

  # Heapify an array.
  def self.heapify(array, heap_size, i, compare)
    left = i * 2 + 1
    right = i * 2 + 2
    largest = i
    if left < heap_size and compare.call(array[left], array[largest]) > 0
      largest = left
    end
    if right < heap_size and compare.call(array[right], array[largest]) > 0
      largest = right
    end
    if largest != i
      array[i], array[largest] = array[largest], array[i]
      self.heapify(array, heap_size, largest, compare)
    end
  end

  # Build a heap out of an array.
  def self.build_heap(array, heap_size, compare)
    (array.length / 2).floor.downto(0) do |i|
      heapify(array, heap_size, i, compare)
    end
  end
end
