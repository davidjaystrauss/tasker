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
      redirect_to user_list_url(current_user, @list)
    else
      flash[:error] = "Could not create category."
      redirect_to new_user_list_url
    end
  end
  
  def show
    @list = List.find(params[:id])
    @task = @list.tasks.new
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update_attributes( params.require(:list).permit( :name, :description ))
      flash[:notice] = "Category updated."
      redirect_to user_lists_path(current_user, @list)
    else
      flash[:error] = "Could not update category."
      redirect_to edit_user_list_path(current_user, @list)
    end
  end
  
  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      redirect_to user_lists_path
    else
      redirect_to user_lists_path
    end
  end
  
end
