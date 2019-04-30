class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  private

    def self.first_five
      Boat.all[0..4]
    end

    def self.dinghy
      Boat.select{|boat| boat.length < 20}
    end

    def self.ship
      Boat.select{|boat| boat.length >= 20}
    end

    def self.last_three_alphabetically
      Boat.order(name: :desc).first(3)
    end

    def self.without_a_captain
      Boat.where(captain: nil)
    end

    def self.sailboats
      sailboat = Classification.find_by(name: "Sailboat")
      sailboat.boats
    end

    def self.motorboats
      motorboat = Classification.find_by(name: "Motorboat")
      motorboat.boats
    end

    def self.with_three_classifications
      Boat.all.select {|boat| boat.classifications.count == 3}
    end

    def self.longest
      Boat.order(length: :desc).first
    end
end
