class SnowboardReviews::Boards

  attr_accessor :brand, :model, :urlhelper, :price, :id, :onthesnowfeel, :powder, :turninitiationandcarving, :speed, :flex, :jumps

  @@all = []

  def initialize(snowboard_hash)
    snowboard_hash.collect {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create(snowboard_array)
    snowboard_array.collect {|snowboard_hash| SnowboardReviews::Boards.new(snowboard_hash)}
  end

  def add_board_attributes(attributes_hash)
    attributes_hash.collect{|key,value| self.send(("#{key}="), value)}
  end

  def self.all
    @@all
  end

end