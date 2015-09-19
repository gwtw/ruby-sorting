# Copyright:: Copyright (c) 2015 Daniel Imms
# License::   MIT License

require_relative './insertion_sort'

module BucketSort
  include InsertionSort

  # Sorts an array using bucket sort.
  def self.sort(array, bucket_size = 5)
    if array.empty?
      return
    end

    # Determine minimum and maximum values
    min_value = array.min
    max_value = array.max

    # Initialise buckets
    bucket_count = ((max_value - min_value) / bucket_size).floor + 1
    buckets = Array.new(bucket_count)
    (0..buckets.length - 1).each do |i|
      buckets[i] = []
    end

    # Distribute input array values into buckets
    (0..array.length - 1).each do |i|
      buckets[((array[i] - min_value) / bucket_size).floor].push(array[i])
    end

    # Sort buckets and place back into input array
    array.clear
    (0..buckets.length - 1).each do |i|
      InsertionSort.sort buckets[i]
      buckets[i].each do |value|
        array.push(value)
      end
    end
  end
end
