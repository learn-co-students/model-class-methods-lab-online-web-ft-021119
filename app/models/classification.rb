class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    all
  end

  def self.longest
    classifications = []
    longest_boat = Boat.order(length: :desc).limit(1).first.id
    join = BoatClassification.where(boat_id: longest_boat)
    join.each do |x|
      classifications << Classification.where(id: x.classification_id).first
    end
    classifications
  end
end
