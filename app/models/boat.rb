class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  private

    def self.first_five
      Boat.all[0..4]
    end

    def self.dinghy
      Boat.select{|boat| boat if boat.length < 20}
    end

    def self.ship
      Boat.select{|boat| boat if boat.length >= 20}
    end
end
