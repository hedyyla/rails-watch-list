class ListsController < ApplicationController
  before_action :set_list, only: %i[show]

  def index
    @lists = List.all
  end

  def show
    set_list
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    # @list.restaurant = @restaurant
    @list.save
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
