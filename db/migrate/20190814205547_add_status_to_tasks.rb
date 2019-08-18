class AddStatusToTasks < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TYPE task_status AS ENUM ('To Do', 'In Progress', 'In Review', 'Done');
      ALTER TABLE tasks ADD status task_status;
    SQL
  end

  def down
    execute <<-SQL
      DROP TYPE task_status;
    SQL
    remove_column :tasks, :status
  end
end
