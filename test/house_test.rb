require './test/test_helper'

class HouseTest < Minitest::Test
  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, "13")
    @room_2 = Room.new(:bedroom, 11, "15")
  end

  def test_it_exists
    assert_instance_of House, @house
  end

  def test_can_access_attributes
    assert_equal "$400000", @house.price
    assert_equal "123 sugar lane", @house.address
    assert_equal [], @house.rooms
  end
end
