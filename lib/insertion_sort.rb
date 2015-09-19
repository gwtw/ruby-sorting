# Copyright:: Copyright (c) 2015 Daniel Imms
# License::   MIT License

module InsertionSort
  # Sorts an array using insertion sort.
  def self.sort(array, compare = lambda { |a, b| a <=> b })
    (1..array.length - 1).each do |i|
      item = array[i]
      indexHole = i
      while indexHole > 0 and compare.call(array[indexHole - 1], item) > 0
        array[indexHole] = array[indexHole - 1]
        indexHole = indexHole - 1
      end
      array[indexHole] = item
    end
  end
end
