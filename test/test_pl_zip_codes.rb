# encoding: utf-8
require 'helper'

class TestPlZipCodes < Test::Unit::TestCase
  context "a parsed 'Ernest' name" do
    setup do
      @name = PolishNames.parse_name("Ernest")
    end

    should "return flexive form for the input name" do
      assert_equal 'Erneście', @name[:flexive]
    end

    should "return gender of the bearer" do
      assert_equal :male, @name[:gender]
    end
  end
end
