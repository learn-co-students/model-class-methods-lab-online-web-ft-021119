class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    first(5)
  end

  def self.dinghy
    where(length: (0..20))
  end

  def self.ship
    where.not(length: (0..20))
  end

  def self.last_three_alphabetically
    order(name: :desc).first(3)
  end

  def self.without_a_captain
    where(captain_id: nil)
  end

  def self.sailboats
    sailboats = []
    classification = Classification.where(name: "Sailboat")
    BoatClassification.where(classification_id: classification.first.id).each do |x|
      sailboats << Boat.where(id: x.boat_id).first
    end
    sailboats
  end

  def self.with_three_classifications
    multi_class = []
    three_class = []
    all.each do |boat|
      boat_class = BoatClassification.where(boat_id: boat.id)
      multi_class << boat_class if boat_class.length >= 3
    end
    multi_class.each do |boat|
      boat.delete unless boat.length == 3
      three_class << Boat.where(id: boat.first.boat_id).first
    end
    three_class
  end
end
