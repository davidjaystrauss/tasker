class ListsController < ApplicationController
  
  def index
   @lists = List.all
  end
  
  def new
    @list = List.new
  end
  
  def create
    @list = List.new( params.require(:list).permit( :name, :description ))
    if @list.save
      flash[:notice] = "Category created."
      redirect_to list_url(@list)
    else
      flash[:error] = "Could not create category."
      redirect_to new_list_url
    end
  end
  
  def show
    @list = List.find(params[:id])
  end
  
end
