class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    @captains = Boat.catamarans.map(&:captain).compact.uniq
  end

  def self.sailors
    @captains = Boat.sailboats.map(&:captain).compact.uniq
  end

  def self.talented_seafarers
    @captains = Boat.motorboats.map(&:captain).compact & Boat.sailboats.map(&:captain).compact
  end

  def self.non_sailors
    @captains = Captain.all - Captain.sailors
  end
end
