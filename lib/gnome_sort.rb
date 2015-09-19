# Copyright:: Copyright (c) 2015 Daniel Imms
# License::   MIT License

module GnomeSort
  # Sorts an array using gnome sort.
  def sort(array, compare = lambda { |a, b| a <=> b })
    pos = 1
    while pos < array.length
      if compare.call(array[pos], array[pos - 1]) >= 0
        pos += 1
      else
        array[pos], array[pos - 1] = array[pos - 1], array[pos]
        if pos > 1
          pos -= 1
        end
      end
    end
  end
end
