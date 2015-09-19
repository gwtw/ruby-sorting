# Copyright:: Copyright (c) 2015 Daniel Imms
# License::   MIT License

module CountingSort
  # Sorts an array using counting sort.
  def sort(array, max_value)
    buckets = Array.new(max_value + 1)
    sorted_index = 0

    (0..array.length - 1).each do |i|
      if buckets[array[i]].nil?
        buckets[array[i]] = 0
      end
      buckets[array[i]] += 1
    end

    (0..buckets.length - 1).each do |i|
      while not buckets[i].nil? and buckets[i] > 0
        array[sorted_index] = i
        sorted_index += 1
        buckets[i] -= 1
      end
    end
  end
end
