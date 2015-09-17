module InsertionSort
  def sort(array, compare = lambda { |a, b| a <=> b })
    for i in 1..(array.length - 1)
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
