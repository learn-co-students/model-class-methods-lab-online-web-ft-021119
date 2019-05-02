class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    self.all[0..4]
  end

  def self.dinghy
    dinghys = self.all.collect{|boat| boat if boat.length < 20}
    dinghys.compact
  end

  def self.ship
    ships = self.all.collect{|boat| boat if boat.length >= 20}
    ships.compact
  end

  def self.last_three_alphabetically
    self.all.sort_by{|boat| boat.name}.last(3).reverse
  end

  def self.without_a_captain
    self.all.collect{|boat| boat if boat.captain == nil}.compact
  end

  def self.sailboats
    sailboats = self.all.collect do |boat|
      boat if boat.classifications.any?{|classification| classification.name == "Sailboat"}
    end
    sailboats.compact
  end

  def self.with_three_classifications
    three_classes = self.all.collect{|boat| boat if boat.classifications.count == 3}
    three_classes.compact
  end

end
