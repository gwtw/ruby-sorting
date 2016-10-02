# Copyright:: Copyright (c) 2015 Daniel Imms
# License::   MIT License

module OddEvenSort
  # Sorts an array using odd-even sort.
  def self.sort(array, compare = lambda { |a, b| a <=> b })
    sorted = false
    while !sorted
      sorted = self.innerSort(array, 1, compare)
      sorted = sorted && self.innerSort(array, 0, compare)
    end
  end

private

  # Performs a bubble sort iteration with a specific start index
  def self.innerSort(array, start, compare)
    sorted = true
    (start..array.length - 2).step(2) do |i|
      if compare.call(array[i], array[i + 1]) > 0
        array[i], array[i + 1] = array[i + 1], array[i]
        sorted = false
      end
    end
    return sorted
  end
end
