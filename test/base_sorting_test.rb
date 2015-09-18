require 'json'

module BaseSortingTest
  @@data_dir = File.dirname(__FILE__) + '/data'

  def add_all_base_tests
    add_integer_tests
    add_integer_reverse_tests
    add_string_tests
  end

  def add_integer_tests
    integerTests = JSON.parse(File.read("#{@@data_dir}/integer-tests.json"))
    integerTests.each do |test|
      define_method("test_integer_#{test["it"].gsub(" ", "_")}") do
        assert_sort_test(test)
      end
    end
  end

  def add_integer_reverse_tests
    integerReverseTests = JSON.parse(File.read("#{@@data_dir}/integer-reverse-tests.json"))
    integerReverseTests.each do |test|
      define_method("test_integer_reverse_#{test["it"].gsub(" ", "_")}") do
        assert_sort_test(test, lambda { |a, b| b <=> a })
      end
    end
  end

  def add_string_tests
    stringTests = JSON.parse(File.read("#{@@data_dir}/string-tests.json"))
    stringTests.each do |test|
      define_method("test_string_#{test["it"].gsub(" ", "_")}") do
        assert_sort_test(test, lambda { |a, b| a.casecmp b })
      end
    end
  end
end

def assert_sort_test(test, compare = nil)
  result = test['original']
  if compare.nil?
    sort(result)
  else
    sort(result, compare)
  end
  assert_equal test['sorted'], result, test['it']
end