class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all

  	Classification.all.select do |cls|
  		cls.name
  	end
  end

   def self.longest
   cls = Boat.order(length: :desc).first.classifications
   cls.select do |c|
   	c.name
   end
   end
end
