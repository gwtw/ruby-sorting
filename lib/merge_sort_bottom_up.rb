# Copyright:: Copyright (c) 2015 Daniel Imms
# License::   MIT License

module MergeSortBottomUp
  # Sorts an array using bottom up merge sort.
  def self.sort(array, compare = lambda { |a, b| a <=> b })
    work_array = Array.new(array.length)
    chunk_size = 1
    while chunk_size < array.length
      i = 0
      while i < array.length - chunk_size
        self.merge(array, i, chunk_size, work_array, compare)
        i += chunk_size * 2
      end
      chunk_size *= 2
    end
  end

private

  # Merges two arrays in to a new array.
  def self.merge(array, left_position, chunk_size, work_array, compare)
    right_position = left_position + chunk_size
    end_position = [left_position + chunk_size * 2 - 1, array.length - 1].min
    left_index = left_position
    right_index = right_position
    (0..end_position - left_position).each do |i|
      if left_index < right_position and
          (right_index > end_position or
           compare.call(array[left_index], array[right_index]) <= 0)
        work_array[i] = array[left_index]
        left_index += 1
      else
        work_array[i] = array[right_index]
        right_index += 1
      end
    end
    (left_position..end_position).each do |i|
      array[i] = work_array[i - left_position]
    end
  end
end
