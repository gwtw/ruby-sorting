# Copyright:: Copyright (c) 2015 Daniel Imms
# License::   MIT License

module BubbleSortOptimised
  # Sorts an array using the optimised version of bubble sort.
  def self.sort(array, compare = lambda { |a, b| a <=> b })
    unsorted_below = array.length
    while unsorted_below != 0
      last_swap = 0
      (1..unsorted_below - 1).each do |i|
        if compare.call(array[i - 1], array[i]) > 0
          array[i], array[i - 1] = array[i - 1], array[i]
          last_swap = i
        end
      end
      unsorted_below = last_swap
    end
  end
end
