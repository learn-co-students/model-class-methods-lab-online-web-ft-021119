class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    #returns all captains of catamarans
    #Captain.all.select {|captain| captain.boats.classifications.map(&:name).include?("Catamaran")}
    classif = Classification.find_by(name: "Catamaran")
    classif.boats.map { |boat| boat.captain} 
  end

  def self.sailors
    #returns captains with sailboats
    Boat.sailboats.map(&:captain).compact.uniq
  end

  def self.talented_seafarers
    sailboat = Boat.sailboats.map(&:captain).compact.uniq
    motorboat = Boat.motorboats.map(&:captain).compact.uniq
    captains = sailboat & motorboat
  end

  def self.non_sailors
    #returns people who are not captains of sailboats
    Captain.all - Captain.sailors
  end
end
