# encoding: utf-8
require 'helper'

class TestPlZipCodes < Test::Unit::TestCase
  context "a zipcode for street Jaskiniowa and Wielkopolskie region" do
    setup do
      @poznan_code = PlZipCodes.find {|x| x[:street] == "Jaskiniowa" and x[:region] == "Wielkopolskie" }    
    end

    should "return array with one result" do
      assert_equal 1, @poznan_code.size
    end

    should "return array with hash with city in keys" do
      assert_equal true, @poznan_code.map(&:keys)[0].include?(:city)
    end

    should "return array with hash with code in keys" do
      assert_equal true, @poznan_code.map(&:keys)[0].include?(:code)
    end

    should "return array with hash with province in keys" do
      assert_equal true, @poznan_code.map(&:keys)[0].include?(:province)
    end

  end
end
