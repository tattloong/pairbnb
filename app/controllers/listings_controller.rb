class ListingsController < ApplicationController

	def index
		@listings = Listing.paginate(:page => params[:page], per_page: 4)
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(allowed_params)
		@listing.save 
		redirect_to listings_path
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		@listing = Listing.find(params[:id])
		@listing.update_attributes(allowed_params)
		redirect_to listings_path

	end

	def destroy 
		@listing = Listing.find(params[:id])
		@listing.destroy
		redirect_to listings_path
	end

	private
	def allowed_params

		params.require(:listing).permit(:property_name, :room_type, :total_guest, :country)

	end


end
