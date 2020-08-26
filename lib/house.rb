class House
  attr_reader :price, :address, :rooms, :details

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
    @details = {
                "price" => price.delete("$").to_i,
                "address" => address
                }
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price.delete("$").to_i > 500000
  end

  def rooms_from_category(category)
    @rooms.select {|room| room.category == category}
  end

  def area
    @rooms.reduce(0) {|total_area, room| total_area += room.area}
  end

  def price_per_square_foot
    (@price.delete("$").to_i / area.to_f).round(2)
  end

end
