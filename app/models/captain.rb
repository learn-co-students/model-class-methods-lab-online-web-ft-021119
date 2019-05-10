class Captain < ActiveRecord::Base
  has_many :boats


  def self.catamaran_operators
    catamaran = Classification.find_by(name: "Catamaran")
    catamaran.boats.map.each do |boat|
      boat.captain
    end
  end

  def self.sailors
  Boat.sailboats.map(&:captain).compact.uniq
  end

  # def self.motors
  # Boat.motorboats.map(&:captain).compact.uniq
  #    # self.all.first.boats.first.classifications.first.name
  # end
#   def self.sailors
#   self.includes(boats: :classifications).where('classifications.name = ?', 'Sailboat').references(:classifications).uniq
# end

  def self.motorboaters
     all.includes(boats: :classifications).where("classifications.name =?",'Motorboat').references(:classifications).uniq
   end



  def self.talented_seafarers
    where("name IN (?)", self.sailors.pluck(:name) & self.motorboaters.pluck(:name))
    end

    def self.non_sailors
    Captain.all - Captain.sailors
    end

end
