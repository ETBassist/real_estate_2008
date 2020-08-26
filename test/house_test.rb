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
end
