module BubbleSort
  def sort(array, compare = lambda { |a, b| a <=> b })
    (0..array.length - 1).each do |i|
      (1..array.length - 1).each do |j|
        if compare.call(array[j - 1], array[j]) > 0
          array[j], array[j - 1] = array[j - 1], array[j]
        end
      end
    end
  end
end
