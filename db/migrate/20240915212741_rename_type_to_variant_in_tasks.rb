class RenameTypeToVariantInTasks < ActiveRecord::Migration[7.2]
  def change
    rename_column :tasks, :type, :variant
  end
end
