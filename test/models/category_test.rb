require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports")
  end

  test "category should be valid" do
    #Checking that this is going to return true, if it doesn't then this test will fail
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = " "
    #Checking that this is going to return false, if it isn't then this test will fail
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end

  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "name should not be too short" do 
    @category.name = "aa"
    assert_not @category.valid?
  end
end