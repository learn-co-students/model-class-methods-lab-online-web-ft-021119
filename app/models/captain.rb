class Captain < ActiveRecord::Base
  has_many :boats
  def self.catamaran_operators
    includes(boats: :classifications).where("classifications.name": "Catamaran")
  end

  def self.sailors
    includes(boats: :classifications).where("classifications.name": "Sailboat").uniq
  end

  #add this for talented_seafarers
  def self.motorboat_operators
    includes(boats: :classifications).where("classifications.name": "Motorboat").uniq
  end

  def self.talented_seafarers
    where("id IN (?)", self.sailors.pluck(:id) & self.motorboat_operators.pluck(:id))
    #includes(boats: :classifications).where("classifications.name": "Sailboat" && "Motorboat").uniq
  end

  def self.non_sailors
    where.not("id IN (?)",self.sailors.pluck(:id))
  end
end
