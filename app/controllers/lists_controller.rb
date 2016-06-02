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
<<<<<<< HEAD
      flash[:success] = "List with title #{@list.title} created"
=======
      flash[:success] = "List with name #{@list.title} created"
>>>>>>> ede5357fc3e547361ef862443e45260ec7c060d1
      redirect_to lists_path(@list)
    else
      render :new
    end
  end

  def update
  end

  def destroy
    @list.destroy
      redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:title, :description, :category)
  end

  def list
    @list = current_user.lists.find(params[:id])
  end
end
