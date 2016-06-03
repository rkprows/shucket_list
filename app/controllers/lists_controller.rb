class ListsController < ApplicationController
  before_action :list, except: [:index, :new, :create]

  def index
    @lists = current_user.lists
  end

  def show
    current_user.lists.find(params[:id])
  end

  def edit

  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      flash[:success] = "List with name #{@list.title} created"
      redirect_to lists_path(@list)
    else
      render :new
    end
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
      redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:title, :description, :category, :image)
  end

  def list
    @list = current_user.lists.find(params[:id])
  end
end
