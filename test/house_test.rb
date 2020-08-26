require './test/test_helper'

class HouseTest < Minitest::Test
  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, "13")
    @room_2 = Room.new(:bedroom, 11, "15")
    @room_3 = Room.new(:living_room, 25, "15")
    @room_4 = Room.new(:basement, 30, "41")
  end

  def test_it_exists
    assert_instance_of House, @house
  end

  def test_can_access_attributes
    assert_equal "$400000", @house.price
    assert_equal "123 sugar lane", @house.address
    assert_equal [], @house.rooms
  end

  def test_can_add_rooms
    assert_equal [], @house.rooms
    @house.add_room(@room_1)
    assert_equal [@room_1], @house.rooms
    @house.add_room(@room_2)
    assert_equal [@room_1, @room_2], @house.rooms
  end

  def test_can_find_if_above_market_average
    assert_equal false, @house.above_market_average?
    big_house = House.new("$1000000", "555 Expensive Drive")
    assert_equal true, big_house.above_market_average?
  end

  def test_can_get_rooms_from_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal [@room_1, @room_2], @house.rooms_from_category(:bedroom)
    assert_equal [@room_4], @house.rooms_from_category(:basement)
    assert_equal [@room_3], @house.rooms_from_category(:living_room)
  end

  def test_can_get_total_area_of_house
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    assert_equal 670, @house.area
    @house.add_room(@room_4)
    assert_equal 1900, @house.area
  end

  def test_can_get_house_details
    big_house = House.new("$1000000", "555 Expensive Drive")
    expected_1 = {"price" => 400000, "address" => "123 sugar lane"}
    assert_equal expected_1, @house.details
    expected_2 = {"price" => 1000000, "address" => "555 Expensive Drive"}
    assert_equal expected_2, big_house.details
  end

  def test_can_get_price_per_square_foot
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal 210.53, @house.price_per_square_foot
    big_house = House.new("$1000000", "555 Expensive Drive")
    big_house.add_room(@room_1)
    big_house.add_room(@room_2)
    big_house.add_room(@room_3)
    big_house.add_room(@room_4)
    assert_equal 526.32, big_house.price_per_square_foot
  end

  def test_can_sort_rooms_by_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal [@room_4, @room_3, @room_2, @room_1], @house.rooms_sorted_by_area
    medium_room = Room.new(:study, 12, "12")
    @house.add_room(medium_room)
    assert_equal [@room_4, @room_3, @room_2, medium_room, @room_1], @house.rooms_sorted_by_area
  end

end
