class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    cat_operators = self.all.collect do |captain|
      captain if captain.boats.any? do |boat|
        boat.classifications.any?{|classification| classification.name == "Catamaran"}
      end
    end
    cat_operators.compact
  end

  def self.sailors
    sailboat_operators = self.all.collect do |captain|
      captain if captain.boats.any? do |boat|
        boat.classifications.any?{|classification| classification.name == "Sailboat"}
      end
    end
    sailboat_operators.compact
  end

  def self.talented_seafarers
    talented_sf = self.sailors.collect do |captain|
      captain if captain.boats.any?{|boat| boat.classifications.any?{|classification| classification.name == "Motorboat"}}
    end
    talented_sf.compact
  end

  def self.non_sailors
    non_sailor = self.all.collect do |captain|
      captain if captain.boats.none? do |boat|
        boat.classifications.any?{|classification| classification.name == "Sailboat"}
      end
    end
    non_sailor.compact
  end

end
