class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    co = []
    classification = Classification.where(name: "Catamaran")
    BoatClassification.where(classification_id: classification.first.id).each do |x|
      co_id = Boat.where(id: x.boat_id).first.captain_id
      co << Captain.where(id: co_id).first
    end
    co
  end

  def self.sailors
    sail_captains = []
    classification = Classification.where(name: "Sailboat")
    BoatClassification.where(classification_id: classification.first.id).each do |x|
      co_id = Boat.where(id: x.boat_id).first.captain_id
      sail_captains << Captain.where(id: co_id).first
    end
    sail_captains.delete(nil)
    sail_captains.uniq
  end

  def self.talented_seafarers
    motor_captains = []
    classification = Classification.where(name: "Motorboat")
    BoatClassification.where(classification_id: classification.first.id).each do |x|
      mc_id = Boat.where(id: x.boat_id).first.captain_id
      motor_captains << Captain.where(id: mc_id).first
    end
    motor_captains.each do |captain|
      motor_captains.delete(captain) unless sailors.include?(captain)
    end
  end

  def self.non_sailors
    all - sailors
  end
end
