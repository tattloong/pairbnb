class WelcomeController < ApplicationController
	def show
		@listings = Listing.all
		#@listings = Listing.paginate(:page => params[:page], per_page: 4)
	end
end
