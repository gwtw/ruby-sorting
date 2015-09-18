module SelectionSort
  def sort(array, compare = lambda { |a, b| a <=> b })
    for i in 0..(array.length - 1)
      minIndex = i
      for j in (i + 1)..(array.length - 1)
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
