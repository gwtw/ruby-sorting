module BubbleSort
  def sort(array, compare = lambda { |a, b| a <=> b })
    for i in 0..(array.length - 1)
      for j in 1..(array.length - 1)
        if compare.call(array[j - 1], array[j]) > 0
          array[j], array[j - 1] = array[j - 1], array[j]
        end
      end
    end
  end
end
