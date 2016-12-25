# Copyright:: Copyright (c) 2016 Daniel Imms
# License::   MIT License

module RadixSort
  # Sorts an array using radix sort.
  def self.sort(array, radix = 10)
    if array.length <= 1
      return array
    end

    # Determine minimum and maximum values
    minValue = array[0]
    maxValue = array[0]
    (1..array.length - 1).each do |i|
      if array[i] < minValue
        minValue = array[i]
      elsif array[i] > maxValue
        maxValue = array[i]
      end
    end

    # Perform counting sort on each exponent/digit, starting at the least
    # significant digit
    exponent = 1
    while (maxValue - minValue) / exponent >= 1
      countingSortByDigit(array, radix, exponent, minValue)
      exponent *= radix
    end
  end

private

  # Stable sorts an array by a particular digit using counting sort.
  def self.countingSortByDigit(array, radix, exponent, minValue)
    buckets = Array.new(radix)
    output = Array.new(array.length)

    # Initialize bucket
    (0..radix - 1).each do |i|
      buckets[i] = 0
    end

    # Count frequencies
    (0..array.length - 1).each do |i|
      bucketIndex = (((array[i] - minValue) / exponent) % radix).floor
      buckets[bucketIndex] += 1
    end

    # Compute cumulates
    (1..radix - 1).each do |i|
      buckets[i] += buckets[i - 1]
    end

    # Move records
    (array.length - 1).downto(0) do |i|
      bucketIndex = (((array[i] - minValue) / exponent) % radix).floor
      buckets[bucketIndex] -= 1
      output[buckets[bucketIndex]] = array[i]
    end

    # Copy back
    (0..array.length - 1).each do |i|
      array[i] = output[i]
    end
  end
end
