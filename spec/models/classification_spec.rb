require 'spec_helper'

describe Classification do
  describe "::my_all" do
    it "returns all classifications" do
      classifications = ["Ketch", "Sailboat", "Catamaran", "Sloop", "Motorboat", "Center Console", "RIB", "Trawler", "Cat Rig Boat", "Bass Boat", "Pontoon Boat"]
      expect(Classification.my_all.pluck(:name).uniq).to eq(classifications)
    end
  end

  describe "#longest" do
    it "returns the classifications for the longest boat" do
      classifications = ["Motorboat", "Center Console"]
      expect(Classification.longest.pluck(:name)).to eq(classifications)
    end
  end
end


# :: is a scope resolution operator, it effectively means "in the namespace", so ActiveRecord::Base means "Base, in the namespace of ActiveRecord"
#
# A constant being resolved outside of any namespace means exactly what it sounds like - a constant not in any namespace at all.
#
# It's used in places where code may be ambiguous without it:
#
# module Document
#   class Table # Represents a data table
#
#     def setup
#       Table # Refers to the Document::Table class
#       ::Table # Refers to the furniture class
#     end
#
#   end
# end
#
# class Table # Represents furniture
# end
