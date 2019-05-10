class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

def self.first_five
# all.slice(0, 4)

first(5)
end

def self.dinghy
  where('length <= 20')
end

def self.ship
where('length>= 20')
end

def self.last_three_alphabetically
all.order(name: :asc).last(3).sort
end

 def self.without_a_captain
   where(captain: nil)
 end


def self.sailboats
  sailboat = Classification.find_by(name: 'Sailboat')
  sailboat.boats
end

def self.with_three_classifications
 all.select { |boat| boat.classifications.length === 3}
  # all.select
end


end
