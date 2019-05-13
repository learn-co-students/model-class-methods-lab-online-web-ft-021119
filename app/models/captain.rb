class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    catamaran = Classification.find_by(name: "Catamaran")
    catamaran.boats.collect{|boat| boat.captain}
  end

  def self.sailors
    sailboat = Classification.find_by(name: "Sailboat")
    #binding.pry
    sailboat.boats.collect{|boat| boat.captain}.compact.uniq
  end

  def self.talented_seafarers
    motorboat = Classification.find_by(name: "Motorboat")
    motor_cap = motorboat.boats.collect{|boat| boat.captain}.compact.uniq
    sailboat = Classification.find_by(name: "Sailboat")
    sail_cap = sailboat.boats.collect{|boat| boat.captain}.compact.uniq
    motor_cap & sail_cap
  end

  def self.non_sailors
    Captain.all - Captain.sailors
  end
end
