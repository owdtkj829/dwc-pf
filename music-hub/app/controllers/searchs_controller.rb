class SearchsController < ApplicationController
	def search
		if params[:name].present?
	      @artists = Artist.where('name LIKE ?', "%#{params[:name]}%")
	    else
	      @artists = Artist.none
	    end
	end
end
