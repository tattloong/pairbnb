class ListingsController < ApplicationController
before_action :check_user, except:[:show]
before_action :check_admin, except:[:show]

	def index
		@listings = current_user.listings
		@listings = current_user.listings.paginate(:page => params[:page], per_page: 4)
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = current_user.listings.new(allowed_params)
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

	def check_user
		if signed_in?
		else
			redirect_to root_path
		end
	end

		def check_admin
		if current_user.role == 'admin'
		else
			redirect_to root_path
		end
	end


end
