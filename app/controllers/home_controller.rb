class HomeController < ApplicationController
	def index
    @lists = List.all.paginate(:page => params[:page], :per_page => 6)
  end
end
