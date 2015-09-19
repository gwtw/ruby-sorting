# Copyright:: Copyright (c) 2015 Daniel Imms
# License::   MIT License

module SelectionSort
  # Sorts an array using selection sort.
  def self.sort(array, compare = lambda { |a, b| a <=> b })
    (0..array.length - 1).each do |i|
      minIndex = i
      (i + 1..array.length - 1).each do |j|
        if compare.call(array[j], array[minIndex]) < 0
          minIndex = j
        end
      end
      if minIndex != i
        array[i], array[minIndex] = array[minIndex], array[i]
      end
    end
  end
end
