class Captain < ActiveRecord::Base
  has_many :boats

  private
    def self.catamaran_operators
      catamaran = Classification.find_by(name: "Catamaran")
      catamaran.boats.map {|boat| boat.captain}
    end

    def self.sailors
      sailboats = Boat.sailboats
      sailboats.map(&:captain).compact!.uniq
    end

    def self.talented_seafarers
      sailboat_class = Classification.find_by(name: "Sailboat")
      motorboat_class = Classification.find_by(name: "Motorboat")
      Captain.all.select do |captain|
        boat_classes = captain.boats.map(&:classifications)
        captain if boat_classes.find(sailboat_class) && boat_classes.find(motorboat_class)
        binding.pry
      end
    end
end
