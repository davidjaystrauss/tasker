class TasksController < ApplicationController
  
  attr_accessor :completed
  before_filter :find_list
  
  def create
    @task = @list.tasks.new( params.require(:task).permit(:description ))
    if @task.save
      redirect_to list_path(@list)
    else
      redirect_to list_path(@list)
    end
  end
  
  def new
  end
  
  def index
  end
  
  def complete
    @task = @list.tasks.find(params[:id])
    @task.completed = true
    @task.save
    redirect_to list_path(@list)
  end
  
  def find_list
    @list = List.find(params[:list_id])
  end
  
end
