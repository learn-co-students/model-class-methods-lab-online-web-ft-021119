class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications


  def self.first_five
    first(5)
  end

  def self.dinghy
    where("length < 20")
  end

  def self.ship
    where("length >= 20")
  end

  def self.last_three_alphabetically
    all.order(name: :desc).first(3)
  end

  def self.without_a_captain
    where(captain: nil)
  end

  def self.sailboats
    includes(:classifications).where(classifications: {name: "Sailboat"})
  end

  def self.with_three_classifications
    Boat.all.select {|boat| boat.classifications.count == 3}
  end

end
