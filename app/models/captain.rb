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
      sail_caps = Boat.sailboats.map(&:captain).uniq
      motor_caps = Boat.motorboats.map(&:captain).uniq
      seafarers = sail_caps & motor_caps
    end

    def self.non_sailors
      Captain.all - sail_caps = Boat.sailboats.map(&:captain).uniq
    end
end
