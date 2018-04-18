class Reservation < ApplicationRecord
	
	belongs_to :listing
  	belongs_to :user

  	validate :date_available, on: :create

  	def total_price
  		x = (self.date_out - self.date_in).to_i
  		y = self.listing.price
  		x * y
  	end



private
    def date_available
   self.listing.reservations.each {|r|
       a = (r.date_in..r.date_out).to_a
       # x.pop #<= this doesn't work when user book only 1 night
       # x.shift #<= this doesn't work when user book only 1 night
       b = (date_in..date_out).to_a
       unless (a & b).empty?
         errors.add(:overlap ,"Date overlap")
         break
     end
   }
    end
end


