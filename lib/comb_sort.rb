# Copyright:: Copyright (c) 2015 Daniel Imms
# License::   MIT License

module CombSort
  # Sorts an array using comb sort.
  def self.sort(array, compare = lambda { |a, b| a <=> b })
    gap = array.length
    shrink_factor = 1.3
    swapped = false
    while gap > 1 || swapped
      if gap > 1
        gap = (gap / shrink_factor).floor
      end
      swapped = false
      i = 0
      while gap + i < array.length
        if compare.call(array[i], array[i + gap]) > 0
          array[i], array[i + gap] = array[i + gap], array[i]
          swapped = true
        end
        i += 1
      end
    end
  end
end
