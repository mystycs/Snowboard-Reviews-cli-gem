class SnowboardReviews::Boards
  attr_accessor :brand, :model, :urlhelper, :price, :id

  @@all = []

  def initialize(snowboard_hash)
    snowboard_hash.collect { |key, value| send("#{key}=", value) }
    @@all << self
  end

  def self.create(snowboard_array)
    snowboard_array.collect { |snowboard_hash| SnowboardReviews::Boards.new(snowboard_hash) }
  end

  def self.all
    @@all
  end
end
