class AddAssigneeAndCreatedByToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :assignee, :integer
    add_column :tasks, :created_by, :integer
  end
end
