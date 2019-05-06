class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
  	Boat.all[0..4]
  end


  def self.dinghy
  	Boat.all.select do |boat|
  		boat.length < 20
  	end
  end

  def self.ship
  	Boat.all.select do |boat|
  		boat.length >= 20
  	end
	end


	def self.last_three_alphabetically
		 order(name: :desc)[0..2]
		end

		def self.without_a_captain
			Boat.all.select do |boat|
  			boat.captain == nil
  			end
		end

		def self.sailboats
			includes('classifications').where(classifications: {name: "Sailboat"})
		
       end

       def self.with_three_classifications
        Boat.all.select do |boat|
  		boat.classifications.size == 3
  	    end
       end



       def self.catamaran_operators

       end




end
