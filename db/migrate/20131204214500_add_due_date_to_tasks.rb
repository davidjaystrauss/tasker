class AddDueDateToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :due, :date
  end
end
