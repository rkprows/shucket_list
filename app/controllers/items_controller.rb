class ItemsController < ApplicationController
	before_action :item, except: [:index, :new, :create]
  def index
  	@items = current_list.items
  end

  def show
  end
  
  def new
  	@item = Item.new
  end

  def create
  	@item = current_list.items.new(item_params)
  	if @item.save
  		redirect_to item_path(@item)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @item.update(item_params)
  		redirect_to item_path(@item)
  	else
  		render :edit
  	end
  end

  def destroy
  	@item.destroy
  	redirect_to items_path
  end

private
	def item_params
		params.require(:item).permit(:name, :description, :complete)
	end

	def item
		@item = current_list.items.find(params[:id])
	end
end

