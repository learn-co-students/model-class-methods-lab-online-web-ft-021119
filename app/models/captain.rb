class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    includes(boats: :classifications).where(classifications: {name: "Catamaran"})
  end

  def self.sailors
    includes(boats: :classifications).where(classifications: {name: "Sailboat"}).distinct
  end

  def self.motorboat_operators
    includes(boats: :classifications).where(classifications: {name: "Motorboat"})
  end

  def self.talented_seafarers
    sail_caps = Boat.sailboats.map(&:captain).uniq
    motor_caps = Boat.motorboats.map(&:captain).uniq
    seafarers = sail_caps & motor_caps
  end

  def self.non_sailors
    self.all - self.sailors
  end
  
end
