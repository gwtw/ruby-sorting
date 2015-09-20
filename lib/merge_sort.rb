# Copyright:: Copyright (c) 2015 Daniel Imms
# License::   MIT License

module MergeSort
  # Sorts an array using merge sort, returning the sorted array.
  def self.sort(array, compare = lambda { |a, b| a <=> b })
    if array.length <= 1
      return array
    end

    middle = (array.length / 2).floor
    left = array.take(middle)
    right = Array.new(array.length - middle)
    (0..right.length - 1).each do |i|
      right[i] = array[i + left.length]
    end

    return self.merge(self.sort(left, compare), self.sort(right, compare), compare)
  end

  # Sorts an array using merge sort, overriding the original array.
  def self.sort!(array, compare = lambda { |a, b| a <=> b })
    result = self.sort(array, compare)
    (0..array.length - 1).each do |i|
      array[i] = result[i]
    end
  end

private

  # Merges two arrays in to a new array.
  def self.merge(left, right, compare)
    result = []
    left_index = 0
    right_index = 0
    while left_index < left.length or right_index < right.length
      if left_index < left.length and right_index < right.length
        if compare.call(left[left_index], right[right_index]) <= 0
          result.push(left[left_index])
          left_index += 1
        else
          result.push(right[right_index])
          right_index += 1
        end
      elsif left_index < left.length
        result.push(left[left_index])
        left_index += 1
      elsif right_index < right.length
        result.push(right[right_index])
        right_index += 1
      end
    end
    return result
  end
end
