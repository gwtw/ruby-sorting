require 'json'

module TestHelper
  @@data_dir = File.dirname(__FILE__) + '/data'

  def add_all_base_tests(sort_module)
    add_integer_tests sort_module
    add_integer_reverse_tests sort_module
    add_string_tests sort_module
  end

  def add_integer_tests(sort_module)
    integerTests = JSON.parse(File.read("#{@@data_dir}/integer-tests.json"))
    integerTests.each do |test|
      define_method("test_integer_#{test["it"].gsub(" ", "_")}") do
        assert_sort_test sort_module, test
      end
    end
  end

  def add_integer_reverse_tests(sort_module)
    integerReverseTests = JSON.parse(File.read("#{@@data_dir}/integer-reverse-tests.json"))
    integerReverseTests.each do |test|
      define_method("test_integer_reverse_#{test["it"].gsub(" ", "_")}") do
        assert_sort_test sort_module, test, lambda { |a, b| b <=> a }
      end
    end
  end

  def add_string_tests(sort_module)
    stringTests = JSON.parse(File.read("#{@@data_dir}/string-tests.json"))
    stringTests.each do |test|
      define_method("test_string_#{test["it"].gsub(" ", "_")}") do
        assert_sort_test sort_module, test, lambda { |a, b| a.casecmp b }
      end
    end
  end
end

def assert_sort_test(sort_module, test, sort_arg = nil)
  result = test['original']
  if sort_arg.nil?
    if sort_module.methods.include? :sort!
      sort_module.sort! result
    else
      sort_module.sort result
    end
  else
    if sort_module.methods.include? :sort!
      sort_module.sort! result, sort_arg
    else
      sort_module.sort result, sort_arg
    end
  end
  assert_equal test['sorted'], result, test['it']
end