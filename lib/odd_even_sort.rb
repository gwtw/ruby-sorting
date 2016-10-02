# Copyright:: Copyright (c) 2015 Daniel Imms
# License::   MIT License

module OddEvenSort
  # Sorts an array using odd-even sort.
  def self.sort(array, compare = lambda { |a, b| a <=> b })
    sorted = false
    while !sorted
      sorted = self.innerSort(array, 1, compare)
      sorted = self.innerSort(array, 0, compare) && sorted
    end
  end

private

  # Compares every second element of an array with its following element and
  # swaps it if not in order using a compare function
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
