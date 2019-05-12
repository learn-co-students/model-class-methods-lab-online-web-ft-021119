class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    #returns the first five Boats
    Boat.all[0..4]
  end

  def self.dinghy
    #returns boats shorter than 20 feet
    Boat.select{|boat| boat.length < 20}
  end

  def self.ship
    #returns boats 20 feet or longer
    Boat.select{|boat| boat.length >= 20}
  end

  def self.last_three_alphabetically
    #returns last three boats in alphabetical order
    Boat.order('name DESC').first(3)
  end

  def self.without_a_captain
    #returns boats without a captain
    Boat.where("captain_id is NULL")
  end

  def self.sailboats
    #returns all boats that are sailboats
    Boat.all.select {|boat| boat.classifications.map(&:name).include?("Sailboat")}
  end

  def self.motorboats
    motorboat = Classification.find_by(name: "Motorboat")
    motorboat.boats
  end

  def self.with_three_classifications
    #returns boats with three classifications
    Boat.all.select {|boat| boat.classifications.count == 3}
  end

  def self.longest
    Boat.order(length: :desc).first
  end
end
