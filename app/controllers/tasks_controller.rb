class TasksController < ApplicationController
  
  attr_accessor :completed
  before_filter :find_list
  
  def create
    @task = @list.tasks.new( params.require(:task).permit(:description, :due ))
    if @task.save
      redirect_to user_list_path(current_user, @list)
    else
      redirect_to user_list_path(current_user, @list)
    end
  end
  
  def new
  end
  
  def index
  end
  
  def update
    @task = @list.tasks.find(params[:id])
    if @task.update_attributes(params.require(:task).permit( :description, :due, :completed ))
      redirect_to user_list_path(current_user, @list)
    else
      redirect_to user_list_path(current_user, @list)
  end
end
  
  def complete
    @task = @list.tasks.find(params[:id])
    @task.completed = true
    @task.save
    redirect_to user_list_path(@list)
  end
  
  def find_list
    @list = List.find(params[:list_id])
  end
  
end
