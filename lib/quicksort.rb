# Copyright:: Copyright (c) 2015 Daniel Imms
# License::   MIT License

module Quicksort
  # Sorts an array using quicksort.
  def self.sort(array, compare = lambda { |a, b| a <=> b })
    self.inner_sort(array, 0, array.length - 1, compare)
  end

private

  # Sorts an array using quicksort.
  def self.inner_sort(array, left, right, compare)
    if left < right
      pivot = partition_random(array, left, right, compare)
      self.inner_sort(array, left, pivot - 1, compare)
      self.inner_sort(array, pivot + 1, right, compare)
    end
  end

  # Partition the array by selecting a random pivot and moving all elements less
  # than the pivot to a lesser index and all elements greater than the pivot to a
  # greater index.
  def self.partition_random(array, left, right, compare)
    pivot = left + (rand.floor * (right - left))
    if pivot != right
      array[right], array[pivot] = array[pivot], array[right]
    end
    return partition_right(array, left, right, compare)
  end

  # Partition the array using the right most element as the pivot by moving all
  # elements less than the pivot to a lesser index and all elements greater than
  # the pivot to a greater index.
  def self.partition_right(array, left, right, compare)
    pivot = array[right]
    mid = left
    (mid..right - 1).each do |i|
      if compare.call(array[i], pivot) <= 0
        if i != mid
          array[i], array[mid] = array[mid], array[i]
        end
        mid += 1
      end
    end
    if right != mid
      array[right], array[mid] = array[mid], array[right]
    end
    return mid
  end
end
