class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    @boats = Boat.all[0..4]
  end

  def self.dinghy
    @boats = Boat.where("length < ?", 20)
  end

  def self.ship
    @boats = Boat.where("length >= ?", 20)
  end

  def self.last_three_alphabetically
    @boats = (Boat.all.sort_by{|b| b.name.downcase}).last(3).reverse
  end

  def self.without_a_captain
    @boats = Boat.where("captain_id is NULL")
  end

  def self.sailboats
    @boats = Boat.all.select {|boat| boat.classifications.map(&:name).include?("Sailboat")}
  end

  def self.catamarans
    @boats = Boat.all.select {|boat| boat.classifications.map(&:name).include?("Catamaran")}
  end

  def self.motorboats
    @boats = Boat.all.select {|boat| boat.classifications.map(&:name).include?("Motorboat")}
  end

  def self.with_three_classifications
    @boats = Boat.all.select {|boat| boat.classifications.count == 3}
  end

  def self.longest
    Boat.all.sort_by{|b| b.length}.last
  end









end
