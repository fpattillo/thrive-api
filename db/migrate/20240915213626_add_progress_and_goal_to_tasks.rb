class AddProgressAndGoalToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :progress, :integer, default: 0
    add_column :tasks, :goal, :integer, default: 100
  end
end
